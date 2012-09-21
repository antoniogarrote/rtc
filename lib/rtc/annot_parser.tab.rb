#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.8
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

module_eval(<<'...end annot_parser.racc/module_eval...', 'annot_parser.racc', 338)

...end annot_parser.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
    13,    21,    14,    25,    25,    50,   101,   -14,   -18,    21,
    40,    34,    10,   102,   103,    25,    33,    36,    35,    23,
    78,    90,    38,    24,    24,   104,    37,   105,    99,    81,
    20,   100,   -17,   -17,   -17,    24,    97,    30,    20,    80,
    98,     9,    39,    21,    40,    34,    96,    50,    24,    25,
    33,    36,    35,    23,   114,   115,    38,    21,    40,    34,
    37,    92,    89,    25,    33,    36,    35,    23,   132,    24,
    38,    30,    20,    46,    37,    88,    39,    87,   133,   120,
    47,    83,    48,    24,    84,    30,    20,    21,    40,    34,
    39,    82,    50,    25,    33,    36,    35,    23,    77,    65,
    38,    21,    40,    34,    37,    64,    63,    25,    33,    36,
    35,    23,   126,    24,    38,    30,    20,    46,    37,    24,
    39,   111,    61,   129,    47,   130,    48,    24,   131,    30,
    20,    21,    40,    34,    39,    59,   134,    25,    33,    36,
    35,    23,    50,   114,    38,    21,    40,    34,    37,   137,
   138,    25,    33,    36,    35,    23,    58,    24,    38,    30,
    20,   140,    37,   141,    39,    18,   143,    69,    50,    17,
    21,    24,    16,    30,    20,    21,    40,    34,    39,   147,
    23,    25,    33,    36,    35,    23,   148,   149,    38,    46,
    71,   150,    37,    50,    69,    50,    47,   153,    48,    20,
    21,    24,    15,    30,    20,    21,    40,    34,    39,    50,
    23,    25,    33,    36,    35,    23,    46,    71,    38,    85,
   156,    50,    37,    47,   nil,    48,   -16,   -16,   -16,    20,
   nil,    24,   nil,    30,    20,    21,    40,    34,    39,   nil,
   nil,    25,    33,    36,    35,    23,   nil,   nil,    38,    21,
    40,    34,    37,   nil,   nil,    25,    33,    36,    35,    23,
   nil,    24,    38,    30,    20,   nil,    37,   nil,    39,    51,
    52,    53,   nil,   nil,   nil,    24,   nil,    30,    20,    21,
    40,    34,    39,   nil,   nil,    25,    33,    36,    35,    23,
   nil,   nil,    38,    21,    40,    34,    37,   nil,   nil,    25,
    33,    36,    35,    23,   nil,    24,    38,    30,    20,   nil,
    37,   nil,    39,   nil,   nil,   nil,   nil,   nil,   nil,    24,
   nil,    30,    20,    21,    40,    34,    39,   nil,   nil,    25,
    33,    36,    35,    23,   nil,   nil,    38,    21,    40,    34,
    37,   nil,   nil,    25,    33,    36,    35,    23,   nil,    24,
    38,    30,    20,   nil,    37,   nil,    39,   nil,   nil,    44,
    69,   nil,   nil,    24,   nil,    30,    20,    21,    40,    34,
    39,   nil,    50,    25,    33,    36,    35,    23,   nil,   nil,
    38,    46,    46,    71,    37,    43,   nil,    21,    47,    47,
    48,    48,    21,    24,    21,    30,    20,    23,    21,   nil,
    39,   nil,    23,   nil,    23,   nil,   nil,   nil,    23,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    20,   nil,   nil,   nil,
   nil,    20,   nil,    20,   nil,   nil,   nil,    20 ]

