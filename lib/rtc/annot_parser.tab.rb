#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.7
# from Racc grammer file "".
#

require 'racc/parser.rb'


require 'rtc/annot_lexer.rex'
require 'rtc/parser'
require 'rtc/typing/types.rb'

module Rtc

  class TypeAnnotationParser < Racc::Parser

    attr_accessor :pos, :proxy

    # FIXME(rwsims): it's not clear what proxy is for, it's used when defining
    # class constants for doing class type signatures.
    def initialize(proxy)
        @proxy = proxy
    end

    def strip_quotes(arg)
      arg.strip.gsub(/^\"/, "").gsub(/\"$/, "")
    end

    # ####################
    # helper methods for type constructors from ML parser
    # ####################

    
    def pragma(key)
      fail "Unknown pragma keyword: #{key}" if(key !="FIXME")
    end

  end

class TypeAnnotationParser < Racc::Parser

module_eval(<<'...end annot_parser.racc/module_eval...', 'annot_parser.racc', 311)

...end annot_parser.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
    11,    47,    12,    32,    32,   113,    47,    80,    79,    49,
     8,    47,    47,    91,   -16,    32,    56,    58,    57,    49,
    49,    47,    60,    31,    31,    65,    59,    77,    46,    49,
   -15,   -15,   -15,    46,   -12,    31,    47,    53,    46,    46,
    32,    56,    58,    57,    49,    38,    76,    60,    46,   106,
    47,    59,    26,    31,    32,    56,    58,    57,    49,   105,
    31,    60,    53,    46,    47,    59,    26,    97,    32,    56,
    58,    57,    49,    98,    31,    60,    53,    46,    47,    59,
    99,   100,    32,    56,    58,    57,    49,    26,    31,    60,
    53,    46,    47,    59,    76,    69,    32,    56,    58,    57,
    49,    47,    31,    60,    53,    46,    47,    59,    31,    49,
    32,    56,    58,    57,    49,    47,    31,    60,    53,    46,
    67,    59,    26,    49,    41,   107,    43,   108,    46,   109,
    31,    21,    53,    46,    40,    19,    42,   110,    22,    47,
    23,    24,    46,    32,    56,    58,    57,    49,   111,    64,
    60,    44,    81,    47,    59,   114,    63,    32,    56,    58,
    57,    49,   116,    31,    60,    53,    46,    47,    59,    62,
   118,    32,    56,    58,    57,    49,   119,    31,    60,    53,
    46,    47,    59,   120,    37,    32,    56,    58,    57,    49,
    26,    31,    60,    53,    46,    47,    59,    16,    15,    32,
    56,    58,    57,    49,    14,    31,    60,    53,    46,    47,
    59,    26,    26,    32,    56,    58,    57,    49,    13,    31,
    60,    53,    46,   129,    59,    27,    28,    29,   130,    26,
    21,    86,   nil,    31,   nil,    53,    46,    22,   nil,    23,
    24,    21,    86,   nil,   nil,    21,    86,   nil,    22,   nil,
    23,    24,    22,   nil,    23,    24,   -14,   -14,   -14 ]

racc_action_check = [
     0,    98,     0,    11,    12,    96,    49,    54,    51,    98,
     0,    57,   105,    61,    30,    57,    57,    57,    57,    57,
   105,    42,    57,    11,    12,    30,    57,    45,    98,    42,
     0,     0,     0,    49,    17,    57,    58,    57,    57,   105,
    58,    58,    58,    58,    58,    17,    44,    58,    42,    84,
   108,    58,    43,    67,   108,   108,   108,   108,   108,    84,
    58,   108,    58,    58,    60,   108,    41,    70,    60,    60,
    60,    60,    60,    71,   108,    60,   108,   108,    62,    60,
    73,    75,    62,    62,    62,    62,    62,    76,    60,    62,
    60,    60,    63,    62,    77,    34,    63,    63,    63,    63,
    63,    69,    62,    63,    62,    62,    64,    63,    32,    69,
    64,    64,    64,    64,    64,    40,    63,    64,    63,    63,
    31,    64,     9,    40,    18,    85,    19,    86,    69,    87,
    64,     9,    64,    64,    18,     9,    19,    88,     9,    26,
     9,     9,    40,    26,    26,    26,    26,    26,    90,    29,
    26,    26,    56,   100,    26,    97,    28,   100,   100,   100,
   100,   100,    99,    26,   100,    26,    26,   119,   100,    27,
   101,   119,   119,   119,   119,   119,   102,   100,   119,   100,
   100,    80,   119,   104,    13,    80,    80,    80,    80,    80,
   106,   119,    80,   119,   119,    79,    80,     7,     6,    79,
    79,    79,    79,    79,     5,    80,    79,    80,    80,    91,
    79,   114,   116,    91,    91,    91,    91,    91,     1,    79,
    91,    79,    79,   121,    91,    10,    10,    10,   129,   130,
   109,   109,   nil,    91,   nil,    91,    91,   109,   nil,   109,
   109,    59,    59,   nil,   nil,   110,   110,   nil,    59,   nil,
    59,    59,   110,   nil,   110,   110,     8,     8,     8 ]

