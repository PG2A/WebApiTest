using ErrorOr;
using MediatR;

namespace Application.Customers.Update;

public record UpdateCustomerCommand(
    Guid Id,
    string Name,
    string LastName,
    string Identification,
    string PhoneNumber,
    bool Active) : IRequest<ErrorOr<Unit>>;