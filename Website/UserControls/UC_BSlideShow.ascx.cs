using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Help;

public partial class View_UserControl_UC_BSlideShow : System.Web.UI.UserControl
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

        repslideshow.DataSource = SlideShow.LayTheoHienThi(2);
        repslideshow.DataBind();
    }

    public string ShowItem(object sender, string func)
    {
        SlideShow slide = sender as SlideShow;
        switch (func)
        {
            case "src":
                return ToLarge(slide.HinhAnh);
            default: return "";
        }
    }

    public string ToLarge(string source)
    {
        source = source ?? "";
        return source.Replace("/slideshow/", "/bslideshow/");
    }
}