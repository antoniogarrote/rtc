#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "lib/rtc/annot_lexer.rex".
#++

require 'racc/parser'
########################################################################
# The latest rexical generator on github supports matching against the 
# end of string. For this file to work correctly, you MUST use the
# latest upstream rexical.
########################################################################


# ######################################################################
# DRuby annotation language parser
# Adapted directly from DRuby source file typeAnnotationLexer.mll
# Version of GitHub DRuby repo commit 0cda0264851bcdf6b301c3d7f564e9a3ee220e45
# ######################################################################
module Rtc
class TypeAnnotationParser < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    

    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/[\t ]+/))
        ;

      when (text = @ss.scan(/\n[\t ]*\=begin/))
         action { @state = :COMMENT }

      when (text = @ss.scan(/class /))
         action { [:K_CLASS, text] }

      when (text = @ss.scan(/metaclass /))
         action { [:K_METACLASS, text]}

      when (text = @ss.scan(/require /))
         action { [:K_MODULE, text] }

      when (text = @ss.scan(/alias /))
         action { [:K_ALIAS, text] }

      when (text = @ss.scan(/require /))
         action { [:K_REQUIRE, text] }

      when (text = @ss.scan(/end /))
         action { [:K_END, text] }

      when (text = @ss.scan(/type /))
         action { [:K_TYPE, text] }

      when (text = @ss.scan(/typevar /))
         action { [:K_TYPEVAR, text] }

      when (text = @ss.scan(/or/))
         action { [:K_OR, text] }

      when (text = @ss.scan(/self/))
         action { [:K_SELF, text] }

      when (text = @ss.scan(/[a-z_]+\w*\'?/))
         action { [:T_LOCAL_ID, text] }

      when (text = @ss.scan(/[A-Z]+\w*/))
         action { [:T_CONST_ID, text] }

      when (text = @ss.scan(/([A-Za-z_]+\w*|self)\.(\w|\[|\]|=)+[\?\!\=]?/))
         action { [:T_SCOPED_ID, text] }

      when (text = @ss.scan(/[A-Za-z_]+\w*[\?\!\=]/))
         action { [:T_SUFFIXED_ID, text] }

      when (text = @ss.scan(/:[A-Za-z_][A-Za-z_0-9]*/))
         action { [:T_SYMBOL, text] }

      when (text = @ss.scan(/\*/))
         action { [:T_STAR, text] }

      when (text = @ss.scan(/\?/))
         action { [:T_QUESTION, text] }

      when (text = @ss.scan(/\^/))
         action { [:T_CARROT, text] }

      when (text = @ss.scan(/\@FIXME/))
         action {fail "ERROR at line #{lineno}: " +
                                        "deprecated @@FIXME in '#{text}', " +
                                        "use !FIXME"}


      when (text = @ss.scan(/'[^']*'/))
         action { [:T_STRING, text.gsub("'", "")] }

      when (text = @ss.scan(/\<\=/))
         action { [:T_SUBTYPE, text] }

      when (text = @ss.scan(/@[A-Za-z_]+\w*/))
         action { [:T_IVAR, text] }

      when (text = @ss.scan(/@@[A-Za-z_]+\w*/))
         action { [:T_CVAR, text] }

      when (text = @ss.scan(/\$[A-Za-z_]+\w*/))
         action { [:T_GVAR, text] }

      when (text = @ss.scan(/\!/))
         action { [:T_BANG, text] }

      when (text = @ss.scan(/\::/))
         action { [:T_DOUBLE_COLON, text] }

      when (text = @ss.scan(/\:/))
         action { [:T_COLON, text] }

      when (text = @ss.scan(/\./))
         action { [:T_DOT, text] }

      when (text = @ss.scan(/->/))
         action { [:T_RARROW, text] }

      when (text = @ss.scan(/\(/))
         action { [:T_LPAREN, text] }

      when (text = @ss.scan(/\)/))
         action { [:T_RPAREN, text] }

      when (text = @ss.scan(/\[/))
         action { [:T_LBRACKET, text] }

      when (text = @ss.scan(/\]/))
         action { [:T_RBRACKET, text] }

      when (text = @ss.scan(/,/))
         action { [:T_COMMA, text] }

      when (text = @ss.scan(/\{/))
         action { [:T_LBRACE, text] }

      when (text = @ss.scan(/\}/))
         action { [:T_RBRACE, text] }

      when (text = @ss.scan(/</))
         action { [:T_LESS, text] }

      when (text = @ss.scan(/>/))
         action { [:T_GREATER, text] }

      when (text = @ss.scan(/;/))
         action { [:T_SEMICOLON, text] }

      when (text = @ss.scan(/\n/))
         action { }

      when (text = @ss.scan(/\=/))
         action { [:T_EQUAL, text] }

      when (text = @ss.scan(/$/))
         action { @state = :END; [:T_EOF, ""] }

            when @@ss.scan(/$/)
         ;

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    when :END
      case
      when (text = @ss.scan(/$/))
         action { }

            when @@ss.scan(/$/)
         ;

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    when :COMMENT
      case
      when (text = @ss.scan(/[\t ]*\=end[^\n]*\n/))
         action { state = nil }

      when (text = @ss.scan(/[^\n]*\n/))
        ;

            when @@ss.scan(/$/)
         ;

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

  def set_pos_ctx(this_pos, this_ctx)
    @pos = this_pos
    @ctx = this_ctx
  end
  def unset_pos_ctx
    @pos = nil
    @ctx = nil
  end
  def scan_str(str)
    scan_setup(str)
    @yydebug = true
    begin
      r = do_parse
    rescue => e
      fail e
    end
    r
  end
end # class

end
