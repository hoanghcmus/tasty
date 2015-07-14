using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using System.Text;

public partial class UserControls_UC_MenuNgang : System.Web.UI.UserControl
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
        List<TheLoai> listTheLoai = TheLoai.TheLoai_GetByCategoryAndParentID("1", id);
        string activeMenuID = Request.QueryString["catID"] ?? "1";

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
                        sb.Append("<li class='has-sub active " + theLoai.TitleBorder + "' " + showItem("width", theLoai.TitleWidth) + ">");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "' > <span>" + theLoai.TieuDe_Vn + "</span></a>");
                    }
                    else
                    {
                        sb.Append("<li class='has-sub " + theLoai.TitleBorder + "'" + showItem("width", theLoai.TitleWidth) + ">");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "' > <span>" + theLoai.TieuDe_Vn + "</span></a>");
                    }

                }
                else
                {
                    if (theLoai.ID.ToString().Equals(activeMenuID))
                    {
                        sb.Append("<li class='active " + theLoai.TitleBorder + "'" + showItem("width", theLoai.TitleWidth) + ">");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "' > <span>" + theLoai.TieuDe_Vn + "</span></a>");
                    }
                    else
                    {
                        sb.Append("<li class= '" + theLoai.TitleBorder + "'" + showItem("width", theLoai.TitleWidth) + ">");
                        sb.Append("<a href='" + theLoai.DuongDan_Vn + "' > <span>" + theLoai.TieuDe_Vn + "</span></a>");
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

    protected string showItem(string attr, string input)
    {
        switch (attr)
        {
            case "width":

                string sWidth = input;
                Double dWidth = 0;
                if (sWidth != "")
                {
                    dWidth = Convert.ToDouble(sWidth);
                    dWidth = (dWidth * 100) / 1200;
                }
                if (dWidth != 0)
                    return "style='width:" + dWidth.ToString("#.000") + "%;'";
                else return "";

            default: return "";
        }
    }
}