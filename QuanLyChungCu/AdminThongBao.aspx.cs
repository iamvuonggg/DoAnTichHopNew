using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class AdminThongBao : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid();
        }

        private void loadgrid()
        {
            string sql = "select IDThongBao,TieuDe, NoiDung, NgThongBao, HoGiaDinh.TenChuHo from TaiKhoan, HoGiaDinh, ThongBao " +
                "where TaiKhoan.TenDangNhap = ThongBao.TenDangNhap and TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD ";
            GridView1.DataSource = ketnoi.ReadData(sql);
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            lb_idthongbao.Text = row.Cells[1].Text;
            lb_nguoitao.Text = row.Cells[2].Text;
            txt_tieude.Text = row.Cells[3].Text;
            txt_noidung.Text = row.Cells[4].Text;
            lb_ngaytaotb.Text = row.Cells[5].Text;
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            string username = Session["UserName"] + "";
            string ngaythang = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string tieude = txt_tieude.Text.Trim();
            string noidung = txt_noidung.Text.Trim();
            if (username != "")
            {
                if(string.IsNullOrEmpty(tieude) || string.IsNullOrEmpty(noidung))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cần nhập tiêu đề và nội dung');", true);
                }
                else
                {
                    string sql = "insert into ThongBao values('"+username+"',N'"+tieude+"',N'"+noidung+"','"+ngaythang+"')";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tạo thông báo thành công');", true);
                        loadgrid();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tạo thông báo thất bại');", true);
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để sử dụng dịch vụ.'); window.location='FormDangNhap.aspx';", true);
            }
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            string username = Session["UserName"] + "";
            string idthongbao = lb_idthongbao.Text;
            string ngaythang = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string tieude = txt_tieude.Text.Trim();
            string noidung = txt_noidung.Text.Trim();
            if (username != "")
            {
                if (string.IsNullOrEmpty(idthongbao))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn thông báo để cập nhật!');", true);
                    return;
                }
                string sqlcheck = "SELECT * FROM ThongBao WHERE IDThongBao = '" + idthongbao + "'";
                DataTable dt = ketnoi.ReadData(sqlcheck);
                if (dt.Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id thông báo không tồn tại');", true);
                    return;
                }
                if (string.IsNullOrEmpty(tieude) || string.IsNullOrEmpty(noidung))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cần nhập tiêu đề và nội dung');", true);
                    return;
                }
                else
                {

                    string sql = "update ThongBao set TenDangNhap='" + username + "', TieuDe=N'" + tieude + "', NoiDung=N'" + noidung + "',NgThongBao='" + ngaythang + "' where IDThongBao='" + idthongbao + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông báo thành công');", true);
                        loadgrid();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thông báo thất bại');", true);
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để sử dụng dịch vụ.'); window.location='FormDangNhap.aspx';", true);
            }
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            string username = Session["UserName"] + "";
            string idthongbao = lb_idthongbao.Text;
            if (username != "")
            {
                if (string.IsNullOrEmpty(idthongbao))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn thông báo cần xóa!');", true);
                    return;
                }
                string sqlcheck = "SELECT * FROM ThongBao WHERE IDThongBao = '" + idthongbao + "'";
                DataTable dt = ketnoi.ReadData(sqlcheck);
                if (dt.Rows.Count == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id thông báo không tồn tại');", true);
                    return;
                }
                else
                {

                    string sql = "delete from ThongBao where IDThongBao='" + idthongbao + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thông báo thành công');", true);
                        loadgrid();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thông báo thất bại');", true);
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để sử dụng dịch vụ.'); window.location='FormDangNhap.aspx';", true);
            }
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            lb_idthongbao.Text = string.Empty;
            lb_nguoitao.Text = string.Empty;
            lb_ngaytaotb.Text = string.Empty;
            txt_tieude.Text = string.Empty;
            txt_noidung.Text = string.Empty;
        }
    }
}