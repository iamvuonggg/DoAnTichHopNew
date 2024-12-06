using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
namespace QuanLyChungCu
{
    public partial class QuanLyDichVu : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid();
        }
        private void loadgrid()
        {
            string sql = "select * from DichVu";
            GridView1.DataSource = ketnoi.ReadData(sql);
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtidDV.Text = row.Cells[1].Text;
            txtTenDV.Text = row.Cells[2].Text;
            txtgia.Text = row.Cells[4].Text;
            txtmota.Text = row.Cells[3].Text;
            // Lấy và gán URL hình ảnh
            string imageUrl = ((Image)row.FindControl("Image2")).ImageUrl;
            img.ImageUrl = imageUrl;
            string trangthai = row.Cells[5].Text.Trim();
            ListItem item = DropTrangThai.Items.FindByText(trangthai);
            if (item != null)
            {
                DropTrangThai.ClearSelection();
                item.Selected = true;
            }
            else
            {
                DropTrangThai.ClearSelection();
            }
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            // Xóa nội dung trong các TextBox
            txtidDV.Text = string.Empty;
            txtTenDV.Text = string.Empty;
            txtgia.Text = string.Empty;
            txtmota.Text = string.Empty;

            // Đặt lại giá trị mặc định cho DropDownList
            DropTrangThai.SelectedIndex = 0; // Chọn mục đầu tiên (Ngừng Hoạt Động)

            // Xóa ảnh hiển thị
            img.ImageUrl = string.Empty;

            // Đảm bảo trạng thái FileUpload không giữ file cũ
            FileUpload1.Attributes.Clear();
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            string idDV = txtidDV.Text.Trim();
            string tendv = txtTenDV.Text.Trim();
            string gia = txtgia.Text.Trim();
            string mota = txtmota.Text.Trim();
            string trangthai = DropTrangThai.SelectedItem.Text.Trim();
            // Xử lý file ảnh nếu có
            string hinhAnh = string.Empty;
            if (FileUpload1.HasFile)
            {
                // Lưu hình ảnh vào thư mục trên server
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Server.MapPath("~/images/") + fileName;
                if (File.Exists(filePath))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ảnh đã tồn tại!');", true);
                    return;
                }
                FileUpload1.SaveAs(filePath);
                hinhAnh = fileName; // Lưu tên tệp hình ảnh
            }
            string sqlcheck = "select * from DichVu where IDDichVu='" + idDV + "'";
            DataTable dt = ketnoi.ReadData(sqlcheck);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id Dịch vụ đã tồn tại');", true);
            }
            else
            {
                string sql = "INSERT INTO DichVu (IDDichVu,  TenDV, MoTa, Gia, HinhAnh, TrangThai) " +
                "VALUES ('" + idDV + "', N'" + tendv + "', N'" + mota + "', '" + gia + "', '" + hinhAnh + "', N'" + trangthai + "' )";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thành công');", true);
                    loadgrid();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thất bại');", true);
                }
            }
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            string idDV = txtidDV.Text.Trim();
            string tendv = txtTenDV.Text.Trim();
            string gia = txtgia.Text.Trim();
            string mota = txtmota.Text.Trim();
            string trangthai = DropTrangThai.SelectedItem.Text.Trim();
            string hinhAnh = string.Empty;

            // Kiểm tra nếu ID tồn tại
            string sqlcheck = "SELECT * FROM DichVu WHERE IDDichVu = '" + idDV + "'";
            DataTable dt = ketnoi.ReadData(sqlcheck);
            if (dt.Rows.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id Dịch vụ không tồn tại');", true);
                return;
            }

            // Nếu có file ảnh mới cập nhật ảnh
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Server.MapPath("~/images/") + fileName;

                if (File.Exists(filePath))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ảnh đã tồn tại!');", true);
                    return;
                }

                FileUpload1.SaveAs(filePath);
                hinhAnh = fileName;
            }
            else
            {

                hinhAnh = dt.Rows[0]["HinhAnh"].ToString();
            }
            string sql = "UPDATE DichVu SET " +
                         "TenDV = N'" + tendv + "', " +
                         "MoTa = N'" + mota + "', " +
                         "Gia = '" + gia + "', " +
                         "HinhAnh = '" + hinhAnh + "', " +
                         "TrangThai = N'" + trangthai + "' " +
                         "WHERE IDDichVu = '" + idDV + "'";

            int ketqua = ketnoi.ExecNonQuery(sql);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thành công');", true);
                loadgrid();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
            }
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            string idDV = txtidDV.Text.Trim();

            // Kiểm tra nếu ID tồn tại
            string sqlcheck = "SELECT * FROM DichVu WHERE IDDichVu = '" + idDV + "'";
            DataTable dt = ketnoi.ReadData(sqlcheck);
            if (dt.Rows.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id Dịch vụ không tồn tại');", true);
                return;
            }

            // Xóa file ảnh trên server
            string hinhAnh = dt.Rows[0]["HinhAnh"].ToString();
            string filePath = Server.MapPath("~/images/") + hinhAnh;
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
            string sql = "DELETE FROM DichVu WHERE IDDichVu = '" + idDV + "'";
            int ketqua = ketnoi.ExecNonQuery(sql);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thành công');", true);
                loadgrid();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thất bại');", true);
            }
        }
    }
}