racc_action_pointer = [
    -6,   218,   nil,   nil,   nil,   199,   193,   192,   220,    96,
   189,   -16,   -15,   184,   nil,   nil,   nil,    29,   106,   108,
   nil,   nil,   nil,   nil,   nil,   nil,   124,   151,   138,   131,
     9,   101,    69,   nil,    67,   nil,   nil,   nil,   nil,   nil,
   100,    40,     6,    26,    14,     0,   nil,   nil,   nil,    -9,
   nil,     4,   nil,   nil,   -21,   nil,   130,    -4,    21,   206,
    49,    11,    63,    77,    91,   nil,   nil,    14,   nil,    86,
    38,    71,   nil,    51,   nil,    78,    61,    62,   nil,   180,
   166,   nil,   nil,   nil,    31,    94,   109,   127,   135,   nil,
   121,   194,   nil,   nil,   nil,   nil,   -24,   137,   -14,   144,
   138,   137,   173,   nil,   154,    -3,   164,   nil,    35,   195,
   210,   nil,   nil,   nil,   185,   nil,   186,   nil,   nil,   152,
   nil,   194,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   210,
   203,   nil ]

racc_action_default = [
   -11,   -70,    -1,    -2,    -3,   -70,   -70,   -70,   -10,   -70,
   -70,   -70,   -70,   -70,    -7,    -8,    -9,   -11,   -70,   -70,
   -24,   -25,   -26,   -27,   -28,   -29,   -70,   -70,   -70,   -70,
   -15,   -40,   -70,   -43,   -60,   -61,   -62,   132,   -10,   -13,
   -70,   -70,   -70,   -70,   -32,   -70,   -36,   -37,   -38,   -70,
   -44,   -45,   -47,   -48,   -49,   -50,   -70,   -70,   -70,   -68,
   -70,   -57,   -70,   -70,   -70,   -14,   -17,   -70,   -42,   -70,
   -70,   -34,   -21,   -70,   -23,   -70,   -70,   -32,   -39,   -70,
   -70,   -51,   -52,   -53,   -70,   -70,   -70,   -64,   -65,   -69,
   -70,   -70,    -4,    -5,    -6,   -41,   -70,   -70,   -70,   -70,
   -70,   -70,   -70,   -46,   -70,   -70,   -70,   -54,   -70,   -70,
   -70,   -56,   -58,   -59,   -70,   -35,   -70,   -30,   -33,   -70,
   -55,   -70,   -19,   -63,   -66,   -67,   -20,   -22,   -31,   -70,
   -70,   -18 ]

racc_goto_table = [
    20,    45,    89,    68,    71,     5,    71,    70,    75,    73,
     6,    92,    93,    94,    34,    34,    35,    36,    82,    83,
     2,     3,    39,     4,    78,    30,    18,   103,    17,    85,
     7,     1,    72,    71,    74,    90,    96,   nil,    95,   nil,
    66,   102,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   117,
   nil,   nil,   124,   125,   nil,   104,   nil,   123,   nil,   nil,
   nil,   nil,    71,   nil,   nil,   115,   112,   101,   128,    71,
   nil,   nil,   121,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   122,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   126,   nil,   127,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   131 ]

racc_goto_check = [
    16,    19,    30,    22,    20,     7,    20,    15,    18,    15,
     8,     6,     6,     6,    23,    23,    28,    28,    25,    25,
     2,     3,     7,     4,    21,     5,    14,    24,    11,    27,
     9,     1,    16,    20,    16,    19,    15,   nil,    22,   nil,
     8,    18,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     6,
   nil,   nil,    30,    30,   nil,    19,   nil,     6,   nil,   nil,
   nil,   nil,    20,   nil,   nil,    15,    19,    16,     6,    20,
   nil,   nil,    15,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    16,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    16,   nil,    16,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    16 ]

