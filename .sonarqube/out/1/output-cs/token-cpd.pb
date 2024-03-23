≈
ED:\PruebaColorado\WebApiTest\Application\Data\IAplicationDbContext.cs
	namespace 	
Application
 
. 
Data 
{ 
public 

	interface  
IAplicationDbContext )
{ 
DbSet 
< 
Customer 
> 
	Customers !
{" #
get$ '
;' (
set) ,
;, -
}. /
Task

 
<

 
int

 
>

 
SaveChangesAsync

 "
(

" #
CancellationToken

# 4
cancellationToken

5 F
=

G H
default

I P
)

P Q
;

Q R
} 
} û
[D:\PruebaColorado\WebApiTest\Application\Customers\Update\UpdateCustomerCommandValidator.cs
	namespace 	
Application
 
. 
	Customers 
.  
Update  &
;& '
public 
class *
UpdateCustomerCommandValidator +
:, -
AbstractValidator. ?
<? @!
UpdateCustomerCommand@ U
>U V
{ 
public 
*
UpdateCustomerCommandValidator )
() *
)* +
{ 
RuleFor			 
(		 
r		 
=>		 
r		 
.		 
Id		 
)		 
.

 
NotEmpty

 
(

 
)

 
;

 
RuleFor 
( 
r 
=> 
r 
. 
Name 
) 
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num 
) 
; 
RuleFor 
( 
r 
=> 
r 
. 
LastName 
)  
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num 
) 
. 
WithName 
( 
$str "
)" #
;# $
RuleFor 
( 
r 
=> 
r 
. 
Identification %
)% &
. 
NotEmpty 
( 
) 
. 
EmailAddress 
( 
) 
. 
MaximumLength 
( 
$num 
)  
;  !
RuleFor 
( 
r 
=> 
r 
. 
PhoneNumber "
)" #
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num 
) 
. 
WithName 
( 
$str %
)% &
;& '
RuleFor   
(   
r   
=>   
r   
.   
Active   
)   
.!! 
NotNull!! 
(!! 
)!! 
;!! 
}"" 
}## ‹
?D:\PruebaColorado\WebApiTest\Application\DependencyInjection.cs
	namespace 	
Application
 
{ 
public		 

static		 
class		 
DependencyInjection		 +
{

 
public 
static 
IServiceCollection (
AddApplication) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
)X Y
{ 	
services 
. 

AddMediatR 
(  
config  &
=>' )
{* +
config, 2
.2 32
&RegisterServicesFromAssemblyContaining3 Y
<Y Z(
ApplicationAssemblyReferenceZ v
>v w
(w x
)x y
;y z
}{ |
)| }
;} ~
services 
. 
	AddScoped 
( 
typeof 
( 
IPipelineBehavior $
<$ %
,% &
>& '
)' (
,( )
typeof 
( 
ValidationBehavior %
<% &
,& '
>' (
)( )
) 	
;	 

services 
. /
#AddValidatorsFromAssemblyContaining 8
<8 9(
ApplicationAssemblyReference9 U
>U V
(V W
)W X
;X Y
return 
services 
; 
} 	
} 
} ı
YD:\PruebaColorado\WebApiTest\Application\Customers\Update\UpdateCustomerCommandHandler.cs
	namespace 	
Application
 
. 
	Customers 
