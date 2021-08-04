package com.mycompany.sumamultiplicacion.gramatica;

import java_cup.runtime.*;
import static com.mycompany.sumamultiplicacion.gramatica.ParserSym.*;
%%

%class Lexer
%unicode
%line
%column
%cup
%public

/*expresiones regulares*/
ESPECIAL = [ \t\r\n]+
NUMERO = [0-9]+


%%

<YYINITIAL> {
	{NUMERO}	{ return new Symbol(NUMERO, yyline, yycolumn, yytext()); }
	"+"		{ return new Symbol(MAS, yyline, yycolumn, yytext()); }
	"*"		{ return new Symbol(POR, yyline, yycolumn, yytext()); }
	"("		{ return new Symbol(PAR_A, yyline, yycolumn, yytext()); }
	")"		{ return new Symbol(PAR_C, yyline, yycolumn, yytext()); }
}



//caracteres especiales
<YYINITIAL>{
	{ESPECIAL}	{	/* Ignorar */	}
}

<YYINITIAL>{
        [^]             { /*error lexico*/ }
}







