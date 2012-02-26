require "test/unit"
require 'rtc'

class MyClass
  rtc_annotated
  
  typesig("simple_method: (Fixnum) -> Fixnum")
  def simple_method(arg)
    arg + 1
  end
  
  typesig("bad_return: () -> Fixnum")
  def bad_return
    "foo"
  end
  
  typesig("subtype_arg: (Integer) -> Integer")
  def subtype_checking(arg)
    arg + 1
  end
  
  # a method where the formal parameter lists does not match the
  # given type annotation 
  typesig("different_formals: (Fixnum,?String,*Fixnum,Fixnum) -> Fixnum")
  def different_formals(*a)
    a[0] + a[-1]
  end

  typesig("union_arg: (:foo or :bar) -> Fixnum")
  def union_arg(b)
    5
  end
  
  typesig("parameterized_arg: (Array<:subscribers or :talks or :subscribed_talks>) -> Fixnum")
  def parameterized_arg(b)
    6
  end
  
  typesig("union_return: (Fixnum) -> Fixnum or String")
  def union_return(a)
    if a < 10
      return 0
    else
      return "hello world!"
    end
  end
  
  typesig("intersection_type: (Fixnum, Fixnum) -> Fixnum")
  typesig("intersection_type: (String) -> String")
  def intersection_type(a,b = nil)
    if b.nil?
      a + "1"
    else
      a + b + 5
    end
  end
end


class TestTypeChecking < Test::Unit::TestCase
 
  attr_reader :test_instance 
 
  def initialize(*)
    @test_instance = MyClass.new
    Rtc::Types::NominalType.of(Array).type_parameters = [Rtc::Types::TypeParameter.new(:t)]
    super
  end
 
  def test_simple
    assert_nothing_raised do
      test_instance.simple_method(5)
    end
    assert_raise Rtc::TypeMismatchException do
      test_instance.simple_method("foo")
    end
  end
  
  def test_bad_return
    assert_raise Rtc::TypeMismatchException do
      test_instance.bad_return
    end
  end
  
  def test_union_return()
    assert_nothing_raised do
      test_instance.union_return(1)
      test_instance.union_return(11)
    end
  end
  
  def test_union_args
    assert_nothing_raised do
      test_instance.union_arg(:foo)
      test_instance.union_arg(:bar)
    end
  end
  
  def test_subtype_checking
    assert_nothing_raised do
      test_instance.subtype_checking(4)
    end
  end
  
  def test_different_formals
    assert_nothing_raised do
      test_instance.different_formals(1,5)
    end
  end
  
  def test_complex_parameters
    assert_nothing_raised do
      test_instance.different_formals(1,"foo",5)
      test_instance.different_formals(1,4)
      test_instance.different_formals(1,"foo",4,5,6,7,8)
    end
    assert_raise Rtc::TypeMismatchException do
      test_instance.different_formals(1,2,5)
    end
    
    assert_raise Rtc::TypeMismatchException do
      test_instance.different_formals(1,"foo","bar",5)
    end
    
    assert_raise Rtc::TypeMismatchException do
      test_instance.different_formals(1,"foo",4,"bar",5)
    end
  end
   
   def test_parameterized_arg
     assert_nothing_raised do
       test_instance.parameterized_arg([:subscribers, :talks])
       test_instance.parameterized_arg([:subscribers])
       test_instance.parameterized_arg([:talks])
       test_instance.parameterized_arg([:subscribed_talks])
     end
     
     assert_raise Rtc::TypeMismatchException do
       # misspelled symbol
       test_instance.parameterized_arg([:tals])
     end
     assert_raise Rtc::TypeMismatchException do
      test_instance.parameterized_arg([:talks, :foobar])
     end
   end
   
end