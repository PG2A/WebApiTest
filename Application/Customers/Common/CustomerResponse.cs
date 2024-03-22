namespace Customers.Common;

public record CustomerResponse(
Guid Id,
string FullName,
string Identification,
string PhoneNumber,
bool Active);
