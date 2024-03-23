using Customers.Common;
using Domain.Customers;
using ErrorOr;
using MediatR;

namespace Application.Customers.GetById;


internal sealed class GetCustomerByIdQueryHandler : IRequestHandler<GetCustomerByIdQuery, ErrorOr<CustomerResponse>>
{
    private readonly ICustomerRepository _customerRepository;

    public GetCustomerByIdQueryHandler(ICustomerRepository customerRepository)
    {
        _customerRepository = customerRepository ?? throw new ArgumentNullException(nameof(customerRepository));
    }

    public async Task<ErrorOr<CustomerResponse>> Handle(GetCustomerByIdQuery query, CancellationToken cancellationToken)
    {
        if (await _customerRepository.GetByIdAsync(new CustomerId(query.Id)) is not Customer customer)
        {
            return Error.NotFound("Customer.NotFound", "El cliente con el Id proporcionado no fue encontrado");
        }

        return new CustomerResponse(
            customer.Id.Value, 
            customer.FullName, 
            customer.Identification, 
            customer.PhoneNumber, 
            customer.Active);
    }
}