racc_action_check = [
     0,    23,     0,    13,    14,    81,    72,    41,    54,   148,
   148,   148,     0,    73,    75,   148,   148,   148,   148,   148,
    41,    54,   148,    13,    14,    76,   148,    77,    70,    42,
    23,    71,     0,     0,     0,   148,    68,   148,   148,    42,
    69,     0,   148,   134,   134,   134,    68,    83,    61,   134,
   134,   134,   134,   134,    85,    86,   134,    64,    64,    64,
   134,    55,    53,    64,    64,    64,    64,    64,   111,   134,
    64,   134,   134,    98,    64,    52,   134,    51,   111,    95,
    98,    43,    98,    64,    44,    64,    64,    63,    63,    63,
    64,    43,    97,    63,    63,    63,    63,    63,    40,    33,
    63,     9,     9,     9,    63,    31,    28,     9,     9,     9,
     9,     9,   103,    63,     9,    63,    63,    84,     9,    25,
    63,    84,    24,   106,    84,   107,    84,     9,   109,     9,
     9,    87,    87,    87,     9,    19,   113,    87,    87,    87,
    87,    87,   114,   115,    87,    88,    88,    88,    87,   119,
   121,    88,    88,    88,    88,    88,    15,    87,    88,    87,
    87,   128,    88,   129,    87,     8,   131,   101,   132,     7,
   133,    88,     6,    88,    88,    89,    89,    89,    88,   135,
   133,    89,    89,    89,    89,    89,   136,   138,    89,   101,
   101,   140,    89,   141,   102,   143,   101,   145,   101,   133,
    82,    89,     1,    89,    89,    50,    50,    50,    89,   149,
    82,    50,    50,    50,    50,    50,   102,   102,    50,    50,
   153,   156,    50,   102,   nil,   102,    10,    10,    10,    82,
   nil,    50,   nil,    50,    50,    38,    38,    38,    50,   nil,
   nil,    38,    38,    38,    38,    38,   nil,   nil,    38,   126,
   126,   126,    38,   nil,   nil,   126,   126,   126,   126,   126,
   nil,    38,   126,    38,    38,   nil,   126,   nil,    38,    12,
    12,    12,   nil,   nil,   nil,   126,   nil,   126,   126,   100,
   100,   100,   126,   nil,   nil,   100,   100,   100,   100,   100,
   nil,   nil,   100,    35,    35,    35,   100,   nil,   nil,    35,
    35,    35,    35,    35,   nil,   100,    35,   100,   100,   nil,
    35,   nil,   100,   nil,   nil,   nil,   nil,   nil,   nil,    35,
   nil,    35,    35,   105,   105,   105,    35,   nil,   nil,   105,
   105,   105,   105,   105,   nil,   nil,   105,   104,   104,   104,
   105,   nil,   nil,   104,   104,   104,   104,   104,   nil,   105,
   104,   105,   105,   nil,   104,   nil,   105,   nil,   nil,    11,
    37,   nil,   nil,   104,   nil,   104,   104,    36,    36,    36,
   104,   nil,    11,    36,    36,    36,    36,    36,   nil,   nil,
    36,    11,    37,    37,    36,    11,   nil,   130,    11,    37,
    11,    37,    92,    36,    96,    36,    36,   130,    80,   nil,
    36,   nil,    92,   nil,    96,   nil,   nil,   nil,    80,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   130,   nil,   nil,   nil,
   nil,    92,   nil,    96,   nil,   nil,   nil,    80 ]

racc_action_pointer = [
    -6,   202,   nil,   nil,   nil,   nil,   167,   164,   160,    86,
   188,   344,   231,   -18,   -17,   156,   nil,   nil,   nil,   130,
   nil,   nil,   nil,   -14,   101,    78,   nil,   nil,   102,   nil,
   nil,    75,   nil,    75,   nil,   278,   352,   345,   220,   nil,
    68,     2,     9,    61,    62,   nil,   nil,   nil,   nil,   nil,
   190,    57,    55,    42,     3,    31,   nil,   nil,   nil,   nil,
   nil,     7,   nil,    72,    42,   nil,   nil,   nil,    16,    18,
    -5,    11,     4,    11,   nil,   -15,    23,    -5,   nil,   nil,
   383,   -23,   185,    19,    80,    20,    26,   116,   130,   160,
   nil,   nil,   377,   nil,   nil,    48,   379,    64,    36,   nil,
   264,   152,   179,   109,   322,   308,    92,   123,   nil,    97,
   nil,    48,   nil,   133,   114,   109,   nil,   nil,   nil,   118,
   nil,   119,   nil,   nil,   nil,   nil,   234,   nil,   128,   143,
   372,   146,   140,   155,    28,   144,   183,   nil,   167,   nil,
   160,   165,   nil,   167,   nil,   166,   nil,   nil,    -6,   181,
   nil,   nil,   nil,   200,   nil,   nil,   193,   nil ]

