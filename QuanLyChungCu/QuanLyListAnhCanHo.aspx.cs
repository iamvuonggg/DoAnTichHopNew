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
    public partial class QuanLyListAnhCanHo : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid();
        }
        private void loadgrid()
        {
            string idcanho = Request.QueryString["idcanho"] + "";
            if (idcanho != "")
            {
                string sql = "select * from ChiTietHinhAnh where IDCanHo='" + idcanho + "'";
                GridView1.DataSource = ketnoi.ReadData(sql);
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label2.Text = row.Cells[1].Text;
            Label1.Text = row.Cells[2].Text;
            // Lấy và gán URL hình ảnh
            string imageUrl = ((Image)row.FindControl("Image1")).ImageUrl;
            Image2.ImageUrl = imageUrl;
        }


        protected void xoa_Click(object sender, EventArgs e)
        {
            string idanh = Label2.Text.Trim();
            if (string.IsNullOrEmpty(idanh))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn ảnh trước khi xóa.');", true);
                return;
            }

            // Kiểm tra ID hình ảnh có tồn tại trong cơ sở dữ liệu không
            string sqlKiemtra = "SELECT * FROM ChiTietHinhAnh WHERE IDHinhAnh = '" + idanh + "'";
            DataTable dt1 = ketnoi.ReadData(sqlKiemtra);

            if (dt1.Rows.Count > 0)
            {
                // Lấy tên file hình ảnh
                string fileName = dt1.Rows[0]["HinhAnh"].ToString();  // Cột "ImageUrl" lưu tên ảnh
                string filePath = Server.MapPath("~/images/") + fileName;

                // Xóa dòng trong bảng HinhAnhChiTiet
                string sqlDelete = "DELETE FROM ChiTietHinhAnh WHERE IDHinhAnh = '" + idanh + "'";
                int ketqua = ketnoi.ExecNonQuery(sqlDelete);

                if (ketqua > 0)
                {
                    // Kiểm tra nếu file tồn tại trong thư mục và xóa
                    if (File.Exists(filePath))
                    {
                        try
                        {
                            File.Delete(filePath);  // Xóa ảnh khỏi thư mục
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa hình ảnh và dữ liệu thành công');", true);
                            loadgrid();  // Cập nhật lại danh sách ảnh (hoặc load lại dữ liệu cần thiết)
                        }
                        catch (Exception ex)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không thể xóa hình ảnh: " + ex.Message + "');", true);
                            return;
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Hình ảnh không tồn tại trong thư mục');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thất bại');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Không tìm thấy hình ảnh với ID đã nhập. Vui lòng kiểm tra lại!');", true);
            }

        }

        protected void them_Click(object sender, EventArgs e)
        {
            string idcanho = Request.QueryString["idcanho"] + "";

            //// chú ý phải thêm using system.Io để dùng được Path 
            //string upload = Path.GetFileName(FileUpload1.FileName);
            //string location = Server.MapPath("~/images/") + upload;
            //FileUpload1.SaveAs(location);

            //    string sql = "Insert into ChiTietHinhAnh values ('" + idcanho + "','" + upload + "')";
            //    int ketqua = ketnoi.ExecNonQuery(sql);
            //    if (ketqua > 0)
            //    {
            //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm ảnh thành công');", true);
            //    loadgrid();
            //    }
            //    else
            //    {
            //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm  thất bại');", true);
            //    }



            if (FileUpload1.HasFile)
            {
                // Lấy tên tệp ảnh và lưu vào thư mục
                string upload = Path.GetFileName(FileUpload1.FileName);
                string location = Server.MapPath("~/images/") + upload;

                // Kiểm tra nếu tệp đã tồn tại, nếu không thì upload tệp ảnh
                if (File.Exists(location))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ảnh đã tồn tại!');", true);
                    return;
                }

                // Lưu ảnh vào thư mục
                FileUpload1.SaveAs(location);

                string sql = "Insert into ChiTietHinhAnh values ('" + idcanho + "','" + upload + "')";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm ảnh thành công');", true);
                    loadgrid();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm  thất bại');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn ảnh để thêm!');", true);
            }
        }
    }
}