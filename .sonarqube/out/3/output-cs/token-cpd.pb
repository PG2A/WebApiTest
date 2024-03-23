
.D:\PruebaColorado\WebApiTest\WebAPI\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder

 
.

 
Services

 
.

 
AddPresentation

  
(

  !
)

! "
. 
AddInfrastructure "
(" #
builder# *
.* +
Configuration+ 8
)8 9
. 
AddApplication 
(  
)  !
;! "
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
app 
. 
ApplyMigrations 
( 
) 
; 
} 
app 
. 
UseCors 
( 
c 
=> 
c 
. 
AllowAnyHeader !
(! "
)" #
.# $
AllowAnyMethod$ 2
(2 3
)3 4
.4 5
AllowAnyOrigin5 C
(C D
)D E
)E F
;F G
app 
. 
UseExceptionHandler 
( 
$str  
)  !
;! "
app 
. 
UseHttpsRedirection 
( 
) 
; 
app 
. 
UseAuthorization 
( 
) 
; 
app 
. 
UseMiddleware 
< .
"GloblalExceptionHandlingMiddleware 4
>4 5
(5 6
)6 7
;7 8
app   
.   
MapControllers   
(   
)   
;   
app"" 
."" 
Run"" 
("" 
)"" 	
;""	 
…
DD:\PruebaColorado\WebApiTest\WebAPI\PresentationAssemblyReference.cs
	namespace 	
WebAPI
 
{ 
public 

class )
PresentationAssemblyReference .
{ 
internal 
static 
readonly  
Assembly! )
assembly* 2
=3 4
typeof5 ;
(; <)
PresentationAssemblyReference< Y
)Y Z
.Z [
Assembly[ c
;c d
}		 
}

 „
TD:\PruebaColorado\WebApiTest\WebAPI\Middlewares\GlobalExceptionHandlingMiddleware.cs
	namespace 	
Web
 
