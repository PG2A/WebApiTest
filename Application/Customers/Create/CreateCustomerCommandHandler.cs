using Domain.Customers;
using Domain.Primitives;
using Domain.ValueObjects;
using ErrorOr;
using MediatR;

namespace Application.Customers.Create;

internal sealed class CreateCustomerCommandHandler : IRequestHandler<CreateCustomerCommand, ErrorOr<Guid>>
{
    private readonly ICustomerRepository _customerRepository;
    private readonly IUnitOfWork _unitOfWork;

    public CreateCustomerCommandHandler(ICustomerRepository customerRepository, IUnitOfWork unitOfWork)
    {
        _customerRepository = customerRepository ?? throw new ArgumentNullException(nameof(customerRepository));
        _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
    }

    public async Task<ErrorOr<Guid>> Handle(CreateCustomerCommand command, CancellationToken cancellationToken)
    {
        try
        {
            //if (PhoneNumber.Create(command.PhoneNumber) is not PhoneNumber phoneNumber)
            //{
            //    return Error.Validation("Customer.PhoneNumber", "El numero de telefono no tiene un formato valido");
            //}

            var customer = new Customer(
                new CustomerId(Guid.NewGuid()),
                command.Name,
                command.LastName,
                command.Identification,
                command.PhoneNumber,
                true);

            _customerRepository.Add(customer);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return customer.Id.Value;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
            throw;
        }

        

        
    }
}
