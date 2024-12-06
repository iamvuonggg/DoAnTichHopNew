using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace QuanLyChungCu
{
    public partial class CCFormHoaDonDichVu : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            load();
        }
        private void load()
        {
            string username = Session["UserName"] + "";
            if (username != "")
            {

                string sql = " select HoaDonDichVu.IDHoaDon, DichVu.IDDichVu, DichVu.Gia, DichVu.TenDV, HoaDonDichVu.NgLapHD, HoaDonDichVu.TrangThai, HoaDonDichVu.SoThangSD, HoaDonDichVu.HinhAnh, HoGiaDinh.TenChuHo, (DichVu.Gia*HoaDonDichVu.SoThangSD) As TongTien " +
                    " from TaiKhoan, DichVu, HoGiaDinh, HoaDonDichVu " +
                    "where TaiKhoan.TenDangNhap = HoaDonDichVu.TenDangNhap AND DichVu.IDDichVu = HoaDonDichVu.IDDichVu AND TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD AND TaiKhoan.TenDangNhap = '" + username + "'";
                GridView1.DataSource = ketnoi.ReadData(sql);
                GridView1.DataBind();
                //Response.Write(sql);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }
        protected void btn_upload_Click(object sender, EventArgs e)
        {
            string idhoadon = ((Button)sender).CommandArgument;
            Button btnupload = (Button)sender;
            GridViewRow row = (GridViewRow)btnupload.Parent.Parent;
            FileUpload file = (FileUpload)row.FindControl("FileUpload1");
            if (file.HasFile)
            {
                string upload = Path.GetFileName(file.FileName);
                string location = Server.MapPath("~/images/") + upload;
                file.SaveAs(location);
                string trangthai = "Chờ xác nhận";
                string sql = " update HoaDonDichVu set HinhAnh='" + upload + "', TrangThai=N'" + trangthai + "' where IDHoaDon='" + idhoadon + "' ";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tải lên thành công.');", true);
                    load();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tải lên thất bại.');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn ảnh để tải lên.');", true);
            }

        }

        protected void btn_bill_Click(object sender, ImageClickEventArgs e)
        {
            string idhoadon = ((ImageButton)sender).CommandArgument;
            Response.Redirect("CCFormHoaDonBillDV.aspx?idhoadon=" + idhoadon);
        }
    }
}