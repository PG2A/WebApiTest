using Domain.Primitives;
using Domain.ValueObjects;
using System.Net;

namespace Domain.Customers
{
    public sealed class Customer : AgregateRoot
    {
        public Customer(CustomerId id, string name, string lastName, string identification, string phoneNumber, bool active)
        {
            Id = id;
            Name = name;
            LastName = lastName;
            Identification = identification;
            PhoneNumber = phoneNumber;
            Active = active;
        }

        // para que entity framework pueda crear la entidad y no tenga problemas con el constructor
        private Customer() { }  

        public CustomerId Id { get; private set; }
        public string Name { get; private set; } = string.Empty;
        public string LastName { get; private set; } = string.Empty;
        public string FullName => $"{Name} {LastName}";
        public string Identification { get; private set; }

        public string PhoneNumber { get; private set; }
        public bool Active { get; private set; }

        public static Customer UpdateCustomer(Guid id, string name, string lastName, string identification, string phoneNumber, bool active)
        {
            return new Customer(new CustomerId(id), name, lastName, identification, phoneNumber,  active);
        }
    }
}
