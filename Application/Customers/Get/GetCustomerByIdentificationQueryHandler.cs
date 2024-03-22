using Application.Customers.GetById;
using Customers.Common;
using Domain.Customers;
using ErrorOr;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Application.Customers.Get
{
    internal sealed class GetCustomerByIdentificationQueryHandler : IRequestHandler<GetCustomerByIdentificationQuery, ErrorOr<CustomerResponse>>
    {
        private readonly ICustomerRepository _customerRepository;

        public GetCustomerByIdentificationQueryHandler(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository ?? throw new ArgumentNullException(nameof(customerRepository));
        }

        public async Task<ErrorOr<CustomerResponse>> Handle(GetCustomerByIdentificationQuery query, CancellationToken cancellationToken)
        {
            if (await _customerRepository.GetByIdentification(query.Identification) is not Customer customer)
            {
                return Error.NotFound("Customer.NotFound", "El cliente con el número de cedula proporcionado no fue encontrado");
            }

            return new CustomerResponse(
            customer.Id.Value,
            customer.FullName,
            customer.Identification,
            customer.PhoneNumber.Value,
            customer.Active);
        }
    }
}
