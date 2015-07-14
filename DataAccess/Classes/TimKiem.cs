using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Core;

namespace DataAccess.Classes
{
    public class TimKiem
    {
        #region khai bao cac thuoc tinh anh xa tim kiem
        public int ID { get; set; }
        public int IDTheLoai { get; set; }
        public string TieuDe { get; set; }
        public string MoTa { get; set; }
        public string HinhAnh { get; set; }
        public string ChiTiet { get; set; }
        public string Module { get; set; }


        public TimKiem() { }
        #endregion

        #region cac phuong thuc tim kiem
        public static List<TimKiem> TimKiemThongTin(string searchString, out int count)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("TimKiem_BaiViet_Va_SanPham", searchString);
                reader.Read();
                //count = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                count = reader.GetInt32(0);
                reader.NextResult();
                return CBO.FillCollection<TimKiem>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                count = 0;
                return new List<TimKiem>();
            }
        }
        #endregion

    }
}
