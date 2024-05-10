grammar ArithmeticExpressions;

options {output=AST;}
tokens{
Start;
Term;
Factor;
Simicoln;
Oprations;
ClassDefinition;
ClassInitaltion;
Classes;
InitInt;
InitDouble;
InitFloat;
InitBoolean;
ISO;
Assign;
ValueInitaltion;
IF_Statment;
FOR_LOOP;
WHILE_LOOP;
DO_WHILE_LOOP;
}
@members {
String s="";
}

// Arithmetic Expressions
startgeneralArithExpr: classes -> ^(Start classes);
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
    
// The finally clause is the last part a rule executes before returning.
finally { s = s + "Exit..."+"\n"; }

classes	:	((classInit classDef*)|commint)^;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}


classInit:	  'public'? Class ID '{' code* '}' ->^(ClassInitaltion 'public'?  Class ID '{' code* '}'); 
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

classDef:	  Class ID '{' code* '}' ->^(ClassDefinition Class ID '{' code* '}'); 
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

code
	:	valueInitaltion -> ^(ValueInitaltion valueInitaltion)
		|if_statment -> ^(IF_Statment if_statment)
		|for_loop -> ^(FOR_LOOP for_loop)
		|while_loop -> ^(WHILE_LOOP while_loop)
		|do_while_loop -> ^(DO_WHILE_LOOP do_while_loop);
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

valueInitaltion
	:	int_def -> ^(InitInt int_def)
	|	double_def -> ^(InitDouble double_def)
	|	float_def -> ^(InitFloat float_def)
	|	boolean_def -> ^(InitBoolean boolean_def)
	|	iso -> ^(ISO iso)
	|	var_sign3 -> ^(Assign var_sign3);
	
	// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

valueInitaltion1
	:	int_def -> ^(InitInt int_def)
	|	double_def -> ^(InitDouble double_def)
	|	float_def -> ^(InitFloat float_def)
	|	boolean_def -> ^(InitBoolean boolean_def)
	|	iso -> ^(ISO iso);
	
	// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
	
	
iso : (ID (Equl double_oprations ) simicoln);
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
	
boolean_def : ( 'boolean' ID (',' ID)* (Equl ('!')?(Bool | ID)^ )? (simicoln | (',' ID (Equl ('!')?(Bool | ID)^ )? )+ simicoln));
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


int_def	:	('int' ID (',' ID)* (Equl int_oprations)? (simicoln | (',' ID (Equl int_oprations)?)+ simicoln )^ );
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

int_oprations
	:	(int_generalArithExpr) 
	-> ^(Oprations int_generalArithExpr ) 
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

int_generalArithExpr: int_term (('+' | '-')^  int_term)*
	//-> ^(GeneralArithExpr term (('+' | '-')  term)*)	
	;	
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

int_term	: int_factor ( ( '*' | '/' )^ int_factor)* 
	//-> ^(Term factor ( ( '*' | '/' ) factor)*)
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

int_factor	:  
	ID -> ^(Factor ID)
	|INT -> ^(Factor INT)
	| '-'  ID -> ^(Factor  '-' ID)
	| '-'  INT -> ^(Factor  '-' INT)
	| '(' int_generalArithExpr ')' -> ^(Factor  '(' int_generalArithExpr ')')
	| Fun '(' int_generalArithExpr ')' -> ^(Factor Fun '(' int_generalArithExpr ')')
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}


double_def	:	('double' ID (',' ID)* (Equl double_oprations)? (simicoln | (',' ID (Equl double_oprations)?)+ simicoln )^ );
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

double_oprations
	:	(double_generalArithExpr) 
	-> ^(Oprations double_generalArithExpr ) 
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

double_generalArithExpr: double_term (('+' | '-')^  double_term)*
	//-> ^(GeneralArithExpr term (('+' | '-')  term)*)	
	;	
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

double_term	: double_factor ( ( '*' | '/' )^ double_factor)* 
	//-> ^(Term factor ( ( '*' | '/' ) factor)*)
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