racc_action_default = [
   -13,   -79,    -1,    -2,    -3,    -4,   -79,   -79,   -79,   -79,
   -12,   -79,   -79,   -79,   -79,   -79,    -8,    -9,   -10,   -79,
   -42,   -43,   -44,   -79,   -46,   -79,   -49,   -50,   -51,   -53,
   -54,   -55,   -56,   -79,   -58,   -79,   -79,   -77,   -79,   -64,
   -79,   -13,   -79,   -79,   -79,   -28,   -29,   -30,   -31,   -32,
   -79,   -79,   -79,   -79,   -17,   -69,   -70,   -71,   158,   -11,
   -45,   -79,   -48,   -79,   -79,   -57,   -59,   -60,   -79,   -79,
   -79,   -79,   -73,   -74,   -78,   -79,   -66,   -79,   -12,   -15,
   -79,   -79,   -79,   -79,   -79,   -38,   -79,   -79,   -79,   -79,
   -16,   -19,   -79,   -47,   -52,   -79,   -79,   -79,   -79,   -61,
   -79,   -79,   -79,   -79,   -79,   -79,   -79,   -40,   -23,   -79,
   -25,   -79,   -33,   -37,   -79,   -38,    -5,    -6,    -7,   -79,
   -62,   -79,   -21,   -72,   -75,   -76,   -79,   -67,   -79,   -79,
   -79,   -79,   -79,   -79,   -79,   -79,   -36,   -68,   -79,   -63,
   -79,   -79,   -41,   -79,   -26,   -79,   -34,   -39,   -79,   -79,
   -65,   -22,   -24,   -79,   -35,   -20,   -79,   -27 ]

racc_goto_table = [
    45,    19,    66,    67,    74,     7,     6,    75,   106,    62,
   109,   113,   112,   107,    54,   107,    56,    57,     4,    86,
   119,    55,    55,     3,   121,   107,   112,    42,    60,   107,
    41,     8,    94,    95,     2,    70,     5,     1,   nil,   nil,
   nil,   136,   nil,   nil,   nil,    93,   nil,    79,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   142,    91,
   nil,   145,   nil,   107,   nil,   nil,   107,   nil,   124,   125,
   108,   nil,   110,   127,   128,   nil,   nil,   nil,   nil,   116,
   117,   118,   nil,   nil,   nil,   nil,   122,   nil,   nil,   nil,
   nil,   nil,   123,   139,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   135,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   144,   nil,   nil,   nil,   nil,   146,   nil,   nil,   nil,
   151,   nil,   152,   nil,   nil,   nil,   nil,   nil,   155,   nil,
   154,   nil,   nil,   nil,   nil,   157 ]

racc_goto_check = [
    17,     7,    26,    26,    31,     9,     8,    20,    16,    23,
    16,    19,    18,    21,     6,    21,    29,    29,     4,    20,
    16,    24,    24,     3,    16,    21,    18,    15,    22,    21,
    12,    10,    25,    20,     2,    28,     5,     1,   nil,   nil,
   nil,    19,   nil,   nil,   nil,    23,   nil,     8,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    16,     9,
   nil,    16,   nil,    21,   nil,   nil,    21,   nil,    31,    31,
    17,   nil,    17,    20,    20,   nil,   nil,   nil,   nil,     7,
     7,     7,   nil,   nil,   nil,   nil,    17,   nil,   nil,   nil,
   nil,   nil,     7,    26,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    17,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    17,   nil,   nil,   nil,   nil,     7,   nil,   nil,   nil,
    17,   nil,    17,   nil,   nil,   nil,   nil,   nil,    17,   nil,
     7,   nil,   nil,   nil,   nil,    17 ]

