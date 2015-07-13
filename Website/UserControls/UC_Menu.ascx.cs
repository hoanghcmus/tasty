using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using System.Text;

public partial class Vn_Vn_Control_Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string LoadMenu()
    {
        return BuildMenu(0).ToString();
    }

    protected StringBuilder BuildMenu(int id)
    {
        List<TheLoai> listTheLoai = TheLoai.TheLoai_GetByCategoryAndParentID("2", id);
        string activeMenuID = Request.QueryString["catID"] ?? "";


        StringBuilder sb = new StringBuilder();

        if (listTheLoai.Count() != 0)
        {
            sb.Append("<ul>");
            foreach (TheLoai theLoai in listTheLoai)
            {
                if (hasRow(theLoai.ID))
                {
                    if (theLoai.ID.ToString().Equals(activeMenuID))
                    {
                        sb.Append("<li class='has-sub vactive'>");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "'> <span class='rarow'></span> <span>" + theLoai.TieuDe_Vn + "</span></a>");

                    }
                    else
                    {
                        sb.Append("<li class='has-sub'>");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "'> <span class='rarow'></span> <span>" + theLoai.TieuDe_Vn + "</span></a>");

                    }

                }
                else
                {
                    if (theLoai.ID.ToString().Equals(activeMenuID))
                    {
                        sb.Append("<li class='vactive'>");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "'> <span class='rarow'></span> <span>" + theLoai.TieuDe_Vn + "</span></a>");
                    }
                    else
                    {
                        sb.Append("<li>");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "'> <span class='rarow'></span> <span>" + theLoai.TieuDe_Vn + "</span></a>");
                    }
                }

                sb.Append(BuildMenu(theLoai.ID));

                sb.Append("</li>");
            }
            sb.Append("</ul>");
        }

        return sb;
    }

    private bool hasRow(int menuItemID)
    {

        bool value = false;
        List<TheLoai> theLoais = TheLoai.COUNT_ON_THELOAI(menuItemID);
        if (theLoais.Count() != 0)
        {
            value = true;
        }

        return value;
    }

}