. 
API 
. 
Middlewares 
; 
public 
class .
"GloblalExceptionHandlingMiddleware /
:0 1
IMiddleware2 =
{ 
private		 
readonly		 
ILogger		 
<		 .
"GloblalExceptionHandlingMiddleware		 ?
>		? @
_logger		A H
;		H I
public 
.
"GloblalExceptionHandlingMiddleware -
(- .
ILogger. 5
<5 6.
"GloblalExceptionHandlingMiddleware6 X
>X Y
loggerZ `
)` a
=>b d
_loggere l
=m n
loggero u
;u v
public 

async 
Task 
InvokeAsync !
(! "
HttpContext" -
context. 5
,5 6
RequestDelegate7 F
nextG K
)K L
{ 
try 
{ 	
await 
next 
( 
context 
) 
;  
} 	
catch 
( 
	Exception 
e 
) 
{ 	
_logger 
. 
LogError 
( 
e 
, 
e  !
.! "
Message" )
)) *
;* +
context 
. 
Response 
. 

StatusCode '
=( )
(* +
int+ .
). /
HttpStatusCode/ =
.= >
InternalServerError> Q
;Q R
ProblemDetails 
problem "
=# $
new% (
(( )
)) *
{ 
Status 
= 
( 
int 
) 
HttpStatusCode ,
., -
InternalServerError- @
,@ A
Type 
= 
$str %
,% &
Title 
= 
$str &
,& '
Detail 
= 
$str :
} 
; 
string!! 
json!! 
=!! 
JsonSerializer!! (
.!!( )
	Serialize!!) 2
(!!2 3
problem!!3 :
)!!: ;
;!!; <
context## 
.## 
Response## 
.## 
ContentType## (
=##) *
$str##+ =
;##= >
await%% 
context%% 
.%% 
Response%% "
.%%" #

WriteAsync%%# -
(%%- .
json%%. 2
)%%2 3
;%%3 4
}&& 	
}'' 
}(( §
:D:\PruebaColorado\WebApiTest\WebAPI\DependencyInjection.cs
	namespace 	
WebAPI
 
{ 
public 

static 
class 
DependencyInjection +
{ 
public 
static 
IServiceCollection (
AddPresentation) 8
(8 9
this9 =
IServiceCollection> P
servicesQ Y
)Y Z
{ 	
services		 
.		 
AddControllers		 #
(		# $
)		$ %
;		% &
services

 
.

 #
AddEndpointsApiExplorer

 ,
(

, -
)

- .
;

. /
services 
. 
AddSwaggerGen "
(" #
)# $
;$ %
services 
. 
AddTransient !
<! ".
"GloblalExceptionHandlingMiddleware" D
>D E
(E F
)F G
;G H
return 
services 
; 
} 	
} 
} í
ED:\PruebaColorado\WebApiTest\WebAPI\Extensions\MigrationExtensions.cs
	namespace 	
WebAPI
 
. 

Extensions 
{ 
public 

static 
class 
MigrationExtensions +
{ 
public 
static 
void 
ApplyMigrations *
(* +
this+ /
WebApplication0 >
app? B
)B C
{		 	
using

 
var

 
scope

 
=

 
app

 !
.

! "
Services

" *
.

* +
CreateScope

+ 6
(

6 7
)

7 8
;

8 9
var 
	dbContext 
= 
scope !
.! "
ServiceProvider" 1
.1 2
GetRequiredService2 D
<D E 
ApplicationDbContextE Y
>Y Z
(Z [
)[ \
;\ ]
	dbContext 
. 
Database 
. 
Migrate &
(& '
)' (
;( )
} 	
} 
} ß
CD:\PruebaColorado\WebApiTest\WebAPI\Controllers\ErrorsController.cs
	namespace 	
Web
 
. 
API 
. 
Controllers 
; 
public 
class 
ErrorsControler 
: 
ControllerBase -
{ 
[ 
ApiExplorerSettings 
( 
	IgnoreApi "
=# $
true% )
)) *
]* +
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

IActionResult

 
Error

 
(

 
)

  
{ 
	Exception 
? 
	exception 
= 
HttpContext *
.* +
Features+ 3
.3 4
Get4 7
<7 8$
IExceptionHandlerFeature8 P
>P Q
(Q R
)R S
?S T
.T U
ErrorU Z
;Z [
return 
Problem 
( 
) 
; 
} 
} Ÿ1
FD:\PruebaColorado\WebApiTest\WebAPI\Controllers\CustomersController.cs
	namespace 	
Web
 
. 
API 
. 
Controllers 
; 
[ 

EnableCors 
] 
[ 
Route 
( 
$str 
) 
] 
public 
class 
	Customers 
: 
ApiController &
{ 
private 
readonly 
ISender 
	_mediator &
;& '
public 

	Customers 
( 
ISender 
mediator %
)% &
{ 
	_mediator 
= 
mediator 
?? 
throw  %
new& )!
ArgumentNullException* ?
(? @
nameof@ F
(F G
mediatorG O
)O P
)P Q
;Q R
} 
[ 
HttpGet 
] 
public 

async 
Task 
< 
IActionResult #
># $
GetAll% +
(+ ,
), -
{ 
var 
customersResult 
= 
await #
	_mediator$ -
.- .
Send. 2
(2 3
new3 6 
GetAllCustomersQuery7 K
(K L
)L M
)M N
;N O
return 
customersResult 
. 
Match $
($ %
	customers 
=> 
Ok 
( 
	customers %
)% &
,& '
errors 
=> 
Problem 
( 
errors $
)$ %
)   	
;  	 

}!! 
[.. 
HttpGet.. 
(.. 
$str.. 
)..  
]..  !
public// 

async// 
Task// 
<// 
IActionResult// #
>//# $
GetByIdentification//% 8
(//8 9
string//9 ?
identification//@ N
)//N O
{00 
var11 
customerResult11 
=11 
await11 "
	_mediator11# ,
.11, -
Send11- 1
(111 2
new112 5,
 GetCustomerByIdentificationQuery116 V
(11V W
identification11W e
)11e f
)11f g
;11g h
return33 
customerResult33 
.33 
Match33 #
(33# $
customer44 
=>44 
Ok44 
(44 
customer44 #
)44# $
,44$ %
errors55 
=>55 
Problem55 
(55 
errors55 $
)55$ %
)66 	
;66	 

}77 
[99 
HttpPost99 
]99 
public:: 

async:: 
Task:: 
<:: 
IActionResult:: #
>::# $
Create::% +
(::+ ,
[::, -
FromBody::- 5
]::5 6!
CreateCustomerCommand::7 L
command::M T
)::T U
{;; 
var<< 
createResult<< 
=<< 
await<<  
	_mediator<<! *
.<<* +
Send<<+ /
(<</ 0
command<<0 7
)<<7 8
;<<8 9
return>> 
createResult>> 
.>> 
Match>> !
(>>! "

customerId?? 
=>?? 
Ok?? 
(?? 

customerId?? '
)??' (
,??( )
errors@@ 
=>@@ 
Problem@@ 
(@@ 
errors@@ $
)@@$ %
)AA 	
;AA	 

}BB 
[DD 
HttpPutDD 
(DD 
$strDD 
)DD 
]DD 
publicEE 

asyncEE 
TaskEE 
<EE 
IActionResultEE #
>EE# $
UpdateEE% +
(EE+ ,
GuidEE, 0
idEE1 3
,EE3 4
[EE5 6
FromBodyEE6 >
]EE> ?!
UpdateCustomerCommandEE@ U
commandEEV ]
)EE] ^
{FF 
ifGG 

(GG 
commandGG 
.GG 
IdGG 
!=GG 
idGG 
)GG 
{HH 	
ListII 
<II 
ErrorII 
>II 
errorsII 
=II  
newII! $
(II$ %
)II% &
{JJ 
ErrorKK 
.KK 

ValidationKK  
(KK  !
$strKK! 9
,KK9 :
$strKK; k
)KKk l
}LL 
;LL 
returnMM 
ProblemMM 
(MM 
errorsMM !
)MM! "
;MM" #
}NN 	
varPP 
updateResultPP 
=PP 
awaitPP  
	_mediatorPP! *
.PP* +
SendPP+ /
(PP/ 0
commandPP0 7
)PP7 8
;PP8 9
returnRR 
updateResultRR 
.RR 
MatchRR !
(RR! "

customerIdSS 
=>SS 
	NoContentSS #
(SS# $
)SS$ %
,SS% &
errorsTT 
=>TT 
ProblemTT 
(TT 
errorsTT $
)TT$ %
)UU 	
;UU	 

}VV 
[XX 

HttpDeleteXX 
(XX 
$strXX 
)XX 
]XX 
publicYY 

