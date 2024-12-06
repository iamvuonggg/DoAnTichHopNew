using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class CCFormTTCaNhan : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddatalist();
            loadgrid();
        }
        private void loaddatalist()
        {
            string username = Session["UserName"] + "";
            if (username != "")
            {
                string sql = "select TaiKhoan.TenDangNhap, HoGiaDinh.IDHoGD, TenChuHo, NgaySinh, DiaChi, Email, SDT, CCCD from TaiKhoan, HoGiaDinh where HoGiaDinh.IDHoGD = TaiKhoan.IDHoGD and TenDangNhap='" + username + "'";
                DataList1.DataSource = ketnoi.ReadData(sql);
                DataList1.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }
        private void loadgrid()
        {
            string username = Session["UserName"] + "";
            if (username != "")
            {
                string sql = "select TaiKhoan.TenDangNhap,IDThanhVien, HoGiaDinh.IDHoGD, HoTen, NgSinh, MoiQuanHe from TaiKhoan, HoGiaDinh, ThanhVienHGD  where HoGiaDinh.IDHoGD = TaiKhoan.IDHoGD and HoGiaDinh.IDHoGD = ThanhVienHGD.IDHoGD and TenDangNhap='" + username + "'";
                GridView1.DataSource = ketnoi.ReadData(sql);
                GridView1.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }

        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            string username = Session["UserName"] + "";
            string idho = ((Button)sender).CommandArgument;
            Button btnsua = ((Button)sender);
            DataListItem item = (DataListItem)btnsua.Parent;
            string diachi = ((TextBox)item.FindControl("txt_diachi")).Text;
            string sodt = ((TextBox)item.FindControl("txt_sdt")).Text;
            string email = ((TextBox)item.FindControl("txt_email")).Text;
            string cccd = ((TextBox)item.FindControl("txtcancuoc")).Text;

            if (username != "")
            {
                if (diachi != "" && sodt != "" && email != "" && cccd !="" )
                {
                    string sql = "update HoGiaDinh set DiaChi=N'" + diachi + "', SDT='" + sodt + "', Email='" + email + "', CCCD='" + cccd + "' where IDHoGD='" + idho + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông tin thành công')", true);
                        loaddatalist();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông tin không thành công')", true);
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn không được để trống các thông tin cá nhân của bạn')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }

        protected void doimatkhau_Click(object sender, EventArgs e)
        {
            Response.Redirect("CCFormDoiPassWord.aspx");
        }

        protected void phanhoi_Click(object sender, EventArgs e)
        {
            Response.Redirect("CCFormPhanHoi.aspx");
        }

        protected void thongbao_Click(object sender, EventArgs e)
        {
            Response.Redirect("CCFormThongBao.aspx");
        }

        protected void hddichvu_Click(object sender, EventArgs e)
        {
            Response.Redirect("CCFormHoaDonDichVu.aspx");
        }

        protected void hddiennuoc_Click(object sender, EventArgs e)
        {
            Response.Redirect("CCFormHoaDonDienNuoc.aspx");
        }
    }
}