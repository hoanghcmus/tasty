using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Help;

public partial class View_Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    public string DecodeUtf8(string s_Input)
    {
        byte[] u8_Utf = new byte[s_Input.Length];
        for (int i = 0; i < s_Input.Length; i++)
        {
            if (s_Input[i] > 255)
                return s_Input;

            u8_Utf[i] = (byte)s_Input[i];
        }
        return Encoding.UTF8.GetString(u8_Utf);
    }

    protected void ListPager_PreRender(object sender, EventArgs e)
    {
        string IDTheLoai = Request.QueryString["catID"] ?? "1";
        string keyword = Request.QueryString["keyword"] ?? "";
        keyword = DecodeUtf8(keyword);

        int count = 0;
        List<TimKiem> listTimKiem = null;
        if (IDTheLoai.Equals("0"))
        {
            listTimKiem = TimKiem.TimKiemThongTin(keyword, out count);
        }
        else
        {
            listTimKiem = DataAccess.Classes.Product.TimKiemThongTin(Convert.ToInt32(IDTheLoai), keyword, out count);
        }

        if (listTimKiem != null && listTimKiem.Count > 0)
        {
            rptArticleList.DataSource = listTimKiem;
            rptArticleList.DataBind();
            lbtitle.Text = String.Format("Có <span style='color:red;'>{0}</span> kết quả phù hợp với từ khóa tìm kiếm của bạn", count);
        }
        else
        {
            lbtitle.Text = "Không có kết quả nào phù hợp với từ khóa bạn tìm kiêm";
        }
    }

    protected void rptArticleList_DataBound(object sender, EventArgs e)
    {
        ListPager.Visible = (ListPager.PageSize < ListPager.TotalRowCount);
    }

    public string ShowInfor(object data, string columnname)
    {
        TimKiem tk = data as TimKiem;
        switch (columnname)
        {
            case "linkanh":
                return ChangeToThumbPathImage(tk.HinhAnh);
            case "lienket":
                if (tk.Module.Equals("baiviet"))
                {
                    return String.Format("/{0}/{1}/detail-acticle.html", tk.IDTheLoai, tk.ID);
                }
                else
                {
                    return String.Format("/{0}/{1}/detail-product.html", tk.IDTheLoai, tk.ID);
                }
            default:
                return "";
        }
    }
    public string ChangeToThumbPathImage(string originalPath)
    {
        return Helper.ToThumb(originalPath); ;
    }
}