racc_goto_pointer = [
   nil,    31,    20,    21,    23,    15,   -51,     5,    10,    30,
   nil,    19,   nil,   nil,    17,   -33,    -9,   nil,   -36,   -25,
   -36,   -25,   -29,     3,   -52,   -39,   nil,   -30,     5,   nil,
   -57 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,    61,   nil,   nil,   nil,
     9,   nil,    10,    88,    84,   nil,   nil,    25,   nil,   nil,
    52,    48,    33,    54,    50,    51,    55,   nil,   nil,    87,
   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 47, :_reduce_1,
  1, 47, :_reduce_2,
  1, 47, :_reduce_3,
  3, 51, :_reduce_4,
  3, 51, :_reduce_5,
  3, 51, :_reduce_6,
  2, 48, :_reduce_7,
  2, 49, :_reduce_8,
  2, 50, :_reduce_9,
  1, 56, :_reduce_10,
  0, 56, :_reduce_11,
  2, 53, :_reduce_12,
  3, 53, :_reduce_13,
  1, 58, :_reduce_14,
  0, 58, :_reduce_15,
  2, 54, :_reduce_16,
  3, 54, :_reduce_17,
  6, 59, :_reduce_18,
  3, 59, :_reduce_19,
  6, 57, :_reduce_20,
  3, 57, :_reduce_21,
  6, 57, :_reduce_22,
  3, 57, :_reduce_23,
  1, 57, :_reduce_24,
  1, 63, :_reduce_25,
  1, 63, :_reduce_26,
  1, 63, :_reduce_27,
  1, 63, :_reduce_28,
  1, 60, :_reduce_29,
  5, 62, :_reduce_30,
  6, 62, :_reduce_31,
  0, 64, :_reduce_32,
  3, 64, :_reduce_33,
  1, 61, :_reduce_34,
  3, 61, :_reduce_35,
  1, 67, :_reduce_36,
  1, 67, :_reduce_37,
  1, 66, :_reduce_38,
  2, 66, :_reduce_39,
  1, 68, :_reduce_40,
  3, 68, :_reduce_41,
  2, 69, :_reduce_42,
  1, 69, :_reduce_43,
  1, 52, :_reduce_44,
  1, 70, :_reduce_45,
  3, 70, :_reduce_46,
  1, 71, :_reduce_47,
  1, 71, :_reduce_48,
  1, 71, :_reduce_49,
  1, 71, :_reduce_50,
  2, 71, :_reduce_51,
  2, 71, :_reduce_52,
  2, 71, :_reduce_53,
  3, 71, :_reduce_54,
  4, 71, :_reduce_55,
  3, 72, :_reduce_56,
  1, 65, :_reduce_57,
  3, 65, :_reduce_58,
  4, 74, :_reduce_59,
  1, 74, :_reduce_60,
  2, 55, :_reduce_61,
  2, 55, :_reduce_62,
  3, 75, :_reduce_63,
  1, 76, :_reduce_64,
  1, 76, :_reduce_65,
  3, 76, :_reduce_66,
  3, 76, :_reduce_67,
  0, 73, :_reduce_68,
  1, 73, :_reduce_69 ]

racc_reduce_n = 70

racc_shift_n = 132

racc_token_table = {
  false => 0,
  :error => 1,
  :T_COMMA => 2,
  :T_RARROW => 3,
  :K_OR => 4,
  :T_EOF => 5,
  :K_CLASS => 6,
  :K_METACLASS => 7,
  :K_MODULE => 8,
  :K_INTERFACE => 9,
  :K_TYPE => 10,
  :K_TYPEVAR => 11,
  :K_ALIAS => 12,
  :K_REQUIRE => 13,
  :K_END => 14,
  :K_SELF => 15,
  :T_BEGIN_LINE => 16,
  :T_SEMICOLON => 17,
  :T_COLON => 18,
  :T_DOUBLE_COLON => 19,
  :T_DOT => 20,
  :T_STAR => 21,
  :T_QUESTION => 22,
  :T_CARROT => 23,
  :T_BANG => 24,
  :T_EQUAL => 25,
  :T_LPAREN => 26,
  :T_RPAREN => 27,
  :T_LESS => 28,
  :T_GREATER => 29,
  :T_LBRACKET => 30,
  :T_RBRACKET => 31,
  :T_LBRACE => 32,
  :T_RBRACE => 33,
  :T_SUBTYPE => 34,
  :T_STRING => 35,
  :T_IVAR => 36,
  :T_CVAR => 37,
  :T_GVAR => 38,
  :T_CONST_ID => 39,
  :T_TYPE_ID => 40,
  :T_SYMBOL => 41,
  :T_LOCAL_ID => 42,
  :T_TICKED_ID => 43,
  :T_SUFFIXED_ID => 44,
  :T_SCOPED_ID => 45 }

