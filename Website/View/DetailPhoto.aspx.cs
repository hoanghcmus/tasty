using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class View_DetailPhoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateControls();
        }
    }

    private void PopulateControls()
    {
        string id = Request.QueryString["ID"];
        ImageAndClips data = ImageAndClips.LayTheoID(id);
        if (data != null)
        {
            List<Img> listimgs = new List<Img>();
            string listimg = data.ImgOrClip;
            string[] str = listimg.Split('\'');
            foreach (var item in str)
            {
                if (item.ToString() != "")
                {
                    Img dataimg = new Img();
                    dataimg.HinhAnh = item.ToString();
                    listimgs.Add(dataimg);
                }
            }
            dlListimages.DataSource = listimgs;
            dlListimages.DataBind();
        }
    }

}