using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Help;

public partial class View_ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string productId = getPid();
            var pr = DataAccess.Classes.Product.Single(productId);
            if (pr != null)
            {
                PopulateControls(pr);
                ProductListThree.ID = pr.ID.ToString();
                ProductListThree.IDTheLoai = pr.ProductCategoryID.ToString();
            }
        }
    }

    public string getPid()
    {
        return Request.QueryString["ID"] ?? "0";
    }
    protected void PopulateControls(DataAccess.Classes.Product pr)
    {
        ltrTenSanPham.Text = pr.ProductName;
        ltrMaSanPham.Text = pr.ProductCode;
        ltrOldPrice.Text = showMoney(pr.OldPrice).ToString();
        ltrNewPrice.Text = showMoney(pr.NewPrice).ToString();
        ltrDiscount.Text = pr.Discount.ToString();
        ltrMoTa.Text = pr.Description;
        ltrChiTietSanPham.Text = pr.Detail;
        ltrXuatXu.Text = pr.Origin;
        ltrBaoHanh.Text = pr.Guarantee;

        List<Img> album = new List<Img>();
        int idimg = 0;
        string listimg = pr.Image;
        string[] str = listimg.Split('\'');
        foreach (var item in str)
        {
            if (item.ToString() != "")
            {
                Img dataimg = new Img();
                dataimg.ID = idimg;
                dataimg.Ten = pr.ProductName;
                dataimg.HinhAnh = item.ToString();
                album.Add(dataimg);
                idimg++;
            }
        }
        rptListImg.DataSource = album;
        rptListImg.DataBind();

        figureLarge.HRef = str.First().Trim().ToString();
        //figureLarge.Title = pr.ProductName;
        figureThumb.Src = ToThumb(str.First().Trim().ToString());
    }
    public string ToThumb(string input)
    {
        return Helper.ToThumb(input);
    }
    protected string showMoney(decimal input)
    {
        return createMoneyString(input.ToString("#"));
    }
    public String createMoneyString(String sInput)
    {
        string sFirst = "";
        string sLast = "";
        sInput = sInput.Trim();

        int lenght = sInput.Length;

        if (lenght > 3)
        {
            sFirst = sInput.Substring(0, lenght - 3).Trim();
            sLast = sInput.Substring(lenght - 3, 3).Trim();

            sFirst = createMoneyString(sFirst);

            sInput = sFirst + "." + sLast;
        }

        return sInput;

    }
}