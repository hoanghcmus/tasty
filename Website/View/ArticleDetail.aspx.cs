using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_ArticleDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateControls();
        }
    }

    private void PopulateControls()
    {
        string id = Request.QueryString["ID"];
        BaiViet data = BaiViet.LayTheoID(id);
        if (data != null)
        {
            int luotxem = data.LuotXem + 1;
            BaiViet.SuaLuotXem(id, luotxem.ToString());
            lblTitle.Text = data.TieuDe_Vn;
            lblFullText.Text = HttpUtility.HtmlDecode(data.ChiTiet_Vn);
            lbLuotXem.Text = " " + luotxem.ToString();
        }
    }
}