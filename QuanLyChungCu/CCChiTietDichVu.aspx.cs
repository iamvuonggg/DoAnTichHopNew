using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class CCChiTietDichVu : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadData();
        }
        private void LoadData()
        {
            string iddichvu = Request.QueryString["iddichvu"] + "";

            if (iddichvu != "")
            {
                string loaddls1 = " select * from DichVu where IDDichVu=" + iddichvu + "";
                DataList1.DataSource = ketnoi.ReadData(loaddls1);
                DataList1.DataBind();
            }
        }

        protected void btn_giam_Click(object sender, EventArgs e)
        {
            // Lấy đối tượng Button đã được nhấn
            Button btnGiam = (Button)sender;

            // Lấy DataListItem chứa Button này
            DataListItem item = (DataListItem)btnGiam.NamingContainer;

            // Tìm Label trong DataListItem đó
            TextBox lbSoLuongMua = (TextBox)item.FindControl("txt_soluong");

            // Lấy số lượng hiện tại từ textbox và giảm nếu lớn hơn 1
            int soLuong = int.Parse(lbSoLuongMua.Text);
            if (soLuong > 1)
            {
                soLuong--;
            }

            // Cập nhật lại số lượng trong Label
            lbSoLuongMua.Text = soLuong.ToString();
        }

        protected void btn_tang_Click(object sender, EventArgs e)
        {
            // Lấy đối tượng Button đã được nhấn
            Button btnTang = (Button)sender;

            // Lấy DataListItem chứa Button này
            DataListItem item = (DataListItem)btnTang.NamingContainer;

            // Tìm Label trong DataListItem đó
            TextBox lbSoLuongMua = (TextBox)item.FindControl("txt_soluong");

            // Lấy số lượng hiện tại từ Label và tăng
            int soLuong = int.Parse(lbSoLuongMua.Text);
            soLuong++;

            // Cập nhật lại số lượng trong Label
            lbSoLuongMua.Text = soLuong.ToString();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string matk = Session["UserName"] + "";
            if (matk != "")
            {
                string iddichvu = ((LinkButton)sender).CommandArgument;
                LinkButton btdichvu = (LinkButton)sender;
                DataListItem item = (DataListItem)btdichvu.Parent;
                string soluong = ((TextBox)item.FindControl("txt_soluong")).Text;

                // Kiểm tra biến số lượng, int.TryParse để kiểm tra txt là một số nguyên và kiểm tra số lượng phải lớn hơn 0 
                if (int.TryParse(soluong, out int thangsudung) && thangsudung > 0)
                {

                  
                    // Thêm mới vào giỏ hàng
                    string ngay = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    string trangthai = "Chờ xử lý";
                    string sqlThem = "INSERT INTO HoaDonDichVu (TenDangNhap, IDDichVu, NgLapHD, TrangThai, SoThangSD) VALUES ('" + matk + "'," + iddichvu + ",'" + ngay + "',N'" + trangthai + "'," + soluong + ")";
                    int ketqua = ketnoi.ExecNonQuery(sqlThem);
                    if (ketqua > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đặt dịch vụ thành công');", true);
                    }
                }                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để sử dụng dịch vụ.'); window.location='FormDangNhap.aspx';", true);
            }
        }
    }
}