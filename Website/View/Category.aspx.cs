using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using MultipleLanguage;

public partial class View_Category : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string IDTheLoai = Request.QueryString["catID"] ?? "0";
            if (Session["lang"].ToString().Equals("vn"))
                ltrCatName.Text = TheLoai.LayTheoID(IDTheLoai).TieuDe_Vn;
            else
                ltrCatName.Text = TheLoai.LayTheoID(IDTheLoai).TieuDe_Cn;
            LoadListItem(IDTheLoai);
        }
    }

    public void LoadListItem(String IDTheLoai)
    {
        List<BaiViet> listBV = BaiViet.LayTheoIDTheLoai_List(IDTheLoai);
        if (listBV != null && listBV.Count != 0)
        {
            int itemCount = 7;
            int j = 1, k = 0;
            foreach (BaiViet bv in listBV)
            {
                if (j == 1)
                {
                    ltrItemList.Text += "<div class='left-small-wrapper' id='item" + (k + 1).ToString() + "'>";
                }

                ltrItemList.Text += "<div class='article-box item-link' data-lien-ket='" + ShowItem(bv, "LienKet") + "'>" +
                                        "<a href='javascript:void();' class='link'>" +
                                            "<img src='" + DataAccess.Help.Helper.ToThumb(bv.HinhAnh.Split('\'').First().ToString()) + "' alt='Thanh long Châu Hải Thịnh' class='img' />" +
                                            "<div class='article-box-title'>" +
                                                "<h1>" + ShowItem(bv, "TieuDe") + "</h1>" +
                                            "</div>" +
                                        "</a>" +
                                    "</div>";


                if ((listBV.Count - (itemCount * k) < itemCount) && (listBV.Count - (itemCount * k) == j))
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

    public string ShowItem(BaiViet bv, string column)
    {
        switch (column)
        {
            case "TieuDe":
                if (Session["lang"].ToString().Equals("vn"))
                    return bv.TieuDe_Vn;
                else
                    return bv.TieuDe_Cn;
            case "LienKet":
                return "/View/DetailArticle.aspx?ID=" + bv.ID;
            default: return "";
        }

    }

    public string ShowItem(object sender, string column)
    {
        BaiViet bv = sender as BaiViet;
        switch (column)
        {
            case "TieuDe":
                if (Session["lang"].ToString().Equals("vn"))
                    return bv.TieuDe_Vn;
                else
                    return bv.TieuDe_Cn;
            case "LienKet":
                return "/View/DetailArticle.aspx?ID=" + bv.ID;
            default: return "";
        }

    }
}