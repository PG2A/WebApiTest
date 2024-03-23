æ
?D:\PruebaColorado\WebApiTest\Domain\ValueObjects\PhoneNumber.cs
	namespace 	
Domain
 
. 
ValueObjects 
{ 
public 

partial 
record 
PhoneNumber %
{ 
private 
const 
int 
DefaultLength '
=( )
$num* ,
;, -
private

 
const

 
string

 
Pattern

 $
=

% &
$str

' 2
;

2 3
private 
PhoneNumber 
( 
string "
value# (
)( )
=>* ,
Value- 2
=3 4
value5 :
;: ;
public 
static 
PhoneNumber !
?! "
Create# )
() *
string* 0
value1 6
)6 7
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
value% *
)* +
||, .
!/ 0
PhoneNumberRegex0 @
(@ A
)A B
.B C
IsMatchC J
(J K
valueK P
)P Q
||R T
valueU Z
.Z [
Length[ a
!=b d
DefaultLengthe r
)r s
{ 
return 
null 
; 
} 
return 
new 
PhoneNumber "
(" #
value# (
)( )
;) *
} 	
public 
string 
Value 
{ 
get !
;! "
init# '
;' (
}) *
[ 	
GeneratedRegex	 
( 
Pattern 
)  
]  !
private 
static 
partial 
Regex $
PhoneNumberRegex% 5
(5 6
)6 7
;7 8
} 
} ù
=D:\PruebaColorado\WebApiTest\Domain\Primitives\IUnitOfWork.cs
	namespace 	
Domain
 
. 

Primitives 
{ 
public 

	interface 
IUnitOfWork  
{ 
Task 
< 
int 
> 
SaveChangesAsync "
(" #
CancellationToken# 4
cancellationToken5 F
=G H
defaultI P
)P Q
;Q R
} 
}		 ã
=D:\PruebaColorado\WebApiTest\Domain\Primitives\DomainEvent.cs
	namespace 	
Domain
 
. 

Primitives 
{ 
public 

record 
DomainEvent 
( 
Guid "
id# %
)% &
:' (
INotification) 6
;6 7
} ñ
>D:\PruebaColorado\WebApiTest\Domain\Primitives\AgregateRoot.cs
	namespace 	
Domain
 
. 

Primitives 
{ 
public 

abstract 
class 
AgregateRoot &
{ 
private 
readonly 
List 
< 
DomainEvent )
>) *
_domainEvents+ 8
=9 :
new; >
(> ?
)? @
;@ A
public 
ICollection 
< 
DomainEvent &
>& '
GetDomainEvents( 7
(7 8
)8 9
=>: <
_domainEvents= J
;J K
	protected		 
void		 
Raise		 
(		 
DomainEvent		 (
domainEvent		) 4
)		4 5
=>		6 8
_domainEvents		9 F
.		F G
Add		G J
(		J K
domainEvent		K V
)		V W
;		W X
}

 
} ‘
DD:\PruebaColorado\WebApiTest\Domain\Customers\ICustomerRepository.cs
	namespace 	
Domain
 
. 
	Customers 
{ 
public 

	interface 
ICustomerRepository (
{ 
Task 
< 
List 
< 
Customer 
> 
> 
GetAll #
(# $
)$ %
;% &
Task 
< 
Customer 
? 
> 
GetByIdAsync $
($ %

CustomerId% /
id0 2
)2 3
;3 4
Task 
< 
Customer 
? 
> 
GetByIdentification +
(+ ,
string, 2
identification3 A
)A B
;B C
Task		 
<		 
bool		 
>		 
ExistsAsync		 
(		 

CustomerId		 )
id		* ,
)		, -
;		- .
void

 
Add

 
(

 
Customer

 
customer

 "
)

" #
;

# $
void 
Update 
( 
Customer 
customer %
)% &
;& '
void 
Delete 
( 
Customer 
customer %
)% &
;& '
} 
} «
;D:\PruebaColorado\WebApiTest\Domain\Customers\CustomerId.cs
	namespace 	
Domain
 
. 
	Customers 
; 
public 
record 

CustomerId 
( 
Guid 
Value #
)# $
;$ %›
9D:\PruebaColorado\WebApiTest\Domain\Customers\Customer.cs
	namespace 	
Domain
 
. 
	Customers 
{ 
public 

sealed 
class 
Customer  
:! "
AgregateRoot# /
{ 
public		 
Customer		 
(		 

CustomerId		 "
id		# %
,		% &
string		' -
name		. 2
,		2 3
string		4 :
lastName		; C
,		C D
string		E K
identification		L Z
,		Z [
string		\ b
phoneNumber		c n
,		n o
bool		p t
active		u {
)		{ |
{

 	
Id 
= 
id 
; 
Name 
= 
name 
; 
LastName 
= 
lastName 
;  
Identification 
= 
identification +
;+ ,
PhoneNumber 
= 
phoneNumber %
;% &
Active 
= 
active 
; 
} 	
private 
Customer 
( 
) 
{ 
} 
public 

CustomerId 
Id 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
string 
Name 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
=1 2
string3 9
.9 :
Empty: ?
;? @
public 
string 
LastName 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
=5 6
string7 =
.= >
Empty> C
;C D
public 
string 
FullName 
=> !
$"" $
{$ %
Name% )
}) *
$str* +
{+ ,
LastName, 4
}4 5
"5 6
;6 7
public 
string 
Identification $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public 
string 
PhoneNumber !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
bool 
Active 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
static 
Customer 
UpdateCustomer -
(- .
Guid. 2
id3 5
,5 6
string7 =
name> B
,B C
stringD J
lastNameK S
,S T
stringU [
identification\ j
,j k
stringl r
phoneNumbers ~
,~ 
bool
€ „
active
… ‹
)
‹ Œ
{   	
return!! 
new!! 
Customer!! 
(!!  
new!!  #

CustomerId!!$ .
(!!. /
id!!/ 1
)!!1 2
,!!2 3
name!!4 8
,!!8 9
lastName!!: B
,!!B C
identification!!D R
,!!R S
phoneNumber!!T _
,!!_ `
active!!b h
)!!h i
;!!i j
}"" 	
}## 
}$$ 