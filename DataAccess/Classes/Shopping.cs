using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Core;
using DataAccess.Help;
using System.Data;
using DataAccess.Connect;

namespace DataAccess.Classes
{
    public class Shopping
    {
        public Int32 ID { get; set; }
        public String HoTen { get; set; }
        public String Email { get; set; }
        public String DiaChi { get; set; }
        public Int32 SDT { get; set; }
        public String YeuCauThem { get; set; }
        public DateTime NgayOrder { get; set; }
        public Decimal TongHoaDon { get; set; }
        public Int32 TrangThai { get; set; }
        public String SessionID { get; set; }

        public Shopping()
        {
        }

        #region Cac phuong thuc Update du lieu
        public static int Them(Shopping sh)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "Orders_Them", sh.ID, sh.HoTen, sh.Email, sh.DiaChi, sh.SDT, sh.YeuCauThem, sh.NgayOrder, sh.TongHoaDon, sh.TrangThai, sh.SessionID);
                return Convert.ToInt32(rs);
            }
            catch
            {
                return 0;
            }
        }
        public static bool Sua(Shopping sh)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQuery("Orders_Sua", sh.ID, sh.HoTen, sh.Email, sh.DiaChi, sh.SDT, sh.YeuCauThem, sh.NgayOrder, sh.TongHoaDon, sh.TrangThai, sh.SessionID);
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool SuaTrangThai(int id, string trangthai)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQuery("Orders_SuaTrangThai", id, ConvertType.ToInt32(trangthai));
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Xoa(string id)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQuery("Orders_Xoa", Convert.ToInt32(id));
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region Cac phuong thuc truy xuat du lieu
        public static List<Shopping> LayTheoTrangThai(string trangThai, string page, out int howManyPages)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Orders_LayTheoTrangThai", ConvertType.ToInt32(trangThai), GlobalConfiguration.DescriptionLength, page, GlobalConfiguration.PageSize);
                reader.Read();
                howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Shopping>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                howManyPages = 0;
                return new List<Shopping>();
            }
        }

        public static List<Shopping> LayTatCa(string page, out int howManyPages)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Orders_LayTatCa", GlobalConfiguration.DescriptionLength, page, GlobalConfiguration.PageSize);
                reader.Read();
                howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Shopping>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                howManyPages = 0;
                return new List<Shopping>();
            }
        }


        public static int Dem()
        {
            try
            {
                return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Orders_Dem"));
            }
            catch
            {
                return 0;
            }
        }
        public static int DemTheoTrangThai(string trangthai)
        {
            try
            {
                return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Orders_DemTheoTrangThai", ConvertType.ToInt32(trangthai)));
            }
            catch
            {
                return 0;
            }
        }
        public static List<Shopping> ByDate(string startDate, string endDate)
        {
            try
            {
                return CBO.FillCollection<Shopping>(DataProvider.Instance.ExecuteReader("Orders_ByDate", startDate, endDate));
            }
            catch (Exception)
            {
                return new List<Shopping>();
            }
        }
        public static Shopping LayTheoID(string id)
        {
            try
            {
                return CBO.FillObject<Shopping>(DataProvider.Instance.ExecuteReader("Orders_LayTheoID", Convert.ToInt32(id)));
            }
            catch
            {
                return null;
            }
        }

        #endregion

    }
}
