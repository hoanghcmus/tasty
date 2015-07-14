using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Help;

public partial class View_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    public string ShowTitle(string title)
    {
        return DecodeHTML(HttpUtility.HtmlDecode(title));
    }

    public string DecodeHTML(string chuoi)
    {
        Regex regex = new Regex("\\<[^\\>]*\\>");
        chuoi = regex.Replace(chuoi, String.Empty);
        return chuoi;
    }

    protected string UCFirst(string s)
    {
        if (string.IsNullOrEmpty(s))
        {
            return string.Empty;
        }
        return char.ToUpper(s[0]) + s.Substring(1);
    }


}
