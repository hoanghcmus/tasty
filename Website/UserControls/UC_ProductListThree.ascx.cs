using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class UserControls_UC_ProductListThree : System.Web.UI.UserControl
{
    public string IDTheLoai { get; set; }
    public string ID { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<DataAccess.Classes.Product> listPR = DataAccess.Classes.Product.LayTheoIDTheLoaiExceptID(IDTheLoai, ID);
            rptProductList.DataSource = listPR;
            rptProductList.DataBind();
        }
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
    protected void rptProductList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var pr = (DataAccess.Classes.Product)e.Item.DataItem;
        var ltrIsNew = (Literal)e.Item.FindControl("ltrIsNew");
        if (pr.IsNew == 1)
            ltrIsNew.Text = "<div class='new-item'></div>";

        TheLoai tl = TheLoai.LayTheoID(pr.ProductCategoryID.ToString());
        lbCategoryTitle.Text = "Sản phẩm liên quan";
        lbtViewAll.Visible = false;

    }
}