using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_UC_Quang_Cao : System.Web.UI.UserControl
{
    public string AdWidth { get; set; }
    public string IDTheLoai { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AdWidth == null || AdWidth.Equals(string.Empty))
            AdWidth = "50";
        if (!IsPostBack)
        {
            DataAccess.Classes.TheLoai tl = DataAccess.Classes.TheLoai.LayTheoID(IDTheLoai);
            if (tl != null)
            {
                adlink.HRef = tl.DuongDan_Vn;
                figure.Src = tl.HinhAnh;
                figure.Alt = tl.TieuDe_Vn;
            }
        }
    }
}