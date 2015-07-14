using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Classes;

namespace DataAccess.Help
{
    public class GlobalVariable
    {
        public static Customer Customer
        {
            get
            {
                if (Customer == null) { return new Customer(); }
                return Customer;
            }
            set
            {
                Customer = value;
            }
        }
    }
}