racc_goto_pointer = [
   nil,    37,    34,    23,    18,    36,     2,    -8,     6,     5,
    31,   nil,    19,   nil,   nil,    16,   -72,   -11,   -72,   -74,
   -31,   -67,     5,   -16,     8,   -31,   -33,   nil,    -2,     3,
   nil,   -33 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    76,   nil,   nil,
   nil,    11,   nil,    12,    73,    68,   nil,   nil,    49,   nil,
   nil,    29,    22,    26,    31,    27,    28,    32,   nil,   nil,
    72,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 50, :_reduce_1,
  1, 50, :_reduce_2,
  1, 50, :_reduce_3,
  1, 50, :_reduce_4,
  3, 55, :_reduce_5,
  3, 55, :_reduce_6,
  3, 55, :_reduce_7,
  2, 51, :_reduce_8,
  2, 52, :_reduce_9,
  2, 53, :_reduce_10,
  3, 54, :_reduce_11,
  1, 60, :_reduce_12,
  0, 60, :_reduce_13,
  2, 57, :_reduce_14,
  3, 57, :_reduce_15,
  1, 62, :_reduce_16,
  0, 62, :_reduce_17,
  2, 58, :_reduce_18,
  3, 58, :_reduce_19,
  6, 63, :_reduce_20,
  3, 63, :_reduce_21,
  6, 61, :_reduce_22,
  3, 61, :_reduce_23,
  6, 61, :_reduce_24,
  3, 61, :_reduce_25,
  5, 61, :_reduce_26,
  8, 61, :_reduce_27,
  1, 61, :_reduce_28,
  1, 67, :_reduce_29,
  1, 67, :_reduce_30,
  1, 67, :_reduce_31,
  1, 64, :_reduce_32,
  3, 64, :_reduce_33,
  5, 66, :_reduce_34,
  6, 66, :_reduce_35,
  4, 66, :_reduce_36,
  3, 66, :_reduce_37,
  0, 68, :_reduce_38,
  3, 68, :_reduce_39,
  1, 65, :_reduce_40,
  3, 65, :_reduce_41,
  1, 71, :_reduce_42,
  1, 71, :_reduce_43,
  1, 70, :_reduce_44,
  2, 70, :_reduce_45,
  1, 72, :_reduce_46,
  3, 72, :_reduce_47,
  2, 73, :_reduce_48,
  1, 73, :_reduce_49,
  1, 56, :_reduce_50,
  1, 74, :_reduce_51,
  3, 74, :_reduce_52,
  1, 75, :_reduce_53,
  1, 75, :_reduce_54,
  1, 75, :_reduce_55,
  1, 75, :_reduce_56,
  2, 75, :_reduce_57,
  1, 75, :_reduce_58,
  2, 75, :_reduce_59,
  2, 75, :_reduce_60,
  3, 75, :_reduce_61,
  4, 75, :_reduce_62,
  5, 75, :_reduce_63,
  1, 75, :_reduce_64,
  6, 76, :_reduce_65,
  1, 69, :_reduce_66,
  3, 69, :_reduce_67,
  4, 78, :_reduce_68,
  1, 78, :_reduce_69,
  2, 59, :_reduce_70,
  2, 59, :_reduce_71,
  3, 79, :_reduce_72,
  1, 80, :_reduce_73,
  1, 80, :_reduce_74,
  3, 80, :_reduce_75,
  3, 80, :_reduce_76,
  0, 77, :_reduce_77,
  1, 77, :_reduce_78 ]

racc_reduce_n = 79

