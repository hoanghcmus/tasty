using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Classes
{
    public class Customer
    {
        public string FullName { get; set; }
        public string Address { get; set; }
        public int Phone { get; set; }
        public string Email { get; set; }
        public string OtherRequire { get; set; }
        public Customer()
        {
        }
        public Customer(string FullName, string Address, int Phone, string Email, string OtherRequire)
        {
            this.FullName = FullName;
            this.Address = Address;
            this.Phone = Phone;
            this.Email = Email;
            this.OtherRequire = OtherRequire;
        }
    }
}