racc_nt_base = 46

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "T_COMMA",
  "T_RARROW",
  "K_OR",
  "T_EOF",
  "K_CLASS",
  "K_METACLASS",
  "K_MODULE",
  "K_INTERFACE",
  "K_TYPE",
  "K_TYPEVAR",
  "K_ALIAS",
  "K_REQUIRE",
  "K_END",
  "K_SELF",
  "T_BEGIN_LINE",
  "T_SEMICOLON",
  "T_COLON",
  "T_DOUBLE_COLON",
  "T_DOT",
  "T_STAR",
  "T_QUESTION",
  "T_CARROT",
  "T_BANG",
  "T_EQUAL",
  "T_LPAREN",
  "T_RPAREN",
  "T_LESS",
  "T_GREATER",
  "T_LBRACKET",
  "T_RBRACKET",
  "T_LBRACE",
  "T_RBRACE",
  "T_SUBTYPE",
  "T_STRING",
  "T_IVAR",
  "T_CVAR",
  "T_GVAR",
  "T_CONST_ID",
  "T_TYPE_ID",
  "T_SYMBOL",
  "T_LOCAL_ID",
  "T_TICKED_ID",
  "T_SUFFIXED_ID",
  "T_SCOPED_ID",
  "$start",
  "entry",
  "e_method",
  "e_field",
  "e_class",
  "field_sig",
  "type_expr",
  "method_annotation_list",
  "field_annotation_list",
  "class_annotation",
  "method_start",
  "const_method_type",
  "field_start",
  "method_type",
  "method_name",
  "type_id_list",
  "method_sig",
  "relative_method_name",
  "block",
  "type_expr_comma_list",
  "type_var",
  "simple_type_var",
  "type_ident_list",
  "type_ident",
  "or_type_list",
  "single_type_expr",
  "tuple",
  "field_or_method_list",
  "class_decl",
  "field_type",
  "field_or_method_nonempty_list" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'annot_parser.racc', 47)
  def _reduce_1(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 48)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 49)
  def _reduce_3(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 54)
  def _reduce_4(val, _values, result)
            result = handle_var(:ivar, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 56)
  def _reduce_5(val, _values, result)
            result = handle_var(:cvar, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 58)
  def _reduce_6(val, _values, result)
            result = handle_var(:gvar, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 66)
  def _reduce_7(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 69)
  def _reduce_8(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 72)
  def _reduce_9(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 75)
  def _reduce_10(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 76)
  def _reduce_11(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 79)
  def _reduce_12(val, _values, result)
     result = [val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 81)
  def _reduce_13(val, _values, result)
            result = [val[1]] + val[2]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 85)
  def _reduce_14(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 86)
  def _reduce_15(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 89)
  def _reduce_16(val, _values, result)
     result = [val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 90)
  def _reduce_17(val, _values, result)
     result = [val[1]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 95)
  def _reduce_18(val, _values, result)
     result = handle_mtype(val[0], val[2], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 97)
  def _reduce_19(val, _values, result)
     result = handle_mtype(val[0], nil, val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 102)
  def _reduce_20(val, _values, result)
     result = handle_mtype(val[0], val[2], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 104)
  def _reduce_21(val, _values, result)
     result = handle_mtype(val[0], nil, val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 106)
  def _reduce_22(val, _values, result)
     result = handle_mtype(val[0], val[2], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 108)
  def _reduce_23(val, _values, result)
     result = handle_mtype(val[0], nil, val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 110)
  def _reduce_24(val, _values, result)
           result = handle_mtype("__rtc_next_method", nil, val[0])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 115)
  def _reduce_25(val, _values, result)
     result = MethodIdentifier.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 117)
  def _reduce_26(val, _values, result)
     result = MethodIdentifier.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 119)
  def _reduce_27(val, _values, result)
     result = MethodIdentifier.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 122)
  def _reduce_28(val, _values, result)
          	#FIXME(jtoman): this is broken
        result = handle_scoped_id(val[0]) 
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 127)
  def _reduce_29(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 131)
  def _reduce_30(val, _values, result)
            result = construct_msig([], val[2], val[4])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 134)
  def _reduce_31(val, _values, result)
            result = construct_msig(val[1], val[3], val[5])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 139)
  def _reduce_32(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 140)
  def _reduce_33(val, _values, result)
     result = handle_btype(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 143)
  def _reduce_34(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 144)
  def _reduce_35(val, _values, result)
     result = [val[0]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 147)
  def _reduce_36(val, _values, result)
     result = handle_type_param(:id, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 148)
  def _reduce_37(val, _values, result)
     result = handle_type_param(:self, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 151)
  def _reduce_38(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 153)
  def _reduce_39(val, _values, result)
            result = handle_type_param(:varargs, val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 157)
  def _reduce_40(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 159)
  def _reduce_41(val, _values, result)
          result = [val[0]] + val[2]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 164)
  def _reduce_42(val, _values, result)
       	  	result = {
   	  		:type => :absolute,
   	  		:name_list => val[1]
   	  	}
   	  
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 170)
  def _reduce_43(val, _values, result)
            result = {
        	:type => :relative,
        	:name_list => val[0]
        }
   	  
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 177)
  def _reduce_44(val, _values, result)
            list = val[0][:or_list]
        if(list.length > 1)
          result = Rtc::Types::UnionType.new(list)
        else
          # flatten if there is no union
          result = list[0]
        end
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 187)
  def _reduce_45(val, _values, result)
     result = {:or_list => [val[0]]} 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 189)
  def _reduce_46(val, _values, result)
            # need to differientiate OR lists from tuples (which are just arrays)
        val[2][:or_list] = [val[0]] + val[2][:or_list]
        result = val[2]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 195)
  def _reduce_47(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 197)
  def _reduce_48(val, _values, result)
        	result = Rtc::Types::SymbolType.new(eval(val[0]))
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 200)
  def _reduce_49(val, _values, result)
            result = handle_type_ident(val[0])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 202)
  def _reduce_50(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 204)
  def _reduce_51(val, _values, result)
            result = Rtc::Types::TopType.instance
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 207)
  def _reduce_52(val, _values, result)
            result = Rtc::Types::OptionalArg.new(val[1])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 210)
  def _reduce_53(val, _values, result)
            result = Rtc::Types::Vararg.new(val[1])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 213)
  def _reduce_54(val, _values, result)
            result = handle_structural_type(val[1])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 216)
  def _reduce_55(val, _values, result)
            nominal = handle_type_ident(val[0])
        result = Rtc::Types::ParameterizedType.new(nominal, val[2])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 221)
  def _reduce_56(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 224)
  def _reduce_57(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 226)
  def _reduce_58(val, _values, result)
            result = [val[0]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 231)
  def _reduce_59(val, _values, result)
            id = val[0]
        type_vars = val[2]
        result = handle_class_decl(id, type_vars)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 236)
  def _reduce_60(val, _values, result)
            id = val[0]
        result = handle_class_decl(id)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 242)
  def _reduce_61(val, _values, result)
            result = val[1]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 245)
  def _reduce_62(val, _values, result)
            result = val[1]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 251)
  def _reduce_63(val, _values, result)
            result = handle_var(:ivar, val[0], val[2])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 256)
  def _reduce_64(val, _values, result)
            result = {:fields => [val[0]], :methods => []}       
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 258)
  def _reduce_65(val, _values, result)
            result = {:fields => [],       :methods => [val[0]]} 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 260)
  def _reduce_66(val, _values, result)
            field_method_hash = val[2]
        field_method_hash[:fields] += [val[0]]
        result = field_method_hash
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 265)
  def _reduce_67(val, _values, result)
            field_method_hash = val[2]
        field_method_hash[:methods] += [val[0]]
        result = field_method_hash
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 271)
  def _reduce_68(val, _values, result)
     result = {:fields => [], :methods => []} 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 272)
  def _reduce_69(val, _values, result)
     result = val[0] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class TypeAnnotationParser


end
