using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace QuanLyChungCu
{
    public partial class QuanLyTaoTaiKhoan : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadDropQuyen();
            LoadDropIDHoGD();
            LoadGrid();
        }
        private void LoadDropQuyen()
        {
            string sql = "SELECT * FROM PhanQuyen where TenQuyen=N'Khách hàng'";
            DropQuyen.DataSource = ketnoi.ReadData(sql);
            DropQuyen.DataTextField = "TenQuyen";
            DropQuyen.DataValueField = "IDQuyen";
            DropQuyen.DataBind();
            // thêm một loại mới vào drl
            DropQuyen.Items.Insert(0, new ListItem("Tất cả", "0"));
        }
        private void LoadDropIDHoGD()
        {
            string sql = "SELECT * FROM HoGiaDinh WHERE TenChuHo IS NOT NULL AND TenChuHo <> ''";
            DropIDHoGD.DataSource = ketnoi.ReadData(sql);
            DropIDHoGD.DataTextField = "TenChuHo";
            DropIDHoGD.DataValueField = "IDHoGD";
            DropIDHoGD.DataBind();
            // thêm một loại mới vào drl
            DropIDHoGD.Items.Insert(0, new ListItem("Tất cả", "0"));
        }
        private void LoadGrid()
        {
            string sql = " select TaiKhoan.TenDangNhap,PhanQuyen.IDQuyen, PhanQuyen.TenQuyen, HoGiaDinh.IDHoGD, TenChuHo, TrangThai " +
                "from TaiKhoan, PhanQuyen, HoGiaDinh " +
                "where TaiKhoan.IDQuyen = PhanQuyen.IDQuyen and TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD and TaiKhoan.TenDangNhap <> 'admin'";
            GridTaiKhoan.DataSource = ketnoi.ReadData(sql);
            GridTaiKhoan.DataBind();

        }

        // Thêm
        protected void btn_Tao_Click(object sender, EventArgs e)
        {
            string TenDN = txt_tenDN.Text;
            string Pass = txt_Pass.Text;
            string idquyen = DropQuyen.SelectedValue;
            string trangthai = DropTrangThai.SelectedItem.Text;
            string idhogiadinh = DropIDHoGD.SelectedValue;
            string sqlCheck = " select * from TaiKhoan where TenDangNhap ='" + TenDN + "'";
            DataTable dt = ketnoi.ReadData(sqlCheck);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tài khoản đã tồn tại vui lòng đặt tên khác');", true);
            }
            else
            {
                string sql = "insert into TaiKhoan values ('" + TenDN + "','" + idquyen + "','" + idhogiadinh + "',N'" + trangthai + "','" + Pass + "')";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm tài khoản thành công');", true);
                    LoadGrid();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm tài khoản thất bại');", true);
                }
            }

        }
        // clear form nhập
        protected void btn_clear_Click(object sender, EventArgs e)
        {
            txt_tenDN.Text = "";
            txt_Pass.Text = "";
            DropQuyen.ClearSelection();
            DropIDHoGD.ClearSelection();
            DropTrangThai.ClearSelection();

        }
        // xóa
        protected void btn_Xoa_Click(object sender, EventArgs e)
        {
            string username = txt_tenDN.Text;
            string sqlCheck = "select * from TaiKhoan where TenDangNhap='" + username + "'";
            DataTable dt = ketnoi.ReadData(sqlCheck);
            if (dt.Rows.Count > 0)
            {
                if (username == "admin")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không thể xóa tài khoản Admin');", true);
                }
                else
                {
                    string sql = "delete from TaiKhoan where TenDangNhap='" + username + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa tài khoản này thành công');", true);
                        LoadGrid();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa tài khoản thất bại');", true);
                    }
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy UserName nào. Vui lòng kiểm tra lại!');", true);
            }
        }
        // sửa
        protected void btn_Sua_Click(object sender, EventArgs e)
        {
            string username = txt_tenDN.Text;
            string quyen = DropQuyen.SelectedValue;
            string trangthai = DropTrangThai.SelectedValue;
            string sqlCheck = "select * from TaiKhoan where TenDangNhap='" + username + "'";
            DataTable dt = ketnoi.ReadData(sqlCheck);
            if (dt.Rows.Count > 0)
            {
                if (username == "admin")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không thể cập nhật tài khoản Admin');", true);
                }
                else
                {
                    string sql = "update TaiKhoan set IDQuyen='" + quyen + "', TrangThai=N'" + trangthai + "' where TenDangNhap='" + username + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật tài khoản này thành công');", true);
                        LoadGrid();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật tài khoản thất bại');", true);
                    }
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy UserName nào. Vui lòng kiểm tra lại!');", true);
            }
        }

        protected void GridTaiKhoan_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lấy chỉ số dòng được chọn
            GridViewRow row = GridTaiKhoan.SelectedRow;
            txt_tenDN.Text = row.Cells[1].Text;
            //DropQuyen.SelectedValue = row.Cells[2].Text;
            string dropquyen = row.Cells[2].Text;
            ListItem itemquyen = DropTrangThai.Items.FindByText(dropquyen);
            if (itemquyen != null)
            {
                DropQuyen.ClearSelection();
                itemquyen.Selected = true;
            }
            else
            {
                // Nếu trạng thái không tìm thấy trong DropDownList
                DropQuyen.ClearSelection();
            }
            DropIDHoGD.SelectedValue = row.Cells[4].Text;
            //DropTrangThai.SelectedItem.Text = HttpUtility.HtmlDecode(row.Cells[6].Text);
            // Tìm và chọn trạng thái trong DropDownList
            string trangThai = row.Cells[6].Text.Trim();
            ListItem item = DropTrangThai.Items.FindByText(trangThai);
            if (item != null)
            {
                DropTrangThai.ClearSelection();
                item.Selected = true;
            }
            else
            {
                // Nếu trạng thái không tìm thấy trong DropDownList
                DropTrangThai.ClearSelection();
            }
        }
        // làm mới grid
        protected void btn_lammoi_Click(object sender, EventArgs e)
        {
            LoadGrid();
        }

        protected void btn_timkiem_Click(object sender, EventArgs e)
        {
            string timkiem = txt_timkiem.Text.Trim().ToUpper();
            if (string.IsNullOrEmpty(timkiem))
            {
                return;
            }
            else
            {
                string sqlCheck = " select * from TaiKhoan where IDHoGD ='" + timkiem + "'";
                DataTable dt = ketnoi.ReadData(sqlCheck);
                if (dt.Rows.Count > 0)
                {
                    string sql = "select TaiKhoan.TenDangNhap,PhanQuyen.IDQuyen, PhanQuyen.TenQuyen, HoGiaDinh.IDHoGD, TenChuHo, TrangThai from TaiKhoan, PhanQuyen, HoGiaDinh where TaiKhoan.IDQuyen = PhanQuyen.IDQuyen and TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD and HoGiaDinh.IDHoGD ='" + timkiem + "'";
                    GridTaiKhoan.DataSource = ketnoi.ReadData(sql);
                    GridTaiKhoan.DataBind();

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy ID Hộ Gia Đình này. Vui lòng kiểm tra lại!');", true);
                }
            }
        }
    }
}