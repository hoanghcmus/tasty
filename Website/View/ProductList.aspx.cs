using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string catID = Request["catID"] ?? "1";
            List<DataAccess.Classes.Product> listPR = DataAccess.Classes.Product.LayTheoIDTheLoai(catID);
            if (listPR != null && listPR.Count > 0)
            {
                rptProductList.DataSource = listPR;
                rptProductList.DataBind();
            }
        }
    }
}