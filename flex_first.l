%{
    #include<stdio.h>
    int line_no = 1;
    int left_para = 0,rigth_para = 0,left_brak = 0,right_brak = 0,left_brace=0,right_brace= 0;
    void ret_print(char* token_type);
    void yyerror(char *message); 
    static void skip_single_line_comment(void);
    static void skip_multi_line_comment(void);    
%}

header_file [#]"include"[<]"iostream"[>]|[#]"include"[<]"conio.h"[>]|[#]"include"[<]"ctime"[>]|[#]"include"[<]"stdlib.h"[>]|[#]"include"[<]"cmath"[>]|[#]"include"[<]"vector"[>]|[#]"include"[<]"string"[>]|[#]"include"[<]"stack"[>]|[#]"include"[<]"queue"[>]|[#]"include"[<]"fstream"[>]|[#]"include"[<]"ofstream"[>]|[#]"include"[<]"ifstream"[>]
Assignment_operator "="|"+="|"-="|"*="|"/="|"%="
Arithematic_operator "+"|"-"|"*"|"/"|"%"|"++"|"--"
Relational_operator "=="|"!="|"<"|">"|">="|"<="
logical_operator "||"|"&&"|"!"
Bitwise_operator "&"|"|"|"^"|"~"|"<<"|">>"
other_operator "?:"|"&"|"."|"->"|"<<"|">>"|"?"|"->"
Identifier [a-zA-Z_]{1}[a-zA-Z0-9_]*
floating_point_number [0-9]+[.][0-9]+
empty_char ''
integer_number [0-9]+
keyword "cout"|"cin"|"cerr"|"clog"|"for"|"while"|"do"|"else"|"else if"|"if"|"try"|"operator"|"explicit"|"private"|"public"|"typedef"|"NULL"|"nullptr"|"bitset"|"extern"|"true"|"false"|"case"|"break"|"continue"|"catch"|"asm"|"auto"|"const"|"constexpr"|"static"|"volatile"|"virtual"|"using"|"namespace"|"return"|"switch"|"struct"|"class"|"this"|"inline"|"catch"|"export"|"static"|"union"|"xor"|"template"|"default"|"friend"|"new"|"delete"|"export"|"sizeof"|"endl"|"main"|"std"|"rand"|"srand"|"getline"
type_modifiers "signed"|"unsigned"|"long"|"short"
scope_resolution_operator "::"
data_type "int"|"float"|"char"|"double"|"string"|"bool"|"void"|"wchar_t"
punctuators ","|";"|":"|","|["]|[']
pointer "*"[a-zA-Z_]{1}[a-zA-Z0-9_]*
character_literal "'"[a-zA-Z0-9_+=!@#$%^&*()|/\?><,.`~ ]"'"
string_literal ["][a-zA-Z0-9_+=!@#$%^&*()|/\?><,.`~ ]*["]

%%

{header_file} {ret_print("header pre-processor-directive");}
{data_type} {ret_print("data_type");}
{keyword}  {ret_print("Keyword");}
{floating_point_number} {ret_print("Floating point number");}
{empty_char} {ret_print("character");}
{string_literal} {ret_print("string");}
{character_literal} {ret_print("Character");}
{integer_number} {ret_print("integer number");}
{Assignment_operator} {ret_print("Assignment operator");}
{Arithematic_operator} {ret_print("Arithematic operator");}
{Relational_operator} {ret_print("Relational operator");}
{logical_operator} {ret_print("Logical operator");}
{Bitwise_operator} {ret_print("Bitwise operator");}
{scope_resolution_operator} {ret_print("scope resolution operator");}
{punctuators} {ret_print("punctuators");}
{type_modifiers} {ret_print("type modifier");}
{pointer} {ret_print("pointer");}
{other_operator} {ret_print("Other operator");}
{Identifier} {ret_print("Identifier");}


"//".* {ret_print("Single line comment");}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {ret_print("Multiline comment");}
[/][*] {fprintf(yyout,"ERROR unterminated comment\n");}
"(" {ret_print("opening paranthesis"); left_para++;}
")" {ret_print("closing parathesis"); rigth_para++;}
"{" {ret_print("opening braces"); left_brace++;}
"}" {ret_print("closing brace"); right_brace++;}
"[" {ret_print("opening bracket"); left_brak++;}
"]" {ret_print("closing bracket"); right_brak++;}
" " {fprintf(yyout,"");}

"\n" {line_no++;}
. {yyerror("Unidentified character");}
%%


void ret_print(char* token_type)
{
    fprintf(yyout,"Line number:%d     %s            %s\n",line_no,yytext,token_type);
}

void yyerror(char* message)
{
    fprintf(yyout,"Error: %s in line %d Token:%s\n",message,line_no,yytext);
}

yywrap() {}

int main()
{
    extern FILE *yyin,*yyout;

    yyin = fopen("test5.txt","r");
    yyout = fopen("output5.txt","w");

    yylex();

    if(left_para != rigth_para)
        fprintf(yyout,"ERROR missing parathesis\n");
    if(left_brak != right_brak)
        fprintf(yyout,"ERROR missing bracket\n");
    if(left_brace != right_brace)
        fprintf(yyout,"ERROR missing brace\n");

    fclose(yyin);
    fclose(yyout);

    return 0;
}