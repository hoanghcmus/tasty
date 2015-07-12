using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core;
using DataAccess.Classes;
using DataAccess.Language;
using Language;

public partial class En_MasterNoneSlide : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
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
                else if (Session["lang"].ToString().Equals("cn")) { return theloai.DuongDan_Cn; }
                return theloai.DuongDan_Vn;

            case "MenuTieuDe":
                if (Session["lang"].ToString().Equals("vn")) { return theloai.TieuDe_Vn; }
                else if (Session["lang"].ToString().Equals("en")) { return theloai.TieuDe_En; }
                else if (Session["lang"].ToString().Equals("cn")) { return theloai.TieuDe_Cn; }
                return theloai.DuongDan_Vn;

            default: return "";
        }
    }
}