racc_shift_n = 158

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
  :K_TUPLE => 16,
  :T_BOTTOM => 17,
  :T_BEGIN_LINE => 18,
  :T_SEMICOLON => 19,
  :T_COLON => 20,
  :T_DOUBLE_COLON => 21,
  :T_DOT => 22,
  :T_STAR => 23,
  :T_QUESTION => 24,
  :T_CARROT => 25,
  :T_BANG => 26,
  :T_EQUAL => 27,
  :T_LPAREN => 28,
  :T_RPAREN => 29,
  :T_LESS => 30,
  :T_GREATER => 31,
  :T_LBRACKET => 32,
  :T_RBRACKET => 33,
  :T_LBRACE => 34,
  :T_RBRACE => 35,
  :T_SUBTYPE => 36,
  :T_STRING => 37,
  :T_IVAR => 38,
  :T_CVAR => 39,
  :T_GVAR => 40,
  :T_CONST_ID => 41,
  :T_TYPE_ID => 42,
  :T_SYMBOL => 43,
  :T_LOCAL_ID => 44,
  :T_TICKED_ID => 45,
  :T_SUFFIXED_ID => 46,
  :T_DOUBLE_HASH => 47,
  :K_NIL => 48 }

racc_nt_base = 49

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
  "K_TUPLE",
  "T_BOTTOM",
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
  "T_DOUBLE_HASH",
  "K_NIL",
  "$start",
  "entry",
  "e_method",
  "e_field",
  "e_class",
  "e_annotation",
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

module_eval(<<'.,.,', 'annot_parser.racc', 49)
  def _reduce_1(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 50)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 51)
  def _reduce_3(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 52)
  def _reduce_4(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 57)
  def _reduce_5(val, _values, result)
            result = handle_var(:ivar, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 59)
  def _reduce_6(val, _values, result)
            result = handle_var(:cvar, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 61)
  def _reduce_7(val, _values, result)
            result = handle_var(:gvar, val[0], val[2]) 
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
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 78)
  def _reduce_11(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 81)
  def _reduce_12(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 82)
  def _reduce_13(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 85)
  def _reduce_14(val, _values, result)
     result = [val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 87)
  def _reduce_15(val, _values, result)
            result = [val[1]] + val[2]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 91)
  def _reduce_16(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 92)
  def _reduce_17(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 95)
  def _reduce_18(val, _values, result)
     result = [val[1]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 96)
  def _reduce_19(val, _values, result)
     result = [val[1]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 101)
  def _reduce_20(val, _values, result)
     result = handle_mtype(val[0], val[2], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 103)
  def _reduce_21(val, _values, result)
     result = handle_mtype(val[0], nil, val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 108)
  def _reduce_22(val, _values, result)
     result = handle_mtype(val[0], val[2], val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 110)
  def _reduce_23(val, _values, result)
     result = handle_mtype(val[0], nil, val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 112)
  def _reduce_24(val, _values, result)
     result = handle_mtype(val[0], val[2], val[6]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 114)
  def _reduce_25(val, _values, result)
     result = handle_mtype(val[0], nil, val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 116)
  def _reduce_26(val, _values, result)
        	result = handle_mtype(ClassMethodIdentifier.new(val[2]), nil, val[4]) 
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 119)
  def _reduce_27(val, _values, result)
     result = handle_mtype(ClassMethodIdentifier.new(val[2]), val[4], val[7]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 121)
  def _reduce_28(val, _values, result)
           result = handle_mtype(MethodIdentifier.new("__rtc_next_method"), nil, val[0])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 126)
  def _reduce_29(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 128)
  def _reduce_30(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 130)
  def _reduce_31(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 133)
  def _reduce_32(val, _values, result)
     result = MethodIdentifier.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 134)
  def _reduce_33(val, _values, result)
     result = ClassMethodIdentifier.new(val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 138)
  def _reduce_34(val, _values, result)
            result = construct_msig([], val[2], val[4])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 141)
  def _reduce_35(val, _values, result)
            result = construct_msig(val[1], val[3], val[5])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 144)
  def _reduce_36(val, _values, result)
        	result = construct_msig(val[1], val[3], Rtc::Types::TopType.instance)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 147)
  def _reduce_37(val, _values, result)
            result = construct_msig([], val[2], Rtc::Types::TopType.instance)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 152)
  def _reduce_38(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 153)
  def _reduce_39(val, _values, result)
     result = handle_btype(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 156)
  def _reduce_40(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 157)
  def _reduce_41(val, _values, result)
     result = [val[0]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 160)
  def _reduce_42(val, _values, result)
     result = handle_type_param(:id, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 161)
  def _reduce_43(val, _values, result)
     result = handle_type_param(:self, val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 164)
  def _reduce_44(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 166)
  def _reduce_45(val, _values, result)
            result = handle_type_param(:varargs, val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 170)
  def _reduce_46(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 172)
  def _reduce_47(val, _values, result)
          result = [val[0]] + val[2]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 177)
  def _reduce_48(val, _values, result)
       	  	result = {
   	  		:type => :absolute,
   	  		:name_list => val[1]
   	  	}
   	  
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 183)
  def _reduce_49(val, _values, result)
            result = {
        	:type => :relative,
        	:name_list => val[0]
        }
   	  
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 191)
  def _reduce_50(val, _values, result)
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

