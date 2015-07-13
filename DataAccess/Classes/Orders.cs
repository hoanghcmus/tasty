using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Classes
{
    public class Orders
    {
        #region khai bao cac thuoc tinh anh xa
        public int ID { get; set; }
        public string Hoten { get; set; }
        public string Email { get; set; }
        public string DiaChi { get; set; }
        public int SDT { get; set; }
        public string YeuCauThem { get; set; }
        public DateTime NgayOrder { get; set; }
        public decimal? TongHoaDon { get; set; }
        public int TrangThai { get; set; }
        #endregion
    }
}
