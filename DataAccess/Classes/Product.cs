using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Core;
using DataAccess.Connect;
using DataAccess.Help;

namespace DataAccess.Classes
{
    public partial class Product
    {
        #region khai bao cac thuoc tinh anh xa
        public int ID { get; set; }
        public int ProductCategoryID { get; set; }
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public string Detail { get; set; }

        public decimal OldPrice { get; set; }
        public int Discount { get; set; }
        public decimal NewPrice { get; set; }

        public string Thumbnail { get; set; }
        public string Image { get; set; }

        public string Origin { get; set; }
        public string Guarantee { get; set; }

        public int IsNew { get; set; }
        public string TenTheLoai_Vn { get; set; }
        public Product() { }
        #endregion

        #region Cac phuong thuc Update du lieu
        public static bool Add(Product product)
        {
            try
            {
                object rs = DataProvider.Instance.ExecuteNonQueryWithOutput("@ID", "Product_Add",
                    product.ID, product.ProductCategoryID, product.ProductCode, product.ProductName, product.Description, product.Detail, product.OldPrice, product.Discount, product.NewPrice, product.Thumbnail, product.Image, product.Origin, product.Guarantee, product.IsNew);
                return Convert.ToInt32(rs) > 0;
            }
            catch
            {
                return false;
            }
        }
        public static bool Update(Product product)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Product_Update",
                    product.ID, product.ProductCategoryID, product.ProductCode, product.ProductName, product.Description, product.Detail, product.OldPrice, product.Discount, product.NewPrice, product.Thumbnail, product.Image, product.Origin, product.Guarantee, product.IsNew);
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }

        public static bool Delete(string productID)
        {
            try
            {
                int rs = DataProvider.Instance.ExecuteNonQuery("Product_Delete", Convert.ToInt32(productID));
                return rs > 0;
            }
            catch
            {
                return false;
            }
        }
        #endregion

        #region Cac phuong thuc truy xuat du lieu
        public static int Count()
        {
            try
            {
                return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("Product_Count"));
            }
            catch
            {
                return 0;
            }
        }

        public static List<Product> Product_GetIdAll()
        {
            try
            {
                return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_GetIdAll"));
            }
            catch
            {
                return null;
            }
        }


        public static Product Single(string productId)
        {
            try
            {
                return CBO.FillObject<Product>(DataProvider.Instance.ExecuteReader("Product_Single",
                                                Convert.ToInt32(productId)));
            }
            catch
            {
                return null;
            }
        }
        public static List<Product> LayTheoIDTheLoaiTop8(string menuID)
        {
            try
            {
                return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_LayTheoIDTheLoaiTop8", ConvertType.ToInt32(menuID)));
            }
            catch
            { return null; }
        }

        public static List<Product> LayTheoIDTheLoaiExceptID(string menuID, string productID)
        {
            try
            {
                return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_LayTheoIDTheLoaiExceptID", ConvertType.ToInt32(menuID), ConvertType.ToInt32(productID)));
            }
            catch
            { return null; }
        }

        public static List<Product> LayTheoIDTheLoai(string menuID)
        {
            try
            {
                return CBO.FillCollection<Product>(DataProvider.Instance.ExecuteReader("Product_LayTheoIDTheLoai", ConvertType.ToInt32(menuID)));
            }
            catch
            { return null; }
        }


        public static List<TimKiem> TimKiemThongTin(int IDTheLoai, string searchString, out int count)
        {
            IDataReader reader = null;
            try
            {
                reader = DataProvider.Instance.ExecuteReader("Product_TimKiem", IDTheLoai, searchString.Trim());
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
      

        public static List<Product> Search(string searchString, string page, out int howManyPages)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_Search", searchString, GlobalConfiguration.DescriptionLength, page, GlobalConfiguration.PageSize);
                reader.Read();
                howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                howManyPages = 0;
                return new List<Product>();
            }
        }
        public static List<Product> SearchInMenu(string menuID, string searchString, string page, out int howManyPages)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_Search", menuID, searchString, GlobalConfiguration.DescriptionLength, page, GlobalConfiguration.PageSize);
                reader.Read();
                howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                howManyPages = 0;
                return new List<Product>();
            }
        }
        public static List<Product> InMenu(string menuId, string page, out int howManyPages)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_InMenu", Convert.ToInt32(menuId),
                    GlobalConfiguration.DescriptionLength, Convert.ToInt32(page), pageSize);
                reader.Read();
                howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);
                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false) reader.Close();
                howManyPages = 0; return new List<Product>();
            }
        }

        public static List<Product> Paging(string page, out int howManyPages)
        {
            IDataReader reader = null;
            try
            {
                int pageSize = GlobalConfiguration.PageSize;
                reader = DataProvider.Instance.ExecuteReader("Product_Paging", page, GlobalConfiguration.PageSize);
                reader.Read();
                howManyPages = (int)Math.Ceiling((double)reader.GetInt32(0) / (double)pageSize);

                reader.NextResult();
                return CBO.FillCollection<Product>(reader);
            }
            catch
            {
                if (reader != null && reader.IsClosed == false)
                    reader.Close();
                howManyPages = 0;
                return new List<Product>();
            }
        }
        #endregion
    }
}