module_eval(<<'.,.,', 'annot_parser.racc', 201)
  def _reduce_51(val, _values, result)
     result = {:or_list => [val[0]]} 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 203)
  def _reduce_52(val, _values, result)
            # need to differientiate OR lists from tuples (which are just arrays)
        val[2][:or_list] = [val[0]] + val[2][:or_list]
        result = val[2]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 209)
  def _reduce_53(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 211)
  def _reduce_54(val, _values, result)
        	result = Rtc::Types::SymbolType.new(eval(val[0]))
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 214)
  def _reduce_55(val, _values, result)
            result = handle_type_ident(val[0])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 217)
  def _reduce_56(val, _values, result)
            result = val[0] 
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 220)
  def _reduce_57(val, _values, result)
            result = Rtc::Types::TopType.instance
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 223)
  def _reduce_58(val, _values, result)
        	result = Rtc::Types::BottomType.instance
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 226)
  def _reduce_59(val, _values, result)
            result = Rtc::Types::OptionalArg.new(val[1])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 229)
  def _reduce_60(val, _values, result)
            result = Rtc::Types::Vararg.new(val[1])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 232)
  def _reduce_61(val, _values, result)
            result = handle_structural_type(val[1])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 235)
  def _reduce_62(val, _values, result)
            nominal = handle_type_ident(val[0])
        result = Rtc::Types::ParameterizedType.new(nominal, val[2])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 239)
  def _reduce_63(val, _values, result)
           result = Rtc::Types::ProceduralType.new(nil, val[4], val[1], nil)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 242)
  def _reduce_64(val, _values, result)
        	result = Rtc::Types::NominalType.of(NilClass)
    
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 247)
  def _reduce_65(val, _values, result)
            result = Rtc::Types::TupleType.new(val[3])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 251)
  def _reduce_66(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 253)
  def _reduce_67(val, _values, result)
            result = [val[0]] + val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 258)
  def _reduce_68(val, _values, result)
            id = val[0]
        type_vars = val[2]
        result = handle_class_decl(id, type_vars)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 263)
  def _reduce_69(val, _values, result)
            id = val[0]
        result = handle_class_decl(id)
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 269)
  def _reduce_70(val, _values, result)
            result = val[1]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 272)
  def _reduce_71(val, _values, result)
            result = val[1]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 278)
  def _reduce_72(val, _values, result)
            result = handle_var(:ivar, val[0], val[2])
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 283)
  def _reduce_73(val, _values, result)
            result = {:fields => [val[0]], :methods => []}       
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 285)
  def _reduce_74(val, _values, result)
            result = {:fields => [],       :methods => [val[0]]} 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 287)
  def _reduce_75(val, _values, result)
            field_method_hash = val[2]
        field_method_hash[:fields] += [val[0]]
        result = field_method_hash
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 292)
  def _reduce_76(val, _values, result)
            field_method_hash = val[2]
        field_method_hash[:methods] += [val[0]]
        result = field_method_hash
      
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 298)
  def _reduce_77(val, _values, result)
     result = {:fields => [], :methods => []} 
    result
  end
.,.,

module_eval(<<'.,.,', 'annot_parser.racc', 299)
  def _reduce_78(val, _values, result)
     result = val[0] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class TypeAnnotationParser


end
