using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Classes
{
    public class User
    {
        #region khai bao cac thuoc tinh anh xa
        public int IDNguoiDung { get; set; }
        public string TenDangNhap { get; set; }
        //Các thuộc tính kết
        public string TenNguoiDung { get; set; }
        public int IDDangNhap { get; set; }
        public string HanhDongDangNhap { get; set; }
        public User() { }
        //Quan ly noi bo
        #endregion
    }
}