double_factor	:  ID -> ^(Factor ID)
	|INT F_float? -> ^(Factor INT F_float?)
	|DOUBLE F_float? -> ^(Factor DOUBLE F_float?)
	| '-'  ID -> ^(Factor  '-' ID)
	| '-'  INT F_float? -> ^(Factor  '-' INT F_float?)
	| '-'  DOUBLE F_float?  -> ^(Factor  '-' DOUBLE F_float?)
	| '(' double_generalArithExpr ')' -> ^(Factor  '(' double_generalArithExpr ')')
	| Fun '(' double_generalArithExpr ')' -> ^(Factor Fun '(' double_generalArithExpr ')')
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

float_def	:	('float' ID (',' ID)* (Equl float_oprations)? (simicoln | (',' ID (Equl float_oprations)?)+ simicoln )^ );
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

float_oprations
	:	(float_generalArithExpr) 
	-> ^(Oprations float_generalArithExpr ) 
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

float_generalArithExpr: float_term (('+' | '-')^  float_term)*
	//-> ^(GeneralArithExpr term (('+' | '-')  term)*)	
	;	
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

float_term	: float_factor ( ( '*' | '/' )^ float_factor)* 
	//-> ^(Term factor ( ( '*' | '/' ) factor)*)
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

float_factor	:  ID -> ^(Factor ID)
	|INT F_float? -> ^(Factor INT F_float?)
	|DOUBLE F_float -> ^(Factor DOUBLE F_float)
	| '-'  ID -> ^(Factor  '-' ID)
	| '-'  INT F_float? -> ^(Factor  '-' INT F_float?)
	| '-'  DOUBLE F_float  -> ^(Factor  '-' DOUBLE F_float)
	| '(' double_generalArithExpr ')' -> ^(Factor  '(' double_generalArithExpr ')')
	| Fun '(' double_generalArithExpr ')' -> ^(Factor Fun '(' double_generalArithExpr ')')
	;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if_statment
	:	(if_rule elseif_rule* else_rule?);
	// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
cond	:	(double_oprations CondOpr double_oprations);
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
cond_if	:	(cond| '!'?Bool)^ (LogicOpr cond)*;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
if_rule	:	'if' '(' cond_if ')' '{' code* '}';
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
elseif_rule
	:	'elseif' '(' cond_if ')' '{' code* '}';
	// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
else_rule
	:	'else' '{' code* '}';
	// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
while_loop
	:	'while' '(' cond ')' '{' code* '}' ;
		// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

do_while_loop
	:	'do' '{'code*'}' 'while' '(' cond ')' simicoln;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

for_loop:	'for' '(' valueInitaltion1 cond simicoln var_sign2')' '{' code* '}';
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

var_sign : ((ID ('++' | '--')^) | (('++' | '--')^ ID))^ ;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
var_sign1 : (var_sign| iso)^ ;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
var_sign2 : var_sign1 (','var_sign1)*;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
var_sign3 : var_sign simicoln;
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

simicoln:	SIMI->^(Simicoln SIMI);
// catch blocks go first
catch[MismatchedTokenException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[NoViableAltException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}
catch[RecognitionException e] { s = s +getErrorMessage(e,new String[]{e.input.toString()})+": "+getErrorHeader(e) +"\n";}

commint	:	(SL_COMMENT|ML_COMMENT)^;

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

F_float	:	('F'|'f');

Equl : '=' | '+=' | '-=' | '/=' | '%=';
CondOpr : '<' | '>' | '==' | '>=' | '<=' | '!=';
LogicOpr : '&&' | '&' | '||' | '|' | '^';

Modifier:	'public'|'private'|'protected';
Class	:	'class';
Bool : 'true' | 'false';
Fun	: 'sin' | 'cos'| 'tan' ;

SIMI	:	';';
ID 	:	('a'..'z'|'A'..'Z'|'_')  ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*  ;
INT	:	 ('0'..'9')+ ;
DOUBLE	:	INT '.' INT;
SL_COMMENT	:	'//' (.)*'\n'+{skip();};
ML_COMMENT	:	'/*' ( options {greedy=false;} : .)* '*/'+{skip();};
WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {skip();}
    ;// ignore whitespace