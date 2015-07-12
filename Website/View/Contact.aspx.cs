using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Connect;
using DataAccess.StringUtil;
using MultipleLanguage;

public partial class Vn_Contact : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BaiViet baiviet = BaiViet.LayTheoID("31");
            if (baiviet != null)
            {
                if (Session["lang"].ToString().Equals("vn"))
                {

                    ltBaiVietGioiThieu.Text = baiviet.ChiTiet_Vn;
                }

                else if (Session["lang"].ToString().Equals("cn"))
                {
                    ltBaiVietGioiThieu.Text = baiviet.ChiTiet_Cn;
                }

            }

            captchaImage.ImageUrl = new CaptchaProvider().CreateCaptcha();
            string IDTheLoai = Request.QueryString["catID"] ?? "0";
            if (Session["lang"].ToString().Equals("vn"))
                ltrCatName.Text = TheLoai.LayTheoID(IDTheLoai).TieuDe_Vn;
            else
                ltrCatName.Text = TheLoai.LayTheoID(IDTheLoai).TieuDe_Cn;
        }
    }
    protected void refesh()
    {
        txtDiaChi.Text = "";
        txtHoTen.Text = "";
        txtEmail.Text = "";
        txtTieuDe.Text = "";
        txtNoiDung.Text = "";
        txtInputString.Text = "";
    }
    protected void btnbtnGui_Click(object sender, EventArgs e)
    {
        // Neu tat ca du lieu deu duoc nhap hop le 
        if (Page.IsValid)
        {
            CaptchaProvider captchaPro = new CaptchaProvider();
            if (captchaPro.IsValidCode(txtInputString.Text))
            {
                lbcapcha.Visible = false;
                bool rs = false;
                LienHe data = new LienHe();
                data.HoTen = txtHoTen.Text;
                data.Email = txtEmail.Text;
                data.TieuDe = txtTieuDe.Text;
                data.NoiDung = txtNoiDung.Text;
                data.DiaChi = txtDiaChi.Text;
                data.NgayGui = DateTime.Now;
                data.TrangThai = 0;
                data.TheLoai = 1;
                rs = LienHe.Them(data);
                if (rs)
                {
                    succesfull.Visible = true;
                    refesh();
                    if (Session["lang"].ToString().Trim().Equals("vn"))
                    {
                        succesfull.Text = "Gửi thư hoàn tất!";
                    }
                    else
                    {
                        succesfull.Text = "郵 件 成 功!";
                    }
                }
                else
                {
                    succesfull.Visible = true;
                    if (Session["lang"].ToString().Trim().Equals("vn"))
                    {
                        succesfull.Text = "Gửi thư thất bại!";
                    }
                    else
                    {
                        succesfull.Text = "郵 寄 失 敗!";
                    }
                }
            }
            else
            {
                lbcapcha.Visible = true;
                succesfull.Visible = false;
                if (Session["lang"].ToString().Trim().Equals("vn"))
                {
                    lbcapcha.Text = "Mã xác nhận sai!";
                }
                else
                {
                    lbcapcha.Text = "驗 證 錯 誤!";
                }

            }
        }
    }
    protected void btnRedefine_Click(object sender, EventArgs e)
    {
        //Response.Redirect(this.Request.Url.AbsoluteUri);
        captchaImage.ImageUrl = new CaptchaProvider().CreateCaptcha();
    }

}