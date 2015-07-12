using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class UserControl_UC_Hotline : System.Web.UI.UserControl
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
        List<HoTro> list_hotro = HoTro.LayTatCa();
        if (list_hotro.Count > 0)
        {
            dlhotro.DataSource = list_hotro;
            dlhotro.DataBind();
        }
        else
            this.Visible = false;
    }
    protected string ShowHotline(object sender, string column)
    {
        HoTro hotro = sender as HoTro;

        switch (column)
        {
            case "HotlineName":
                if (Session["lang"].ToString().Equals("vn")) { return hotro.Ten_Vn; }
                else if (Session["lang"].ToString().Equals("en")) { return hotro.Ten_En; }
                return hotro.Ten_Vn;

            default: return "";
        }
    }
}