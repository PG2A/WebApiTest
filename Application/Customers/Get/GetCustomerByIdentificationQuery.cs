using Customers.Common;
using ErrorOr;
using MediatR;

namespace Application.Customers.Get;

public record GetCustomerByIdentificationQuery(string Identification) : IRequest<ErrorOr<CustomerResponse>>;

