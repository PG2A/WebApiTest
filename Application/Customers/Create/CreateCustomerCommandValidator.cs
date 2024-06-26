using FluentValidation;

namespace Application.Customers.Create;

public class CreateCustomerCommandValidator : AbstractValidator<CreateCustomerCommand>
{
    public CreateCustomerCommandValidator()
    {
        RuleFor(r => r.Name)
            .NotEmpty()
            .MaximumLength(50);

        RuleFor(r => r.LastName)
             .NotEmpty()
             .MaximumLength(50)
             .WithName("Last Name");

        RuleFor(r => r.Identification)
             .NotEmpty()
             .MaximumLength(10)
             .WithName("Identification");

        RuleFor(r => r.PhoneNumber)
             .NotEmpty()
             .MaximumLength(11)
             .WithName("Phone Number");

    }
}