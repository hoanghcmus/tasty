using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Classes
{
    public class SessionCart
    {
        #region khai bao cac thuoc tinh anh xa
        public string SessionId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        #endregion

    }
}
