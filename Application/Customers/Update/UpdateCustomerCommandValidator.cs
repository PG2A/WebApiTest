using FluentValidation;

namespace Application.Customers.Update;

public class UpdateCustomerCommandValidator : AbstractValidator<UpdateCustomerCommand>
{
    public UpdateCustomerCommandValidator()
    {
         RuleFor(r => r.Id)
            .NotEmpty();

        RuleFor(r => r.Name)
            .NotEmpty()
            .MaximumLength(50);

        RuleFor(r => r.LastName)
             .NotEmpty()
             .MaximumLength(50)
             .WithName("Last Name");

        RuleFor(r => r.Identification)
             .NotEmpty()
             .EmailAddress()
             .MaximumLength(255);

        RuleFor(r => r.PhoneNumber)
             .NotEmpty()
             .MaximumLength(9)
             .WithName("Phone Number");


        RuleFor(r => r.Active)
            .NotNull();
    }
}