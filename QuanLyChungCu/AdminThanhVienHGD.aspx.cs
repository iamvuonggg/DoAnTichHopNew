using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class AdminThanhVienHGD : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            load();
            loadgrid();
        }
        private void load()
        {
            string idho = Request.QueryString["idho"] + "";
            if (idho != "")
            {
                string sql = "select * from HoGiaDinh where IDHoGD ='" + idho + "'";
                DataList1.DataSource = ketnoi.ReadData(sql);
                DataList1.DataBind();
            }

        }
        private void loadgrid()
        {
            string idho = Request.QueryString["idho"] + "";
            if (idho != "")
            {
                string sql = "select * from ThanhVienHGD where IDHoGD ='" + idho + "'";
                GridView1.DataSource = ketnoi.ReadData(sql);
                GridView1.DataBind();
            }
        }
        

        protected void btn_them_Click(object sender, EventArgs e)
        {
            string idho = Request.QueryString["idho"] + "";
            Button btnthem = ((Button)sender);
            DataListItem item = (DataListItem)btnthem.Parent;
            //string idtv = ((TextBox)item.FindControl("txtidthanhvien")).Text;
            string hoten = ((TextBox)item.FindControl("txt_hoten")).Text;
            string ngsinh = ((TextBox)item.FindControl("txt_ngaysinh")).Text;
            string mqh = ((TextBox)item.FindControl("txt_mqh")).Text;
            if(hoten=="" && ngsinh =="" && mqh == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng điền đầy đủ thông tin.');", true);
            }
            else
            {
                // Chuyển đổi giá trị ngaysinh thành DateTime
                DateTime parsedDate;
                string Fngaysinh = string.Empty;
                if (DateTime.TryParse(ngsinh, out parsedDate))
                {
                    Fngaysinh = parsedDate.ToString("yyyy-MM-dd");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ngày sinh không hợp lệ');", true);
                    
                }
                
                
                    string sql = "INSERT INTO ThanhVienHGD (IDHoGD, HoTen, NgSinh, MoiQuanHe) VALUES ('" + idho + "', N'" + hoten + "', '" + Fngaysinh + "', N'" + mqh + "')";
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
        protected void btn_sua_Click(object sender, EventArgs e)
        {
            Button btnsua = (Button)sender;
            DataListItem item = (DataListItem)btnsua.Parent;

            string idtv = ((TextBox)item.FindControl("txtidthanhvien")).Text;
            string hoten = ((TextBox)item.FindControl("txt_hoten")).Text;
            string ngsinh = ((TextBox)item.FindControl("txt_ngaysinh")).Text;
            string mqh = ((TextBox)item.FindControl("txt_mqh")).Text;

            // Kiểm tra các trường nhập có trống hay không
            if (string.IsNullOrEmpty(hoten) || string.IsNullOrEmpty(ngsinh) || string.IsNullOrEmpty(mqh))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng điền đầy đủ thông tin.');", true);
                return;
            }

            // Chuyển đổi ngày sinh thành định dạng DateTime
            DateTime parsedDate;
            string Fngaysinh = string.Empty;
            if (DateTime.TryParse(ngsinh, out parsedDate))
            {
                Fngaysinh = parsedDate.ToString("yyyy-MM-dd");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ngày sinh không hợp lệ');", true);
                return;
            }

            // Cập nhật thông tin thành viên
            string sqlUpdate = "UPDATE ThanhVienHGD SET HoTen = N'" + hoten + "', NgSinh = '" + Fngaysinh + "', MoiQuanHe = N'" + mqh + "' WHERE IDThanhVien = '" + idtv + "'";

            int ketqua = ketnoi.ExecNonQuery(sqlUpdate);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thành công');", true);
                loadgrid(); // Cập nhật lại bảng sau khi sửa
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
            }
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            Button btnxoa = (Button)sender;
            DataListItem item = (DataListItem)btnxoa.Parent;

            string idtv = ((TextBox)item.FindControl("txtidthanhvien")).Text;

            // Kiểm tra IDThanhVien có hợp lệ không
            if (string.IsNullOrEmpty(idtv))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('ID thành viên không hợp lệ.');", true);
                return;
            }

            // Xóa thành viên khỏi cơ sở dữ liệu
            string sqlDelete = "DELETE FROM ThanhVienHGD WHERE IDThanhVien = '" + idtv + "'";

            int ketqua = ketnoi.ExecNonQuery(sqlDelete);
            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thành công');", true);
                loadgrid(); // Cập nhật lại bảng sau khi xóa
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thất bại');", true);
            }
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            Button btnclear = (Button)sender;
            DataListItem item = (DataListItem)btnclear.Parent;

            // Xóa tất cả các giá trị trong các TextBox
            ((TextBox)item.FindControl("txtidthanhvien")).Text = "";
            ((TextBox)item.FindControl("txt_hoten")).Text = "";
            ((TextBox)item.FindControl("txt_ngaysinh")).Text = "";
            ((TextBox)item.FindControl("txt_mqh")).Text = "";
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lấy dòng được chọn trong GridView
            GridViewRow row = GridView1.SelectedRow;
            // Lấy các điều khiển trong DataList 
            foreach (DataListItem item in DataList1.Items)
            {
                // Tìm TextBox trong DataList và gán giá trị từ GridView vào
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    TextBox txtid = (TextBox)item.FindControl("txtidthanhvien");
                    TextBox txtHoTen = (TextBox)item.FindControl("txt_hoten");
                    TextBox txtNgaySinh = (TextBox)item.FindControl("txt_ngaysinh");
                    TextBox txtMqh = (TextBox)item.FindControl("txt_mqh");

                    // Gán giá trị cho các TextBox trong DataList
                    txtid.Text = row.Cells[1].Text == "&nbsp;" ? "" : row.Cells[1].Text; 
                    txtHoTen.Text = row.Cells[2].Text == "&nbsp;" ? "" : row.Cells[3].Text; 
                    txtNgaySinh.Text = row.Cells[3].Text == "&nbsp;" ? "" : row.Cells[4].Text;
                    txtMqh.Text = row.Cells[4].Text == "&nbsp;" ? "" : row.Cells[5].Text;
                }
            }
        }

       
    }
}