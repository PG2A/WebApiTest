ã
ZD:\PruebaColorado\WebApiTest\Infrastructure\Persistence\Repositories\CustomerRepository.cs
	namespace 	
Infrastructure
 
. 
Persistence $
.$ %
Repositories% 1
{ 
public 

class 
CustomerRepository #
:$ %
ICustomerRepository& 9
{ 
private		 
readonly		  
ApplicationDbContext		 -
_context		. 6
;		6 7
public 
CustomerRepository !
(! " 
ApplicationDbContext" 6
context7 >
)> ?
{ 	
_context 
= 
context 
?? !
throw" '
new( +!
ArgumentNullException, A
(A B
nameofB H
(H I
contextI P
)P Q
)Q R
;R S
} 	
public 
void 
Add 
( 
Customer  
customer! )
)) *
=>+ -
_context. 6
.6 7
	Customers7 @
.@ A
AddA D
(D E
customerE M
)M N
;N O
public 
void 
Delete 
( 
Customer #
customer$ ,
), -
=>. 0
_context1 9
.9 :
	Customers: C
.C D
RemoveD J
(J K
customerK S
)S T
;T U
public 
void 
Update 
( 
Customer #
customer$ ,
), -
=>. 0
_context1 9
.9 :
	Customers: C
.C D
UpdateD J
(J K
customerK S
)S T
;T U
public 
async 
Task 
< 
bool 
> 
ExistsAsync  +
(+ ,

CustomerId, 6
id7 9
)9 :
=>; =
await> C
_contextD L
.L M
	CustomersM V
.V W
AnyAsyncW _
(_ `
customer` h
=>i k
customerl t
.t u
Idu w
==x z
id{ }
)} ~
;~ 
public 
async 
Task 
< 
Customer "
?" #
># $
GetByIdAsync% 1
(1 2

CustomerId2 <
id= ?
)? @
=>A C
awaitD I
_contextJ R
.R S
	CustomersS \
.\ ] 
SingleOrDefaultAsync] q
(q r
cr s
=>t v
cw x
.x y
Idy {
==| ~
id	 Å
)
Å Ç
;
Ç É
public 
async 
Task 
< 
Customer "
?" #
># $
GetByIdentification% 8
(8 9
string9 ?
identification@ N
)N O
=>P R
awaitS X
_contextY a
.a b
	Customersb k
.k l!
SingleOrDefaultAsync	l Ä
(
Ä Å
c
Å Ç
=>
É Ö
c
Ü á
.
á à
Identification
à ñ
==
ó ô
identification
ö ®
)
® ©
;
© ™
public 
async 
Task 
< 
List 
< 
Customer '
>' (
>( )
GetAll* 0
(0 1
)1 2
=>3 5
await6 ;
_context< D
.D E
	CustomersE N
.N O
ToListAsyncO Z
(Z [
)[ \
;\ ]
} 
} ˙
eD:\PruebaColorado\WebApiTest\Infrastructure\Persistence\Migrations\20240322024426_InitialMigration.cs
	namespace 	
Infrastructure
 
. 
Persistence $
.$ %

Migrations% /
{ 
public		 

partial		 
class		 
InitialMigration		 )
:		* +
	Migration		, 5
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str !
,! "
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
falsea f
)f g
,g h
LastName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
	maxLengthK T
:T U
$numV Y
,Y Z
nullable[ c
:c d
falsee j
)j k
,k l
Identification "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ N
,N O
	maxLengthP Y
:Y Z
$num[ ]
,] ^
nullable_ g
:g h
falsei n
)n o
,o p
PhoneNumber 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= K
,K L
	maxLengthM V
:V W
$numX Z
,Z [
nullable\ d
:d e
falsef k
)k l
,l m
Active 
= 
table "
." #
Column# )
<) *
bool* .
>. /
(/ 0
type0 4
:4 5
$str6 ;
,; <
nullable= E
:E F
falseG L
)L M
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 3
,3 4
x5 6
=>7 9
x: ;
.; <
Id< >
)> ?
;? @
} 
) 
; 
migrationBuilder 
. 
CreateIndex (
(( )
name 
: 
$str 3
,3 4
table   
:   
$str   "
,  " #
column!! 
:!! 
$str!! (
,!!( )
unique"" 
:"" 
true"" 
)"" 
;"" 
}## 	
	protected&& 
override&& 
void&& 
Down&&  $
(&&$ %
MigrationBuilder&&% 5
migrationBuilder&&6 F
)&&F G
{'' 	
migrationBuilder(( 
.(( 
	DropTable(( &
(((& '
name)) 
:)) 
$str)) !
)))! "
;))" #
}** 	
}++ 
},, ◊
^D:\PruebaColorado\WebApiTest\Infrastructure\Persistence\Configuration\CustomerConfiguration.cs
	namespace 	
Infrastructure
 
. 
Persistence $
.$ %
Configuration% 2
{ 
public 

class !
CustomerConfiguration &
:' ($
IEntityTypeConfiguration) A
<A B
CustomerB J
>J K
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0
Customer

0 8
>

8 9
builder

: A
)