.  
Update  &
;& '
internal		 
sealed			 
class		 (
UpdateCustomerCommandHandler		 2
:		3 4
IRequestHandler		5 D
<		D E!
UpdateCustomerCommand		E Z
,		Z [
ErrorOr		\ c
<		c d
Unit		d h
>		h i
>		i j
{

 
private 
readonly 
ICustomerRepository (
_customerRepository) <
;< =
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
(
UpdateCustomerCommandHandler '
(' (
ICustomerRepository( ;
customerRepository< N
,N O
IUnitOfWorkP [

unitOfWork\ f
)f g
{ 
_customerRepository 
= 
customerRepository 0
??1 3
throw4 9
new: =!
ArgumentNullException> S
(S T
nameofT Z
(Z [
customerRepository[ m
)m n
)n o
;o p
_unitOfWork 
= 

unitOfWork  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K

unitOfWorkK U
)U V
)V W
;W X
} 
public 

async 
Task 
< 
ErrorOr 
< 
Unit "
>" #
># $
Handle% +
(+ ,!
UpdateCustomerCommand, A
commandB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 
if 

( 
! 
await 
_customerRepository &
.& '
ExistsAsync' 2
(2 3
new3 6

CustomerId7 A
(A B
commandB I
.I J
IdJ L
)L M
)M N
)N O
{ 	
return 
Error 
. 
NotFound !
(! "
$str" 5
,5 6
$str7 j
)j k
;k l
} 	
Customer 
customer 
= 
Customer $
.$ %
UpdateCustomer% 3
(3 4
command4 ;
.; <
Id< >
,> ?
command@ G
.G H
NameH L
,L M
command 
. 
LastName 
, 
command   
.   
Identification   "
,  " #
command!! 
.!! 
PhoneNumber!! 
,!!  
command"" 
."" 
Active"" 
)"" 
;"" 
_customerRepository$$ 
.$$ 
Update$$ "
($$" #
customer$$# +
)$$+ ,
;$$, -
await&& 
_unitOfWork&& 
.&& 
SaveChangesAsync&& *
(&&* +
cancellationToken&&+ <
)&&< =
;&&= >
return(( 
Unit(( 
.(( 
Value(( 
;(( 
})) 
}** ò
RD:\PruebaColorado\WebApiTest\Application\Customers\Update\UpdateCustomerCommand.cs
	namespace 	
Application
 
. 
	Customers 
.  
Update  &
;& '
public 
record !
UpdateCustomerCommand #
(# $
Guid 
Id	 
, 
string 

Name 
, 
string		 

LastName		 
,		 
string

 

Identification

 
,

 
string 

PhoneNumber 
, 
bool 
Active	 
) 
: 
IRequest 
< 
ErrorOr #
<# $
Unit$ (
>( )
>) *
;* +≠
UD:\PruebaColorado\WebApiTest\Application\Customers\Get\GetCustomerByIdQueryHandler.cs
	namespace 	
Application
 
. 
	Customers 
.  
GetById  '
;' (
internal		 
sealed			 
class		 '
GetCustomerByIdQueryHandler		 1
:		2 3
IRequestHandler		4 C
<		C D 
GetCustomerByIdQuery		D X
,		X Y
ErrorOr		Z a
<		a b
CustomerResponse		b r
>		r s
>		s t
{

 
private 
readonly 
ICustomerRepository (
_customerRepository) <
;< =
public 
'
GetCustomerByIdQueryHandler &
(& '
ICustomerRepository' :
customerRepository; M
)M N
{ 
_customerRepository 
= 
customerRepository 0
??1 3
throw4 9
new: =!
ArgumentNullException> S
(S T
nameofT Z
(Z [
customerRepository[ m
)m n
)n o
;o p
} 
public 

async 
Task 
< 
ErrorOr 
< 
CustomerResponse .
>. /
>/ 0
Handle1 7
(7 8 
GetCustomerByIdQuery8 L
queryM R
,R S
CancellationTokenT e
cancellationTokenf w
)w x
{ 
if 

( 
await 
_customerRepository %
.% &
GetByIdAsync& 2
(2 3
new3 6

CustomerId7 A
(A B
queryB G
.G H
IdH J
)J K
)K L
isM O
notP S
CustomerT \
customer] e
)e f
{ 	
return 
Error 
. 
NotFound !
(! "
$str" 5
,5 6
$str7 m
)m n
;n o
} 	
return 
new 
CustomerResponse #
(# $
customer 
. 
Id 
. 
Value 
, 
customer 
. 
FullName 
, 
customer 
. 
Identification #
,# $
customer 
. 
PhoneNumber  
,  !
customer 
. 
Active 
) 
; 
} 
}   Ç
ND:\PruebaColorado\WebApiTest\Application\Customers\Get\GetCustomerByIdQuery.cs
	namespace 	
Application
 
. 
	Customers 
.  
GetById  '
;' (
public 
record  
GetCustomerByIdQuery "
(" #
Guid# '
Id( *
)* +
:, -
IRequest. 6
<6 7
ErrorOr7 >
<> ?
CustomerResponse? O
>O P
>P Q
;Q RÕ
aD:\PruebaColorado\WebApiTest\Application\Customers\Get\GetCustomerByIdentificationQueryHandler.cs
	namespace 	
Application
 
. 
	Customers 
.  
Get  #
{ 
internal 
sealed 
class 3
'GetCustomerByIdentificationQueryHandler A
:B C
IRequestHandlerD S
<S T,
 GetCustomerByIdentificationQueryT t
,t u
ErrorOrv }
<} ~
CustomerResponse	~ é
>
é è
>
è ê
{ 
private 
readonly 
ICustomerRepository ,
_customerRepository- @
;@ A
public 3
'GetCustomerByIdentificationQueryHandler 6
(6 7
ICustomerRepository7 J
customerRepositoryK ]
)] ^
{ 	
_customerRepository 
=  !
customerRepository" 4
??5 7
throw8 =
new> A!
ArgumentNullExceptionB W
(W X
nameofX ^
(^ _
customerRepository_ q
)q r
)r s
;s t
} 	
public 
async 
Task 
< 
ErrorOr !
<! "
CustomerResponse" 2
>2 3
>3 4
Handle5 ;
(; <,
 GetCustomerByIdentificationQuery< \
query] b
,b c
CancellationTokend u
cancellationToken	v á
)
á à
{ 	
if 
( 
await 
_customerRepository )
.) *
GetByIdentification* =
(= >
query> C
.C D
IdentificationD R
)R S
isT V
notW Z
Customer[ c
customerd l
)l m
{ 
return 
Error 
. 
NotFound %
(% &
$str& 9
,9 :
$str; 
)	 Ä
;
Ä Å
} 
return 
new 
CustomerResponse '
(' (
customer   
.   
Id   
.   
Value   
,   
customer!! 
.!! 
FullName!! 
,!! 
customer"" 
."" 
Identification"" #
,""# $
customer## 
.## 
PhoneNumber##  
,##  !
customer$$ 
.$$ 
Active$$ 
)$$ 
;$$ 
}%% 	
}&& 
}'' §
ZD:\PruebaColorado\WebApiTest\Application\Customers\Get\GetCustomerByIdentificationQuery.cs
	namespace 	
Application
 
. 
	Customers 
.  
Get  #
;# $
public 
record ,
 GetCustomerByIdentificationQuery .
(. /
string/ 5
Identification6 D
)D E
:F G
IRequestH P
<P Q
ErrorOrQ X
<X Y
CustomerResponseY i
>i j
>j k
;k l™
XD:\PruebaColorado\WebApiTest\Application\Customers\GetAll\GetAllCustomersQueryHandler.cs
	namespace 	
Application
 
. 
	Customers 
.  
GetAll  &
;& '
internal		 
sealed			 
class		 '
GetAllCustomersQueryHandler		 1
:		2 3
IRequestHandler		4 C
<		C D 
GetAllCustomersQuery		D X
,		X Y
ErrorOr		Z a
<		a b
IReadOnlyList		b o
<		o p
CustomerResponse			p Ä
>
		Ä Å
>
		Å Ç
>
		Ç É
{

 
private 
readonly 
ICustomerRepository (
_customerRepository) <
;< =
public 
'
GetAllCustomersQueryHandler &
(& '
ICustomerRepository' :
customerRepository; M
)M N
{ 
_customerRepository 
= 
customerRepository 0
??1 3
throw4 9
new: =!
ArgumentNullException> S
(S T
nameofT Z
(Z [
customerRepository[ m
)m n
)n o
;o p
} 
public 

async 
Task 
< 
ErrorOr 
< 
IReadOnlyList +
<+ ,
CustomerResponse, <
>< =
>= >
>> ?
Handle@ F
(F G 
GetAllCustomersQueryG [
query\ a
,a b
CancellationTokenc t
cancellationToken	u Ü
)
Ü á
{ 
IReadOnlyList 
< 
Customer 
> 
	customers  )
=* +
await, 1
_customerRepository2 E
.E F
GetAllF L
(L M
)M N
;N O
return 
	customers 
. 
Select 
(  
customer  (
=>) +
new, /
CustomerResponse0 @
(@ A
customer 
. 
Id 
. 
Value !
,! "
customer 
. 
FullName !
,! "
customer 
. 
Identification '
,' (
customer 
. 
PhoneNumber $
,$ %
customer 
. 
Active 
) 
) 
. 
ToList 
( 
) 
; 
} 
} õ
QD:\PruebaColorado\WebApiTest\Application\Customers\GetAll\GetAllCustomersQuery.cs
	namespace 	
Application
 
. 
	Customers 
.  
GetAll  &
;& '
public 
record  
GetAllCustomersQuery "
(" #
)# $
:% &
IRequest' /
</ 0
ErrorOr0 7
<7 8
IReadOnlyList8 E
<E F
CustomerResponseF V
>V W
>W X
>X Y
;Y Zã
[D:\PruebaColorado\WebApiTest\Application\Customers\Delete\DeleteCustomerCommandValidator.cs
	namespace 	
Application
 
. 
	Customers 
.  
Delete  &
;& '
public 
class *
DeleteCustomerCommandValidator +
:, -
AbstractValidator. ?
<? @!
DeleteCustomerCommand@ U
>U V
{ 
public 
*
DeleteCustomerCommandValidator )
() *
)* +
{ 
RuleFor		 
(		 
r		 
=>		 
r		 
.		 
Id		 
)		 
.

 
NotEmpty

 
(

 
)

 
;

 
} 
} Á
YD:\PruebaColorado\WebApiTest\Application\Customers\Delete\DeleteCustomerCommandHandler.cs
	namespace 	
Application
 
. 
	Customers 
.  
Delete  &
;& '
internal 
sealed	 
class (
DeleteCustomerCommandHandler 2
:3 4
IRequestHandler5 D
<D E!
DeleteCustomerCommandE Z
,Z [
ErrorOr\ c
<c d
Unitd h
>h i
>i j
{		 
private

 
readonly

 
ICustomerRepository

 (
_customerRepository

) <
;

< =
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
(
DeleteCustomerCommandHandler '
(' (
ICustomerRepository( ;
customerRepository< N
,N O
IUnitOfWorkP [

unitOfWork\ f
)f g
{ 
_customerRepository 
= 
customerRepository 0
??1 3
throw4 9
new: =!
ArgumentNullException> S
(S T
nameofT Z
(Z [
customerRepository[ m
)m n
)n o
;o p
_unitOfWork 
= 

unitOfWork  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K

unitOfWorkK U
)U V
)V W
;W X
} 
public 

async 
Task 
< 
ErrorOr 
< 
Unit "
>" #
># $
Handle% +
(+ ,!
DeleteCustomerCommand, A
commandB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 
if 

( 
await 
_customerRepository %
.% &
GetByIdAsync& 2
(2 3
new3 6

CustomerId7 A
(A B
commandB I
.I J
IdJ L
)L M
)M N
isO Q
notR U
CustomerV ^
customer_ g
)g h
{ 	
return 
Error 
. 
NotFound !
(! "
$str" 5
,5 6
$str7 e
)e f
;f g
} 	
_customerRepository 
. 
Delete "
(" #
customer# +
)+ ,
;, -
await 
_unitOfWork 
. 
SaveChangesAsync *
(* +
cancellationToken+ <
)< =
;= >
return 
Unit 
. 
Value 
; 
} 
} ˙
RD:\PruebaColorado\WebApiTest\Application\Customers\Delete\DeleteCustomerCommand.cs
	namespace 	
Application
 
. 
	Customers 
.  
Delete  &
;& '
public 
record !
DeleteCustomerCommand #
(# $
Guid$ (
Id) +
)+ ,
:- .
IRequest/ 7
<7 8
ErrorOr8 ?
<? @
Unit@ D
>D E
>E F
;F GÖ
[D:\PruebaColorado\WebApiTest\Application\Customers\Create\CreateCustomerCommandValidator.cs
	namespace 	
Application
 
. 
	Customers 
.  
Create  &
;& '
public 
class *
CreateCustomerCommandValidator +
:, -
AbstractValidator. ?
<? @!
CreateCustomerCommand@ U
>U V
{ 
public 
*
CreateCustomerCommandValidator )
() *
)* +
{ 
RuleFor		 
(		 
r		 
=>		 
r		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
. 
MaximumLength 
( 
$num 
) 
; 
RuleFor 
( 
r 
=> 
r 
. 
LastName 
)  
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num 
) 
. 
WithName 
( 
$str "
)" #
;# $
RuleFor 
( 
r 
=> 
r 
. 
Identification %
)% &
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num 
) 
. 
WithName 
( 
$str '
)' (
;( )
RuleFor 
( 
r 
=> 
r 
. 
PhoneNumber "
)" #
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
$num 
) 
. 
WithName 
( 
$str %
)% &
;& '
} 
} ˙
YD:\PruebaColorado\WebApiTest\Application\Customers\Create\CreateCustomerCommandHandler.cs
	namespace 	
Application
 
. 
	Customers 
.  
Create  &
;& '
internal		 
sealed			 
class		 (
CreateCustomerCommandHandler		 2
:		3 4
IRequestHandler		5 D
<		D E!
CreateCustomerCommand		E Z
,		Z [
ErrorOr		\ c
<		c d
Guid		d h
>		h i
>		i j
{

 
private 
readonly 
ICustomerRepository (
_customerRepository) <
;< =
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
(
CreateCustomerCommandHandler '
(' (
ICustomerRepository( ;
customerRepository< N
,N O
IUnitOfWorkP [

unitOfWork\ f
)f g
{ 
_customerRepository 
= 
customerRepository 0
??1 3
throw4 9
new: =!
ArgumentNullException> S
(S T
nameofT Z
(Z [
customerRepository[ m
)m n
)n o
;o p
_unitOfWork 
= 

unitOfWork  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K

unitOfWorkK U
)U V
)V W
;W X
} 
public 

async 
Task 
< 
ErrorOr 
< 
Guid "
>" #
># $
Handle% +
(+ ,!
CreateCustomerCommand, A
commandB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 
try 
{ 	
var 
customer 
= 
new 
Customer '
(' (
new 

CustomerId 
( 
Guid #
.# $
NewGuid$ +
(+ ,
), -
)- .
,. /
command 
. 
Name 
, 
command   
.   
LastName    
,    !
command!! 
.!! 
Identification!! &
,!!& '
command"" 
."" 
PhoneNumber"" #
,""# $
true## 
)## 
;## 
_customerRepository%% 
.%%  
Add%%  #
(%%# $
customer%%$ ,
)%%, -
;%%- .
await&& 
_unitOfWork&& 
.&& 
SaveChangesAsync&& .
(&&. /
cancellationToken&&/ @
)&&@ A
;&&A B
return(( 
customer(( 
.(( 
Id(( 
.(( 
Value(( $
;(($ %
})) 	
catch** 
(** 
	Exception** 
ex** 
)** 
{++ 	
Console,, 
.,, 
	WriteLine,, 
(,, 
ex,,  
),,  !
;,,! "
throw-- 
;-- 
}.. 	
}33 
}44 ≤
RD:\PruebaColorado\WebApiTest\Application\Customers\Create\CreateCustomerCommand.cs
	namespace 	
Application
 
. 
	Customers 
.  
Create  &
;& '
public 
record !
CreateCustomerCommand #
(# $
string 

Name 
, 
string 

LastName 
, 
string		 

Identification		 
,		 
string

 

PhoneNumber

 
) 
: 
IRequest 
< 
ErrorOr 
< 
Guid 
> 
> 
;  ü
MD:\PruebaColorado\WebApiTest\Application\Customers\Common\CustomerResponse.cs
	namespace 	
	Customers
 
. 
Common 
; 
public 
record 
CustomerResponse 
( 
Guid 
Id 
, 
string 
FullName 
, 
string 
Identification 
, 
string 
PhoneNumber 
, 
bool 
Active 
) 
; Ã
OD:\PruebaColorado\WebApiTest\Application\Common\Behaviors\ValidationBehavior.cs
	namespace 	
Application
 
. 
Common 
. 
	Behaviors &
;& '
public 
class 
ValidationBehavior 
<  
TRequest  (
,( )
	TResponse* 3
>3 4
:5 6
IPipelineBehavior7 H
<H I
TRequestI Q
,Q R
	TResponseS \
>\ ]
where 
TRequest 
: 
IRequest 
< 
	TResponse #
># $
where		 
	TResponse		 
:		 
IErrorOr		 
{

 
private 
readonly 

IValidator 
<  
TRequest  (
>( )
?) *

_validator+ 5
;5 6
public 

ValidationBehavior 
( 

IValidator (
<( )
TRequest) 1
>1 2
?2 3
	validator4 =
=> ?
null@ D
)D E
{ 

_validator 
= 
	validator 
; 
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest 
request 
, "
RequestHandlerDelegate 
< 
	TResponse (
>( )
next* .
,. /
CancellationToken 
cancellationToken +
)+ ,
{ 
if 

( 

_validator 
is 
null 
) 
{ 	
return 
await 
next 
( 
) 
;  
} 	
var 
validatorResult 
= 
await #

_validator$ .
.. /
ValidateAsync/ <
(< =
request= D
,D E
cancellationTokenF W
)W X
;X Y
if 

( 
validatorResult 
. 
IsValid #
)# $
{ 	
return   
await   
next   
(   
)   
;    
}!! 	
var## 
errors## 
=## 
validatorResult## $
.##$ %
Errors##% +
.$$ 

ConvertAll$$ 
($$  
validationFailure$$  1
=>$$2 4
Error$$5 :
.$$: ;

Validation$$; E
($$E F
validationFailure%% )
.%%) *
PropertyName%%* 6
,%%6 7
validationFailure&& )
.&&) *
ErrorMessage&&* 6
)'' 
)'' 
;'' 
return)) 
()) 
dynamic)) 
))) 
errors)) 
;)) 
}** 
}++ å
HD:\PruebaColorado\WebApiTest\Application\ApplicationAssemblyReference.cs
	namespace 	
Application
 
{ 
public 

class (
ApplicationAssemblyReference -
{ 
internal 
static 
readonly  
Assembly! )
assembly* 2
=3 4
typeof5 ;
(; <(
ApplicationAssemblyReference< X
)X Y
.Y Z
AssemblyZ b
;b c
}		 
}

 