asyncYY 
TaskYY 
<YY 
IActionResultYY #
>YY# $
DeleteYY% +
(YY+ ,
GuidYY, 0
idYY1 3
)YY3 4
{ZZ 
var[[ 
deleteResult[[ 
=[[ 
await[[  
	_mediator[[! *
.[[* +
Send[[+ /
([[/ 0
new[[0 3!
DeleteCustomerCommand[[4 I
([[I J
id[[J L
)[[L M
)[[M N
;[[N O
return]] 
deleteResult]] 
.]] 
Match]] !
(]]! "

customerId^^ 
=>^^ 
	NoContent^^ #
(^^# $
)^^$ %
,^^% &
errors__ 
=>__ 
Problem__ 
(__ 
errors__ $
)__$ %
)`` 	
;``	 

}aa 
}bb Ã
@D:\PruebaColorado\WebApiTest\WebAPI\Controllers\ApiController.cs
	namespace 	
Web
 
. 
API 
. 
Controllers 
; 
[ 
ApiController 
] 
public		 
class		 
ApiController		 
:		 
ControllerBase		 +
{

 
	protected 
IActionResult 
Problem #
(# $
List$ (
<( )
Error) .
>. /
errors0 6
)6 7
{ 
if 

( 
errors 
. 
Count 
is 
$num 
) 
{ 	
return 
Problem 
( 
) 
; 
} 	
if 

( 
errors 
. 
All 
( 
error 
=> 
error  %
.% &
Type& *
==+ -
	ErrorType. 7
.7 8

Validation8 B
)B C
)C D
{ 	
return 
ValidationProblem $
($ %
errors% +
)+ ,
;, -
} 	
HttpContext 
. 
Items 
[ 
HttpContextItemKeys -
.- .
Erros. 3
]3 4
=5 6
errors7 =
;= >
return 
Problem 
( 
errors 
[ 
$num 
]  
)  !
;! "
} 
private 
IActionResult 
Problem !
(! "
Error" '
error( -
)- .
{ 
var 

statusCode 
= 
error 
. 
Type #
switch$ *
{ 	
	ErrorType   
.   
Conflict   
=>   !
StatusCodes  " -
.  - .
Status409Conflict  . ?
,  ? @
	ErrorType!! 
.!! 

Validation!!  
=>!!! #
StatusCodes!!$ /
.!!/ 0
Status400BadRequest!!0 C
,!!C D
	ErrorType"" 
."" 
NotFound"" 
=>"" !
StatusCodes""" -
.""- .
Status404NotFound"". ?
,""? @
_## 
=>## 
StatusCodes## 
.## (
Status500InternalServerError## 9
,##9 :
}$$ 	
;$$	 

return&& 
Problem&& 
(&& 

statusCode&& !
:&&! "

statusCode&&# -
,&&- .
title&&/ 4
:&&4 5
error&&6 ;
.&&; <
Description&&< G
)&&G H
;&&H I
}'' 
private)) 
IActionResult)) 
ValidationProblem)) +
())+ ,
List)), 0
<))0 1
Error))1 6
>))6 7
errors))8 >
)))> ?
{** 
var++  
modelStateDictionary++  
=++! "
new++# & 
ModelStateDictionary++' ;
(++; <
)++< =
;++= >
foreach-- 
(-- 
var-- 
error-- 
in-- 
errors-- $
)--$ %
{.. 	 
modelStateDictionary//  
.//  !
AddModelError//! .
(//. /
error/// 4
.//4 5
Code//5 9
,//9 :
error//; @
.//@ A
Description//A L
)//L M
;//M N
}00 	
return22 
ValidationProblem22  
(22  ! 
modelStateDictionary22! 5
)225 6
;226 7
}33 
}44 Õ
FD:\PruebaColorado\WebApiTest\WebAPI\Common\Http\HttpContextItemKeys.cs
	namespace 	
Web
 
. 
API 
. 
Common 
. 
Errors 
;  
public 
static 
class 
HttpContextItemKeys '
{ 
public 

const 
string 
Erros 
= 
$str  (
;( )
} ³8
ND:\PruebaColorado\WebApiTest\WebAPI\Common\Errors\TestProblemDetailsFactory.cs
	namespace 	
Web
 
. 
API 
. 
Common 
. 
Errors 
;  
public		 
class		 (
EasyPOSProblemDetailsFactory		 )
:		* +!
ProblemDetailsFactory		, A
{

 
private 
readonly 
ApiBehaviorOptions '
_options( 0
;0 1
public 
(
EasyPOSProblemDetailsFactory '
(' (
ApiBehaviorOptions( :
options; B
)B C
{ 
_options 
= 
options 
?? 
throw #
new$ '!
ArgumentNullException( =
(= >
nameof> D
(D E
optionsE L
)L M
)M N
;N O
} 
public 

override 
ProblemDetails " 
CreateProblemDetails# 7
(7 8
HttpContext 
httpContext 
,  
int 
? 

statusCode 
= 
null 
, 
string 
? 
title 
= 
null 
, 
string 
? 
type 
= 
null 
, 
string 
? 
detail 
= 
null 
, 
string 
? 
instance 
= 
null 
)  
{ 

statusCode 
??= 
$num 
; 
var 
problemDetails 
= 
new  
ProblemDetails! /
{ 	
Status 
= 

statusCode 
,  
Title 
= 
title 
, 
Type   
=   
type   
,   
Detail!! 
=!! 
detail!! 
,!! 
Instance"" 
="" 
instance"" 
}## 	
;##	 
'
ApplyProblemDetailsDefaults%% #
(%%# $
httpContext%%$ /
,%%/ 0
problemDetails%%1 ?
,%%? @

statusCode%%A K
.%%K L
Value%%L Q
)%%Q R
;%%R S
return'' 
problemDetails'' 
;'' 
}(( 
public** 

override** $
ValidationProblemDetails** ,*
CreateValidationProblemDetails**- K
(**K L
HttpContext++ 
httpContext++ 
,++   
ModelStateDictionary,,  
modelStateDictionary,, 1
,,,1 2
int-- 
?-- 

statusCode-- 
=-- 
null-- 
,-- 
string.. 
?.. 
title.. 
=.. 
null.. 
,.. 
string// 
?// 
type// 
=// 
null// 
,// 
string00 
?00 
detail00 
=00 
null00 
,00 
string11 
?11 
instance11 
=11 
null11 
)11  
{22 
if33 

(33  
modelStateDictionary33  
==33! #
null33$ (
)33( )
{44 	
throw55 
new55 !
ArgumentNullException55 +
(55+ ,
nameof55, 2
(552 3 
modelStateDictionary553 G
)55G H
)55H I
;55I J
}66 	

statusCode88 
??=88 
$num88 
;88 
var:: 
problemDetails:: 
=:: 
new::  $
ValidationProblemDetails::! 9
(::9 : 
modelStateDictionary::: N
)::N O
{;; 	
Status<< 
=<< 

statusCode<< 
,<<  
Type== 
=== 
type== 
,== 
Detail>> 
=>> 
detail>> 
,>> 
Instance?? 
=?? 
instance?? 
}@@ 	
;@@	 

ifBB 

(BB 
titleBB 
!=BB 
nullBB 
)BB 
{CC 	
problemDetailsDD 
.DD 
TitleDD  
=DD! "
titleDD# (
;DD( )
}EE 	'
ApplyProblemDetailsDefaultsGG #
(GG# $
httpContextGG$ /
,GG/ 0
problemDetailsGG1 ?
,GG? @

statusCodeGGA K
.GGK L
ValueGGL Q
)GGQ R
;GGR S
returnII 
problemDetailsII 
;II 
}KK 
privateMM 
voidMM '
ApplyProblemDetailsDefaultsMM ,
(MM, -
HttpContextMM- 8
httpContextMM9 D
,MMD E
ProblemDetailsMMF T
problemDetailsMMU c
,MMc d
intMMe h

statusCodeMMi s
)MMs t
{NN 
problemDetailsOO 
.OO 
StatusOO 
??=OO !

statusCodeOO" ,
;OO, -
ifQQ 

(QQ 
_optionsQQ 
.QQ 
ClientErrorMappingQQ '
.QQ' (
TryGetValueQQ( 3
(QQ3 4

statusCodeQQ4 >
,QQ> ?
outQQ@ C
varQQD G
clientErrorDataQQH W
)QQW X
)QQX Y
{RR 	
problemDetailsSS 
.SS 
TitleSS  
??=SS! $
clientErrorDataSS% 4
.SS4 5
TitleSS5 :
;SS: ;
problemDetailsTT 
.TT 
TypeTT 
??=TT  #
clientErrorDataTT$ 3
.TT3 4
LinkTT4 8
;TT8 9
}UU 	
varWW 
traceIdWW 
=WW 
ActivityWW 
.WW 
CurrentWW &
?WW& '
.WW' (
IdWW( *
??WW+ -
httpContextWW. 9
.WW9 :
TraceIdentifierWW: I
;WWI J
ifXX 

(XX 
traceIdXX 
!=XX 
nullXX 
)XX 
{YY 	
problemDetailsZZ 
.ZZ 

ExtensionsZZ %
[ZZ% &
$strZZ& /
]ZZ/ 0
=ZZ1 2
traceIdZZ3 :
;ZZ: ;
}[[ 	
var]] 
errors]] 
=]] 
httpContext]]  
?]]  !
.]]! "
Items]]" '
[]]' (
HttpContextItemKeys]]( ;
.]]; <
Erros]]< A
]]]A B
as]]C E
List]]F J
<]]J K
Error]]K P
>]]P Q
;]]Q R
if__ 

(__ 
errors__ 
is__ 
not__ 
null__ 
)__ 
{`` 	
problemDetailsaa 
.aa 

Extensionsaa %
.aa% &
Addaa& )
(aa) *
$straa* 6
,aa6 7
errorsaa8 >
.aa> ?
Selectaa? E
(aaE F
eaaF G
=>aaH J
eaaK L
.aaL M
CodeaaM Q
)aaQ R
)aaR S
;aaS T
}bb 	
}cc 
}dd 