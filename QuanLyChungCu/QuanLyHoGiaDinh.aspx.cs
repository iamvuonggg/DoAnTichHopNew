using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace QuanLyChungCu
{
    public partial class QuanLyHoGiaDinh : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadGrid();
            loaddrop();
        }
        private void LoadGrid()
        {
            string sql = " select * from HoGiaDinh";
            GridTaiKhoan.DataSource = ketnoi.ReadData(sql);
            GridTaiKhoan.DataBind();

        }
        private void loaddrop()
        {
            string sql = "SELECT * FROM HoGiaDinh";
            DropIDHo.DataSource = ketnoi.ReadData(sql);
            DropIDHo.DataValueField = "IDHoGD";
            DropIDHo.DataBind();
            // thêm một loại mới vào drl
            DropIDHo.Items.Insert(0, new ListItem("Tất cả", "0"));
        }
        // Add thành viên của gia đình
        protected void btn_Tao_Click(object sender, EventArgs e)
        {
            string idho = DropIDHo.SelectedValue;
            Response.Redirect("QuanLyThanhVienHGD.aspx?idho=" + idho);

        }
        // clear form nhập
        protected void btn_clear_Click(object sender, EventArgs e)
        {

            txt_tenchu.Text = "";
            txt_ngaysinh.Text = "";
            txt_diachi.Text = "";
            txt_email.Text = "";
            txt_sdt.Text = "";
            txt_Cancuoc.Text = "";
            DropIDHo.SelectedIndex = 0;

        }
        // xóa
        protected void btn_Xoa_Click(object sender, EventArgs e)
        {
            string idho = DropIDHo.SelectedValue;

            // Kiểm tra xem ID hộ gia đình có tồn tại hay không
            string sqlCheck = "select * from HoGiaDinh where IDHoGD='" + idho + "'";
            DataTable dt = ketnoi.ReadData(sqlCheck);

            if (dt.Rows.Count > 0)
            {
                // Kiểm tra nếu ID là "ADM01" thì không thể xóa
                if (idho == "ADM01")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không thể xóa tài khoản Admin');", true);
                }
                else
                {
                    // Cập nhật các trường thông tin thành NULL hoặc giá trị mặc định
                    string sqlUpdate = "update HoGiaDinh set TenChuHo=NULL, NgaySinh=NULL, DiaChi=NULL, Email=NULL, SDT=NULL, CCCD=NULL where IDHoGD='" + idho + "'";

                    int ketqua = ketnoi.ExecNonQuery(sqlUpdate);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thông tin hộ gia đình thành công');", true);
                        LoadGrid();  // Tải lại dữ liệu vào Grid
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thông tin thất bại');", true);
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy ID Hộ nào. Vui lòng kiểm tra lại!');", true);
            }
        }
        // sửa
        protected void btn_Sua_Click(object sender, EventArgs e)
        {
            string idho = DropIDHo.SelectedValue;
            string ten = txt_tenchu.Text;
            string ngaysinh = txt_ngaysinh.Text;
            string diachi = txt_diachi.Text;
            string email = txt_email.Text;
            string sdt = txt_sdt.Text;
            string cccd = txt_Cancuoc.Text;
            string sqlCheck = "select * from HoGiaDinh where IDHoGD='" + idho + "'";
            DataTable dt = ketnoi.ReadData(sqlCheck);
            if (dt.Rows.Count > 0)
            {
                if (idho == "ADM01")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không thể cập nhật tài khoản Admin');", true);
                }
                else
                {
                    // Chuyển đổi giá trị ngaysinh thành DateTime
                    DateTime parsedDate;
                    string Fngaysinh = string.Empty;
                    if (DateTime.TryParse(ngaysinh, out parsedDate))
                    {
                        Fngaysinh = parsedDate.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ngày sinh không hợp lệ');", true);
                        return;
                    }
                    string sql = "update HoGiaDinh set TenChuHo=N'" + ten + "', NgaySinh='" + Fngaysinh + "', DiaChi=N'" + diachi + "', Email='" + email + "', SDT='" + sdt + "',CCCD='" + cccd + "'  where IDHoGD='" + idho + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thông tin hộ gia đình này thành công');", true);
                        LoadGrid();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thất bại');", true);
                    }
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy ID Hộ nào. Vui lòng kiểm tra lại!');", true);
            }
        }

        protected void GridTaiKhoan_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lấy dữ liệu từ dòng được chọn
            GridViewRow row = GridTaiKhoan.SelectedRow;

            // Gán dữ liệu vào các ô nhập liệu
            DropIDHo.SelectedValue = row.Cells[1].Text; // ID Hộ
            txt_tenchu.Text = row.Cells[2].Text == "&nbsp;" ? "" : row.Cells[2].Text;
            txt_ngaysinh.Text = row.Cells[3].Text == "&nbsp;" ? "" : row.Cells[3].Text;
            txt_diachi.Text = row.Cells[4].Text == "&nbsp;" ? "" : row.Cells[4].Text;
            txt_email.Text = row.Cells[5].Text == "&nbsp;" ? "" : row.Cells[5].Text;
            txt_sdt.Text = row.Cells[6].Text == "&nbsp;" ? "" : row.Cells[6].Text;
            txt_Cancuoc.Text = row.Cells[7].Text == "&nbsp;" ? "" : row.Cells[7].Text;
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
                string sqlCheck = " select * from HoGiaDinh where IDHoGD ='" + timkiem + "'";
                DataTable dt = ketnoi.ReadData(sqlCheck);
                if (dt.Rows.Count > 0)
                {
                    string sql = "select * from HoGiaDinh where IDHoGD ='" + timkiem + "'";
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