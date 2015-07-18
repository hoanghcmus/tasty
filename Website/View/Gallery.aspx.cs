using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string IDTheLoai = Request.QueryString["catID"] ?? "0";
            rptArticleList.DataSource = ImageAndClips.LayTheoIDTheLoai(IDTheLoai);
            rptArticleList.DataBind();
        }
    }

    public void LoadListItem(String IDTheLoai)
    {
        Literal ltrItemList = new Literal();
        List<ImageAndClips> listImgAndCip = ImageAndClips.LayTheoIDTheLoai(IDTheLoai);
        if (listImgAndCip != null && listImgAndCip.Count != 0)
        {
            int itemCount = 7;
            int j = 1, k = 0;
            foreach (ImageAndClips imgAndClip in listImgAndCip)
            {
                if (j == 1)
                {
                    ltrItemList.Text += "<div class='left-full-wrapper' id='item" + (k + 1).ToString() + "'>";
                }

                ltrItemList.Text += "<div class='left-nav-item item-link' data-lien-ket='" + ShowItem(imgAndClip, "LienKet") + "'>" +
                                        "<a href='javascript:void();' class='link'>" +
                                            "<h1 class='text-center'>" + ShowItem(imgAndClip, "TieuDe") + "</h1>" +
                                        "</a>" +
                                    "</div>";

                if ((listImgAndCip.Count - (itemCount * k) < itemCount) && (listImgAndCip.Count - (itemCount * k) == j))
                {
                    ltrItemList.Text += "</div>";
                    break;
                }

                if (j == itemCount)
                {

                    ltrItemList.Text += "</div>";
                    j = 1;
                    k++;
                    continue;
                }
                j++;

            }
        }
    }

    protected string getFirstImage(string listimg)
    {
        string[] str = listimg.Split('\'');
        return str.First().ToString();
    }

    public string ShowItem(ImageAndClips imgAndClip, string column)
    {
        switch (column)
        {
            case "TieuDe":
                return imgAndClip.Ten_Vn;

            case "LienKet":
                return "/View/DetailPhoto.aspx?ID=" + imgAndClip.ID;
            default: return "";
        }

    }

    public string ShowItem(object sender, string column)
    {
        ImageAndClips imgAndClip = sender as ImageAndClips;
        switch (column)
        {
            case "TieuDe":

                return imgAndClip.Ten_Vn;

            case "LienKet":
                return "/View/DetailPhoto.aspx?ID=" + imgAndClip.ID;
            default: return "";
        }

    }
}