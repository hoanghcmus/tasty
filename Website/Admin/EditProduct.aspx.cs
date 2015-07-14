using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Help;
using DataAccess.Classes;
using System.Text.RegularExpressions;
using DataAccess.StringUtil;

public partial class Admin_EditProduct : System.Web.UI.Page
{
    #region Load du lieu len web
    public static List<Img> album;
    private int KiemTraSession()
    {
        int kq = 0;
        string chuoiQuyen = Session["QuyenHan"].ToString();
        string[] str = chuoiQuyen.Split(',');
        foreach (var item in str)
        {
            if (item.ToString() == "1" || item.ToString() == "4" || item.ToString() == "5")
                kq = 1;
        }
        return kq;
    }
    protected void LoadEditor()
    {
        //Load CKFinder vao CKEditor
        txtChiTietVn.Language = "vi";

        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder";
        _FileBrowser.SetupCKEditor(txtChiTietVn);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (KiemTraSession() == 1)
        {
            LoadEditor();
            if (!IsPostBack)
            {
                album = new List<Img>();
                //Load du lieu form
                LoadLoaiMenu();
                PopulateControls();
            }
        }
        else
            Response.Redirect("~/Admin/Admin.aspx");
    }
    private void LoadLoaiMenu()
    {
        ddlLoaiMenu.DataValueField = "ID";
        ddlLoaiMenu.DataTextField = "TieuDe_Vn";

        List<TheLoai> listTL = TheLoai.LayTheoModule("3");
        if (listTL != null && listTL.Count > 0)
        {
            foreach (TheLoai tl in listTL)
            {
                tl.TieuDe_Vn = UCFirst(ShowTitle(tl.TieuDe_Vn).Trim().ToLower());
            }
        }

        ddlLoaiMenu.DataSource = listTL;
        ddlLoaiMenu.DataBind();
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

    private void PopulateControls()
    {
        try
        {
            string id = Request.QueryString["ID"] ?? "";
            //new co QueryString cid=> cap nhat Article
            if (id != "")
            {
                //lay Khao sat theo gia tri id
                DataAccess.Classes.Product data = DataAccess.Classes.Product.Single(id);
                if (data == null)
                    Response.Redirect("~/Admin/MgerProduct.aspx");
                //Dat ten trang web
                lbTitle01.Text = "Cập nhật sản phẩm ";
                lbTitle02.Text = "Cập nhật sản phẩm '" + id + "'";
                SetData(data);
            }
            else
            {
                lbTitle01.Text = "Thêm mới sản phẩm";
                lbTitle02.Text = "Thêm mới sản phẩm";
            }
        }
        catch (Exception)
        {
        }
    }
    #endregion

    #region Luu San Pham
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        btnLuu.Click += new EventHandler(btnLuu_Click);
        btnaddimg.Click += new EventHandler(btnaddimg_Click);
        dlListImg.ItemCommand += new DataListCommandEventHandler(dlListImg_ItemCommand);
    }
    void dlListImg_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Deleteimg")
        {
            string s = e.CommandArgument.ToString();
            foreach (var item in album)
            {
                if (item.ID.ToString().CompareTo(s) == 0)
                {
                    album.Remove(item);
                    break;
                }
            }
            dlListImg.DataSource = album;
            dlListImg.DataBind();
        }
    }
    void btnaddimg_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        if (txtHinhAnh.Text != "")
        {
            int stt;
            if (album == null)
            {
                stt = 0;
                album = new List<Img>();
            }
            else
                stt = album.Count;
            Img dataimg = new Img();
            dataimg.ID = stt;
            dataimg.HinhAnh = txtHinhAnh.Text.Trim();
            album.Add(dataimg);
            dlListImg.DataSource = album;
            dlListImg.DataBind();
            txtHinhAnh.Text = "";
        }
        else
            lbhinhanh.Visible = true;
    }
    public int KiemTraDieuKien()
    {
        int kq = 0;
        lbNhapMoTa.Visible = false;
        if (Page.IsValid)
            kq = 1;
        else
            kq = 0;
        return kq;
    }
    private void ResetForm()
    {
        txtMaSanPham.Text = "";
        txtTieuDe_Vi.Text = "";
        txtTomTatVn.Text = "";
        txtChiTietVn.Text = "";
        txtHinhNho.Text = "";
        txtDonGia.Text = "";
        txtGiamGia.Text = "";
        txtXuatXu.Text = "";
        txtBaoHanh.Text = "";
        dlListImg.DataSource = album;
        dlListImg.DataBind();
    }
    protected string showMoney(decimal input)
    {
        return StringUltility.createMoneyString(input.ToString("#"));
    }
    private void SetData(DataAccess.Classes.Product data)
    {
        lblId.Text = data.ID.ToString();
        ddlLoaiMenu.SelectedValue = data.ProductCategoryID.ToString();
        txtMaSanPham.Text = data.ProductCode;
        txtTieuDe_Vi.Text = data.ProductName;
        txtTomTatVn.Text = data.Description;
        txtChiTietVn.Text = data.Detail;
        txtHinhNho.Text = data.Thumbnail;
        txtDonGia.Text = showMoney(data.OldPrice).ToString();

        txtGiamGia.Text = data.Discount.ToString();
        txtXuatXu.Text = data.Origin;
        txtBaoHanh.Text = data.Guarantee;

        if (data.IsNew == 1)
            ckbSanPhamMoi.Checked = true;
        else
            ckbSanPhamMoi.Checked = false;

        int idimg = 0;
        string listimg = data.Image;
        string[] str = listimg.Split('\'');
        foreach (var item in str)
        {
            if (item.ToString() != "")
            {
                Img dataimg = new Img();
                dataimg.ID = idimg;
                dataimg.HinhAnh = item.ToString();
                album.Add(dataimg);
                idimg++;
            }
        }
        dlListImg.DataSource = album;
        dlListImg.DataBind();
    }
    private DataAccess.Classes.Product GetData()
    {
        DataAccess.Classes.Product data = null;
        if (lblId.Text != "")
            data = DataAccess.Classes.Product.Single(lblId.Text);
        else
            data = new DataAccess.Classes.Product();
        data.ProductCategoryID = Convert.ToInt32(ddlLoaiMenu.SelectedValue.Trim());
        data.ProductCode = txtMaSanPham.Text.Trim();
        data.ProductName = txtTieuDe_Vi.Text.Trim();
        data.Description = txtTomTatVn.Text.Trim();
        data.Detail = txtChiTietVn.Text.Trim();

        decimal oldPrice = Convert.ToDecimal(txtDonGia.Text.Trim());
        data.OldPrice = oldPrice;
        int discount = Convert.ToInt32(txtGiamGia.Text.Trim());
        data.Discount = discount;
        if (data.Discount != null && data.Discount > 0)
        {
            decimal disPercent = (decimal)discount / 100;
            decimal disPrice = oldPrice * disPercent;
            data.NewPrice = oldPrice - disPrice;
        }
        else
        {
            data.NewPrice = data.OldPrice;
        }

        data.Thumbnail = txtHinhNho.Text;
        string datalistimg = "";
        foreach (var item in album)
            datalistimg += item.HinhAnh + "'";
        data.Image = datalistimg;

        data.Origin = txtXuatXu.Text.Trim();
        data.Guarantee = txtBaoHanh.Text.Trim();
        if (ckbSanPhamMoi.Checked)
            data.IsNew = 1;
        else
            data.IsNew = 0;

        return data;
    }
    void btnLuu_Click(object sender, EventArgs e)
    {
        //neu tat ca du lieu duoc nhap la hop le
        if (KiemTraDieuKien() == 1)
        {
            bool rs = false;
            //lay du lieu tu form
            DataAccess.Classes.Product data = GetData();
            //ID>0 ==> cap nhat va hien thong bao
            if (data.ID > 0)
            {
                rs = DataAccess.Classes.Product.Update(data);
                Label1.Text = rs ? "Cập nhật sản phẩm thành công!" : "Cập nhật sản phẩm thất bại!";
                if (rs)
                {
                    album = new List<Img>();
                    //lay du lieu moi nhat Db
                    data = DataAccess.Classes.Product.Single(lblId.Text);
                    SetData(data);
                    //Cap nhat hanh dong dang nhap
                    CapNhatHanhDong("Cập nhật sản phẩm (id: " + lblId.Text + ")");
                }
            }
            else
            {
                bool rst = DataAccess.Classes.Product.Add(data);
                if (rst)
                {
                    album = new List<Img>();
                    //Cap nhat hanh dong dang nhap
                    CapNhatHanhDong("Thêm sản phẩm (id: " + rst + ")");
                    //Thong bao them thanh cong
                    Label1.Text = "Thêm sản phẩm thành công!";
                    ResetForm();
                }
                else
                {
                    Label1.Text = "Thêm sản phẩm thất bại!";
                }
            }
        }
    }
    protected void valTieuDeVn_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 150)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    protected void valTieuDeEn_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 150)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    protected void valTieuDeRu_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 150)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    protected void valTomTatVn_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 300)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    protected void valTomTatEn_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 300)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    protected void valTomTatRu_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 300)
            args.IsValid = false;
        else
            args.IsValid = true;
    }
    #endregion

    #region Cap nhat hanh dong
    private void CapNhatHanhDong(string hanhDong)
    {
        if (Session["IDNguoiDung"] != "" || Session["IDDangNhap"] != "")
        {
            string maDangNhap = Session["IDDangNhap"].ToString();
            string maNguoiDung = Session["IDNguoiDung"].ToString();
            string hanhDongDangNhap = Session["HanhDongDangNhap"].ToString();
            hanhDongDangNhap += "<br /> - " + hanhDong + " (giờ: " + DateTime.Now.ToShortTimeString() + ")";
            Session["HanhDongDangNhap"] = hanhDongDangNhap;
            DangNhap.SuaHanhDong(maDangNhap, maNguoiDung, hanhDongDangNhap);
        }
    }
    #endregion
}