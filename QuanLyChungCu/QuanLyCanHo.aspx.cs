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
    public partial class QuanLyCanHo : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            load();
            loadDrop();
        }
        private void load()
        {
            string sql = "select CanHo.IDCanHo, CanHo.IDHoGD, HoGiaDinh.TenChuHo, CanHo.Gia, CanHo.TrangThai, CanHo.SLPhong, CanHo.MoTa, CanHo.HinhAnh, CanHo.SoTang, CanHo.SoCanHo " +
             "from CanHo " +
             "LEFT JOIN HoGiaDinh ON CanHo.IDHoGD = HoGiaDinh.IDHoGD";
            GridCanHo.DataSource = ketnoi.ReadData(sql);
            GridCanHo.DataBind();
        }
        private void loadDrop()
        {
            string sql = "SELECT * FROM HoGiaDinh WHERE TenChuHo IS NOT NULL AND TenChuHo <> ''";
            DropChuHo.DataSource = ketnoi.ReadData(sql);
            DropChuHo.DataTextField = "TenChuHo";
            DropChuHo.DataValueField = "IDHoGD";
            DropChuHo.DataBind();
            // thêm một loại mới vào drl
            DropChuHo.Items.Insert(0, new ListItem("Tất cả", "0"));
        }
        protected void GridCanHo_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridCanHo.SelectedRow;

            txt_idcanho.Text = row.Cells[1].Text;
            txt_socanho.Text = row.Cells[3].Text;
            //DropChuHo.SelectedValue = row.Cells[2].Text;
            txt_gia.Text = row.Cells[5].Text;
            txt_slphong.Text = row.Cells[7].Text;
            txt_Mota.Text = row.Cells[8].Text;
            txt_trangthai.Text = row.Cells[9].Text;
            //string tenHinh = row.Cells[10].Text;
            //img.ImageUrl = "~/images/" + tenHinh;
            //string image = "images/" + ((Image)row.FindControl("Image1")).ImageUrl;
            //img.ImageUrl = image;
            // Lấy và gán URL hình ảnh
            string imageUrl = ((Image)row.FindControl("Image1")).ImageUrl;
            img.ImageUrl = imageUrl;
            string idHoGD = row.Cells[2].Text.Trim();
            ListItem chuHoItem = DropChuHo.Items.FindByValue(idHoGD);
            if (chuHoItem != null)
            {
                DropChuHo.ClearSelection();
                DropChuHo.SelectedValue = idHoGD;
            }
            else
            {
                // Nếu không tìm thấy chọn giá trị mặc định
                DropChuHo.SelectedIndex = 0;
            }
            string tang = row.Cells[6].Text.Trim();
            ListItem tangitem = DropTang.Items.FindByText(tang);
            if (tangitem != null)
            {
                DropTang.ClearSelection();
                tangitem.Selected = true;
            }
            else
            {
                DropTang.ClearSelection();
            }
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            // Lấy giá trị từ các điều khiển trong form
            string idCanHo = txt_idcanho.Text.Trim(); // ID Căn Hộ
            string soCanHo = txt_socanho.Text.Trim(); // Số Căn Hộ

            string giaCanHo = txt_gia.Text.Trim(); // Giá Căn Hộ
            string tang = DropTang.SelectedItem.Text; // Tầng
            string soLuongPhong = txt_slphong.Text.Trim(); // Số Lượng Phòng
            string moTa = txt_Mota.Text.Trim(); // Mô Tả
            string trangThai = txt_trangthai.Text.Trim(); // Trạng Thái

            // Xử lý file ảnh nếu có
            string hinhAnh = string.Empty;
            if (FileUpload1.HasFile)
            {
                // Lưu hình ảnh vào thư mục trên server
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Server.MapPath("~/images/") + fileName;
                FileUpload1.SaveAs(filePath);
                hinhAnh = fileName; // Lưu tên tệp hình ảnh
            }
            //
            if (string.IsNullOrEmpty(idCanHo))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Chưa nhập ID căn hộ');", true);
            }
            else
            {
                string sqlcheck = "select * from CanHo where IDCanHo='" + idCanHo + "'";
                DataTable dt = ketnoi.ReadData(sqlcheck);
                if (dt.Rows.Count > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id Căn hộ đã tồn tại');", true);
                }
                else
                {
                    string sql = "INSERT INTO CanHo (IDCanHo,  Gia, TrangThai, SLPhong, MoTa, HinhAnh, SoTang, SoCanHo) " +
                    "VALUES ('" + idCanHo + "', N'" + giaCanHo + "', N'" + trangThai + "', N'" + soLuongPhong + "', N'" + moTa + "', '" + hinhAnh + "', N'" + tang + "', '" + soCanHo + "')";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thành công');", true);
                        load();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thất bại');", true);
                    }
                }
            }
        }

        protected void btn_capnhat_Click(object sender, EventArgs e)
        {
            // Lấy giá trị từ các điều khiển trong form
            string idCanHo = txt_idcanho.Text.Trim(); // ID Căn Hộ
            string soCanHo = txt_socanho.Text.Trim(); // Số Căn Hộ
            string giaCanHo = txt_gia.Text.Trim(); // Giá Căn Hộ
            string tang = DropTang.SelectedItem.Text; // Tầng
            string soLuongPhong = txt_slphong.Text.Trim(); // Số Lượng Phòng
            string moTa = txt_Mota.Text.Trim(); // Mô Tả
            string trangThai = txt_trangthai.Text.Trim(); // Trạng Thái

            // Xử lý file ảnh nếu có
            string hinhAnh = string.Empty;

            if (FileUpload1.HasFile) // Nếu có file ảnh mới
            {
                // Lưu hình ảnh vào thư mục trên server
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Server.MapPath("~/images/") + fileName;
                FileUpload1.SaveAs(filePath);
                hinhAnh = fileName; // Lưu tên tệp hình ảnh mới
            }
            else
            {
                string sqlGetHinhAnh = "SELECT HinhAnh FROM CanHo WHERE IDCanHo = '" + idCanHo + "'";
                DataTable dtHinhAnh = ketnoi.ReadData(sqlGetHinhAnh);
                if (dtHinhAnh.Rows.Count > 0)
                {
                    hinhAnh = dtHinhAnh.Rows[0]["HinhAnh"].ToString(); // Lấy tên ảnh cũ
                }
            }
            if (string.IsNullOrEmpty(idCanHo))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn Căn Hộ để cập nhật!');", true);
                return;
            }
            // Cập nhật thông tin căn hộ
            string sqlUpdate = "UPDATE CanHo SET " +
                               "Gia = N'" + giaCanHo + "', " +
                               "TrangThai = N'" + trangThai + "', " +
                               "SLPhong = N'" + soLuongPhong + "', " +
                               "MoTa = N'" + moTa + "', " +
                               "HinhAnh = '" + hinhAnh + "', " +
                               "SoTang = N'" + tang + "', " +
                               "SoCanHo = '" + soCanHo + "' " +
                               "WHERE IDCanHo = '" + idCanHo + "'";

            int ketqua = ketnoi.ExecNonQuery(sqlUpdate);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thành công');", true);
                load(); // Gọi lại hàm load để cập nhật danh sách
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
            }
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            // Lấy giá trị ID Căn Hộ từ textbox
            string idCanHo = txt_idcanho.Text.Trim(); // ID Căn Hộ

            // Kiểm tra nếu ID Căn Hộ rỗng
            if (string.IsNullOrEmpty(idCanHo))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn Căn Hộ để xóa!');", true);
                return;
            }

            // Kiểm tra xem căn hộ có tồn tại trong database không
            string sqlCheckExist = "SELECT * FROM CanHo WHERE IDCanHo = '" + idCanHo + "'";
            DataTable dt = ketnoi.ReadData(sqlCheckExist);

            if (dt.Rows.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Căn hộ không tồn tại trong hệ thống!');", true);
                return;
            }

            // Xóa căn hộ khỏi database
            string sqlDelete = "DELETE FROM CanHo WHERE IDCanHo = '" + idCanHo + "'";
            int ketqua = ketnoi.ExecNonQuery(sqlDelete);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa căn hộ thành công');", true);
                load(); // Gọi lại hàm load để cập nhật danh sách sau khi xóa
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa căn hộ thất bại');", true);
            }
        }

        protected void btn_xoaForm_Click(object sender, EventArgs e)
        {
            // Xóa các TextBox
            txt_idcanho.Text = string.Empty;
            txt_socanho.Text = string.Empty;
            txt_gia.Text = string.Empty;
            txt_slphong.Text = string.Empty;
            txt_Mota.Text = string.Empty;
            txt_trangthai.Text = string.Empty;
            DropChuHo.SelectedIndex = 0;
            DropTang.SelectedIndex = 0;
            img.ImageUrl = string.Empty;
            FileUpload1.Attributes.Clear();

        }

        protected void btn_UpChuHo_Click(object sender, EventArgs e)
        {
            string idcanho = txt_idcanho.Text;
            string idhogd = DropChuHo.SelectedValue;
            string trangthai = "Có Chủ";
            // Kiểm tra nếu ID Căn Hộ rỗng
            if (string.IsNullOrEmpty(idcanho))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn Căn Hộ cần cập nhật chủ!');", true);
                return;
            }
            else
            {
                if (string.IsNullOrEmpty(idhogd) || idhogd == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn chủ hộ');", true);
                    return;
                }
                else
                {
                    string sql = "update CanHo set IDHoGD='" + idhogd + "', TrangThai=N'" + trangthai + "' where IDCanHo='" + idcanho + "'";
                    int ketqua = ketnoi.ExecNonQuery(sql);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm chủ hộ thành công');", true);
                        load(); // Gọi lại hàm load để cập nhật danh sách
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm chủ hộ thất bại');", true);
                    }
                }

            }
        }

        protected void btn_DelChuHo_Click(object sender, EventArgs e)
        {
            string idCanHo = txt_idcanho.Text; // Lấy ID căn hộ
            string trangthai = "Trống";
            // Kiểm tra nếu ID Căn Hộ rỗng
            if (string.IsNullOrEmpty(idCanHo))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn Căn Hộ cần cập nhật chủ!');", true);
                return;
            }
            else
            {
                string sql = "update CanHo set IDHoGD= NULL, TrangThai=N'" + trangthai + "' where IDCanHo='" + idCanHo + "'";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa chủ hộ thành công');", true);
                    load(); // Gọi lại hàm load để cập nhật danh sách
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa chủ hộ thất bại');", true);
                }
            }
        }

        protected void btn_AddIMG_Click(object sender, EventArgs e)
        {
            string idcanho = txt_idcanho.Text;
            if (string.IsNullOrEmpty(idcanho))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn Căn Hộ để thêm List Ảnh!');", true);
                return;
            }
            else
            {
                Response.Redirect("QuanLyListAnhCanHo.aspx?idcanho=" + idcanho);
            }
        }
    }
}