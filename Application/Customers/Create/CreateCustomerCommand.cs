using ErrorOr;
using MediatR;

namespace Application.Customers.Create;

public record CreateCustomerCommand(
    string Name,
    string LastName,
    string Identification,
    string PhoneNumber
    ) : IRequest<ErrorOr<Guid>>;

