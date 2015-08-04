using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Connect;
using DataAccess.Help;
using DataAccess.StringUtil;

public partial class View_Videos : Page
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
        int howManyPages = 0;
        string trang = Request.QueryString["Page"] ?? "1";
        string firstPageUrl = "";
        string pagerFormat = "";
        dlVideos.DataSource = ImageAndClips.LayTheoTheLoai("5", trang, out howManyPages);
        dlVideos.DataBind();
        firstPageUrl = Link.Videos();
        pagerFormat = Link.Videos("{0}");
        pagerBottom.Show(int.Parse(trang), howManyPages, firstPageUrl, pagerFormat, true);
    }
    protected string ShowVideo(object sender, string column)
    {
        ImageAndClips data = sender as ImageAndClips;

        switch (column)
        {
            case "VideoMoTa":
                return data.MoTa_Vn;

            case "VideoTieuDe":
                return data.Ten_Vn;

            default: return "";
        }
    }
}