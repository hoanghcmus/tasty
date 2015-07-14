using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class Admin_Admin : System.Web.UI.Page
{
    private int KiemTraSession()
    {
        int kq = 0;
        string chuoiQuyen = Session["QuyenHan"].ToString();
        string[] str = chuoiQuyen.Split(',');
        foreach (var item in str)
        {
            if (item.ToString() == "1" || item.ToString() == "3")
                kq = 1;
        }
        return kq;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            PopulateControls();
        }

    }
    private void PopulateControls()
    {

        lblienHe.Text = LienHe.Dem().ToString();
        lbbaiViet.Text = BaiViet.DemTheoModule("1").ToString();
        lbdh.Text = Shopping.DemTheoTrangThai("0").ToString();
        lbsp.Text = DataAccess.Classes.Product.Count().ToString();
    }
}