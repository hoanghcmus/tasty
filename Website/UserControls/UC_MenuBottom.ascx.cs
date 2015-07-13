using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class UserControls_UC_MenuBottom : System.Web.UI.UserControl
{
    public string IDTheLoai { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<BaiViet> listBV = BaiViet.LayTheoIDTheLoai_List(IDTheLoai);
            if (listBV != null && listBV.Count > 0)
            {
                rptArticleList.DataSource = listBV;
                rptArticleList.DataBind();
                ltrCatTitle.Text = listBV.First().TenTheLoai_Vn;
            }
        }
    }
}