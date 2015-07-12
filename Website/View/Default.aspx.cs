using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core;
using DataAccess.Classes;
using DataAccess.Connect;
using DataAccess.Help;
using DataAccess.StringUtil;
using MultipleLanguage;

public partial class Vn_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BaiViet baiviet = BaiViet.LayTheoID("36");
            if (baiviet != null)
            {
                if (Session["lang"].ToString().Equals("vn"))
                {
                    ltrTieuDe.Text = baiviet.TieuDe_Vn;
                    ltBaiVietGioiThieu.Text = baiviet.TomTat_Vn;
                    hlReadMore.NavigateUrl = "/vn/" + baiviet.IDTheLoai + "/category.html";
                }

                else if (Session["lang"].ToString().Equals("cn"))
                {
                    ltrTieuDe.Text = baiviet.TieuDe_Cn;
                    ltBaiVietGioiThieu.Text = baiviet.TomTat_Cn;
                    hlReadMore.NavigateUrl = "/cn/" + baiviet.IDTheLoai + "/category.html";
                }

            }
        }
    }

    protected string ShowMainMenu(object sender, string column)
    {
        TheLoai theloai = sender as TheLoai;

        switch (column)
        {
            case "MenuDuongDan":
                if (Session["lang"].ToString().Equals("vn")) { return theloai.DuongDan_Vn; }
                else if (Session["lang"].ToString().Equals("en")) { return theloai.DuongDan_En; }

                return theloai.DuongDan_Vn;

            case "MenuTieuDe":
                if (Session["lang"].ToString().Equals("vn")) { return theloai.TieuDe_Vn; }
                else if (Session["lang"].ToString().Equals("en")) { return theloai.TieuDe_En; }

                return theloai.DuongDan_Vn;

            default: return "";
        }
    }


    private void LoadFirstAlbum()
    {
        ImageAndClips data = ImageAndClips.LayTheoID("10");
        if (data != null)
        {
            List<Img> listimgs = new List<Img>();
            string listimg = data.ImgOrClip;
            string[] str = listimg.Split('\'');
            int i = 1;
            foreach (var item in str)
            {
                if (item.ToString() != "")
                {
                    if (i <= 6)
                    {
                        Img dataimg = new Img();
                        dataimg.HinhAnh = item.ToString();
                        listimgs.Add(dataimg);
                    }
                    i++;
                }
            }
            //dlListimages.DataSource = listimgs;
            //dlListimages.DataBind();
        }
    }

    private void LoadAlbum()
    {
        ImageAndClips data = ImageAndClips.LayTheoID("2");
        if (data != null)
        {
            List<Img> listimgs = new List<Img>();
            string listimg = data.ImgOrClip;
            string[] str = listimg.Split('\'');

            foreach (var item in str)
            {
                if (item.ToString() != "")
                {
                    Img dataimg = new Img();
                    dataimg.HinhAnh = item.ToString();
                    listimgs.Add(dataimg);
                }
            }

            Literal ltrListImages = new Literal();
            int j = 1;
            foreach (Img img in listimgs)
            {
                if (j == 1)
                {
                    ltrListImages.Text += "<li>";
                }
                ltrListImages.Text += "<div class='photo-item'>"
                             + "<a class='highslide imgshow link' rel='main-gallery' href='" + img.HinhAnh + "'>"
                                 + "<img src='" + img.HinhAnh + "' alt='Picture' class='img' />"
                             + "</a>"
                          + "</div>";

                if (j == 2)
                {
                    ltrListImages.Text += "</li>";
                    j = 1;
                    continue;
                }
                j++;

            }
        }
    }

    public string getLinkVideo(string id)
    {
        ImageAndClips imgcl = ImageAndClips.LayTheoID(id);
        if (imgcl != null)
            return imgcl.ImgOrClip;
        else return "#";
    }

    public static int ImageAndClips_GetLastID()
    {
        try
        {
            return Convert.ToInt32(DataProvider.Instance.ExecuteScalar("ImageAndClips_GetLastID"));
        }
        catch
        {
            return 0;
        }
    }
}