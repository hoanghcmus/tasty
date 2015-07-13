using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class En_En_Control_UC_CheckRate : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btCheckRate_Click(object sender, EventArgs e)
    {
        bool submit = true;
        DateTime dtNgayDen; DateTime dtNgayDi;
        if (txtCheckInDate.Text.Equals("")) { Response.Write("<script>alert('Vui lòng chọn ngày đến!');</script>"); return; }
        else
        {
            dtNgayDen = DateTime.ParseExact(txtCheckInDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        }

        if (txtCheckOutDate.Text.Equals("")) { Response.Write("<script>alert('Vui lòng chọn ngày đi!');</script>"); return; }
        else
        {
            dtNgayDi = DateTime.ParseExact(txtCheckOutDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        }

        int soNguoiLon = Convert.ToInt32(drlAdult.SelectedValue);
        int soTreem = Convert.ToInt32(drlChild.SelectedValue);

        if (soNguoiLon == 0)
        {
            submit = false;
            Response.Write("<script>alert('Vui lòng nhập số người lớn!');</script>");
        }
        //else if (soTreem == 0)
        //{
        //    submit = false;
        //    Response.Write("<script>alert('Vui lòng nhập số trẻ em!');</script>");
        //}
        else if (DateTime.Compare(dtNgayDen, dtNgayDi) >= 0)
        {
            submit = false;
            Response.Write("<script>alert('Ngày đến phải sớm hơn ngày đi!');</script>");
        }
        else if (DateTime.Compare(dtNgayDen, DateTime.Now) < 0)
        {
            if (!dtNgayDen.Date.Equals(DateTime.Now.Date))
            {
                submit = false;
                Response.Write("<script>alert('Ngày đến phải bắt đầu từ ngày hôm nay trở đi!');</script>");
            }
        }

        if (submit)
        {
            Response.Redirect("/check-rate-" + String.Format("{0:dd/MM/yyyy}", dtNgayDen) + "-" + String.Format("{0:dd/MM/yyyy}", dtNgayDi) + "-" + soNguoiLon + "-" + soTreem + ".html");
        }

    }

}