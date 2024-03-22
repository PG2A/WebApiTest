using Domain.Customers;
using Domain.ValueObjects;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Persistence.Configuration
{
    public class CustomerConfiguration : IEntityTypeConfiguration<Customer>
    {
        public void Configure(EntityTypeBuilder<Customer> builder)
        {
            builder.HasKey(x => x.Id);

            builder.Property(c => c.Id).HasConversion(
                customerId => customerId.Value,
                value => new CustomerId(value));

            builder.Property(c => c.Name).HasMaxLength(100);
            builder.Property(c => c.LastName).HasMaxLength(100);
            builder.Ignore(c => c.FullName);
            builder.Property(c => c.Identification).HasMaxLength(10);
            builder.HasIndex(c => c.Identification).IsUnique();

            builder.Property(c => c.PhoneNumber).HasConversion(
                phoneNumber => phoneNumber.Value,
                value => PhoneNumber.Create(value)!)
                .HasMaxLength(9);


        }
    }
}
