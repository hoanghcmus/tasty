using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_ArticleCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListPager_PreRender(object sender, EventArgs e)
    {

        string IDTheLoai = Request.QueryString["catID"] ?? "0";
        List<BaiViet> listBV = BaiViet.LayTheoIDTheLoai_List(IDTheLoai);

        if (listBV != null && listBV.Count != 0)
        {
            rptArticleList.DataSource = listBV;
            rptArticleList.DataBind();

            lbtitle.Text = listBV.First().TenTheLoai_Vn;
        }
    }

    protected void rptArticleList_DataBound(object sender, EventArgs e)
    {
        ListPager.Visible = (ListPager.PageSize < ListPager.TotalRowCount);
    }

    public string ShowInfor(object data, string columnname)
    {
        BaiViet baiviet = data as BaiViet;
        switch (columnname)
        {
            case "laylink":
                return ChangeToThumbPathImage(baiviet.HinhAnh);
            default:
                return "";
        }
    }
    public string ChangeToThumbPathImage(string originalPath)
    {
        return originalPath.Replace("Uploads", "Uploads/_thumbs");
    }
}