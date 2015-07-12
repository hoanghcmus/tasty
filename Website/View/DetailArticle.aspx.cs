using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_DetailArticle : System.Web.UI.Page
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

            if (Session["lang"].ToString().Equals("vn"))
            {

                lblTitle.Text = data.TieuDe_Vn;
                ltrContent.Text = HttpUtility.HtmlDecode(data.ChiTiet_Vn);
            }
            else if (Session["lang"].ToString().Equals("cn"))
            {
                lblTitle.Text = data.TieuDe_Cn;
                ltrContent.Text = HttpUtility.HtmlDecode(data.ChiTiet_Cn);

            }
           LoadImages(data.HinhAnh);
        }
    }

    protected void LoadImages(string listimg)
    {
        List<Img> album = new List<Img>();
        int idimg = 0;
        string[] str = listimg.Split('\'');
        foreach (var item in str)
        {
            if (item.ToString() != "")
            {
                Img dataimg = new Img();
                dataimg.ID = idimg;
                dataimg.HinhAnh = item.ToString();
                album.Add(dataimg);
                idimg++;
            }
        }
        repslideshow.DataSource = album;
        repslideshow.DataBind();
    }

}