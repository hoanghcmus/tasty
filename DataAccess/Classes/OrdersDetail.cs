using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Classes
{
    public class OrdersDetail
    {
        #region khai bao cac thuoc tinh anh xa
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public decimal? SellPrice { get; set; }
        public decimal? Total { get; set; }
        #endregion
    }
}