A B
{ 	
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Id" $
)$ %
;% &
builder 
. 
Property 
( 
c 
=> !
c" #
.# $
Id$ &
)& '
.' (
HasConversion( 5
(5 6

customerId 
=> 

customerId (
.( )
Value) .
,. /
value 
=> 
new 

CustomerId '
(' (
value( -
)- .
). /
;/ 0
builder 
. 
Property 
( 
c 
=> !
c" #
.# $
Name$ (
)( )
.) *
HasMaxLength* 6
(6 7
$num7 :
): ;
;; <
builder 
. 
Property 
( 
c 
=> !
c" #
.# $
LastName$ ,
), -
.- .
HasMaxLength. :
(: ;
$num; >
)> ?
;? @
builder 
. 
Ignore 
( 
c 
=> 
c  !
.! "
FullName" *
)* +
;+ ,
builder 
. 
Property 
( 
c 
=> !
c" #
.# $
Identification$ 2
)2 3
.3 4
HasMaxLength4 @
(@ A
$numA C
)C D
;D E
builder 
. 
HasIndex 
( 
c 
=> !
c" #
.# $
Identification$ 2
)2 3
.3 4
IsUnique4 <
(< =
)= >
;> ?
builder 
. 
Property 
( 
c 
=> !
c" #
.# $
PhoneNumber$ /
)/ 0
.0 1
HasMaxLength1 =
(= >
$num> @
)@ A
;A B
}   	
}!! 
}"" ı
OD:\PruebaColorado\WebApiTest\Infrastructure\Persistence\ApplicationDbContext.cs
	namespace 	
Infrastructure
 
. 
Persistence $
{		 
public

 

class

  
ApplicationDbContext

 %
:

& '
	DbContext

( 1
,

1 2 
IAplicationDbContext

3 G
,

G H
IUnitOfWork

I T
{ 
private 
readonly 

IPublisher #

_publisher$ .
;. /
public  
ApplicationDbContext #
(# $
DbContextOptions$ 4
options5 <
,< =

IPublisher> H
	publisherI R
)R S
:T U
baseV Z
(Z [
options[ b
)b c
{ 	

_publisher 
= 
	publisher "
??# %
throw& +
new, /!
ArgumentNullException0 E
(E F
nameofF L
(L M
	publisherM V
)V W
)W X
;X Y
} 	
public 
DbSet 
< 
Customer 
> 
	Customers (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. +
ApplyConfigurationsFromAssembly 8
(8 9
typeof9 ?
(? @ 
ApplicationDbContext@ T
)T U
.U V
AssemblyV ^
)^ _
;_ `
} 	
public 
override 
async 
Task "
<" #
int# &
>& '
SaveChangesAsync( 8
(8 9
CancellationToken9 J
cancellationTokenK \
=] ^
new_ b
CancellationTokenc t
(t u
)u v
)v w
{ 	
var 
domainEvents 
= 
ChangeTracker ,
., -
Entries- 4
<4 5
AgregateRoot5 A
>A B
(B C
)C D
. 
Select 
( 
e 
=> 
e 
. 
Entity %
)% &
. 
Where 
( 
e 
=> 
e 
. 
GetDomainEvents -
(- .
). /
./ 0
Any0 3
(3 4
)4 5
)5 6
. 

SelectMany 
( 
e 
=>  
e! "
." #
GetDomainEvents# 2
(2 3
)3 4
)4 5
;5 6
var!! 
result!! 
=!! 
await!! 
base!! #
.!!# $
SaveChangesAsync!!$ 4
(!!4 5
cancellationToken!!5 F
)!!F G
;!!G H
foreach## 
(## 
var## 
domainEvent## $
in##% '
domainEvents##( 4
)##4 5
{$$ 
await%% 

_publisher%%  
.%%  !
Publish%%! (
(%%( )
domainEvent%%) 4
,%%4 5
cancellationToken%%6 G
)%%G H
;%%H I
}&& 
return(( 
result(( 
;(( 
})) 	
}** 
}++ ≈
AD:\PruebaColorado\WebApiTest\Infrastructure\DependecyInjection.cs
	namespace 	
Infrastructure
 
{ 
public 

static 
class 
DependecyInjection *
{ 
public 
static 
IServiceCollection (
AddInfrastructure) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
IConfiguration] k
configurationl y
)y z
{ 	
services 
. 
AddPersistence #
(# $
configuration$ 1
)1 2
;2 3
return 
services 
; 
} 	
private 
static 
IServiceCollection )
AddPersistence* 8
(8 9
this9 =
IServiceCollection> P
servicesQ Y
,Y Z
IConfiguration[ i
configurationj w
)w x
{ 	
services 
. 
AddDbContext !
<! " 
ApplicationDbContext" 6
>6 7
(7 8
options8 ?
=>@ B
optionsC J
.J K
UseSqlServerK W
(W X
configurationX e
.e f
GetConnectionStringf y
(y z
$str	z Ñ
)
Ñ Ö
)
Ö Ü
)
Ü á
;
á à
services 
. 
	AddScoped 
<  
IAplicationDbContext 3
>3 4
(4 5
provider5 =
=>> @
providerA I
.I J
GetRequiredServiceJ \
<\ ] 
ApplicationDbContext] q
>q r
(r s
)s t
)t u
;u v
services 
. 
	AddScoped 
< 
IUnitOfWork *
>* +
(+ ,
provider, 4
=>5 7
provider8 @
.@ A
GetRequiredServiceA S
<S T 
ApplicationDbContextT h
>h i
(i j
)j k
)k l
;l m
services 
. 
	AddScoped 
< 
ICustomerRepository 2
,2 3
CustomerRepository4 F
>F G
(G H
)H I
;I J
return 
services 
; 
} 	
} 
} 