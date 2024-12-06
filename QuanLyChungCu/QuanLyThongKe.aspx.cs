using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class QuanLyThongKe : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid1();
            loadgrid2();
            TinhTongDoanhThu();
        }
        private void loadgrid1()
        {
            string sql = " select HoaDonDichVu.IDHoaDon, DichVu.IDDichVu, DichVu.Gia, HoaDonDichVu.NgLapHD, HoaDonDichVu.SoThangSD, (DichVu.Gia*HoaDonDichVu.SoThangSD) As TongTien " +
                    " from TaiKhoan, DichVu, HoaDonDichVu " +
                    "where TaiKhoan.TenDangNhap = HoaDonDichVu.TenDangNhap AND DichVu.IDDichVu = HoaDonDichVu.IDDichVu ";
            GridView1.DataSource = ketnoi.ReadData(sql);
            GridView1.DataBind();
        }
        private void loadgrid2()
        {
            string sql = "SELECT HoaDonDienNuoc.IDHoaDon, HoaDonDienNuoc.TieuThu, HoaDonDienNuoc.NgLap, HoaDonDienNuoc.GiaTieuThu,  (HoaDonDienNuoc.TieuThu*HoaDonDienNuoc.GiaTieuThu) As TongTien " +
                    "FROM HoaDonDienNuoc ";

            GridView2.DataSource = ketnoi.ReadData(sql);
            GridView2.DataBind();
        }

        protected void btn_thongke_Click(object sender, EventArgs e)
        {
            string input = txt_thongke.Text.Trim();
            if (string.IsNullOrEmpty(input))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập tháng hoặc năm cần thống kê!');", true);
                return;
            }

            int value;
            if (!int.TryParse(input, out value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập lại!');", true);
                return;
            }

            string sql = "";
            if (value >= 1 && value <= 12)
            {
                sql = "SELECT SUM(DichVu.Gia * HoaDonDichVu.SoThangSD) " +
                      "FROM HoaDonDichVu " +
                      "JOIN DichVu ON DichVu.IDDichVu = HoaDonDichVu.IDDichVu " +
                      "WHERE MONTH(HoaDonDichVu.NgLapHD) = " + value;
            }
            else if (value.ToString().Length == 4)
            {
                sql = "SELECT SUM(DichVu.Gia * HoaDonDichVu.SoThangSD) " +
                      "FROM HoaDonDichVu " +
                      "JOIN DichVu ON DichVu.IDDichVu = HoaDonDichVu.IDDichVu " +
                      "WHERE YEAR(HoaDonDichVu.NgLapHD) = " + value;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tháng hoặc năm không hợp lệ!');", true);
                return;
            }

            object result = ketnoi.ExecuteScalar(sql);

            // Kiểm tra kết quả trả về có phải là NULL
            if (result == null || result == DBNull.Value)
            {
                if (value >= 1 && value <= 12)
                {
                    lb_thongkeThang.Text = "0 VNĐ";
                }
                else
                {
                    lb_thongkeNam.Text = "0 VNĐ";
                }
            }
            else
            {
                // Chuyển đổi giá trị khi không phải NULL
                if (value >= 1 && value <= 12)
                {
                    lb_thongkeThang.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
                }
                else
                {
                    lb_thongkeNam.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
                }
            }
        }

        protected void btn_tongdoanhthu_Click(object sender, EventArgs e)
        {
            string sql = "SELECT SUM(DichVu.Gia * HoaDonDichVu.SoThangSD) " +
                 "FROM HoaDonDichVu " +
                 "JOIN DichVu ON DichVu.IDDichVu = HoaDonDichVu.IDDichVu";

            object result = ketnoi.ExecuteScalar(sql);

            if (result == null || result == DBNull.Value)
            {
                lb_tongdoanhThu.Text = "0 VNĐ";
            }
            else
            {
                lb_tongdoanhThu.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
            }
        }

        protected void btn_tkDN_Click(object sender, EventArgs e)
        {
            string input = txt_tkDN.Text.Trim();
            if (string.IsNullOrEmpty(input))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập tháng hoặc năm cần thống kê!');", true);
                return;
            }

            int value;
            if (!int.TryParse(input, out value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập một số nguyên hợp lệ!');", true);
                return;
            }

            string sql = "";
            if (value >= 1 && value <= 12) // Thống kê theo tháng
            {
                sql = "SELECT SUM(HoaDonDienNuoc.TieuThu * HoaDonDienNuoc.GiaTieuThu) " +
                      "FROM HoaDonDienNuoc " +
                      "WHERE MONTH(HoaDonDienNuoc.NgLap) = " + value;
            }
            else if (value.ToString().Length == 4) // Thống kê theo năm
            {
                sql = "SELECT SUM(HoaDonDienNuoc.TieuThu * HoaDonDienNuoc.GiaTieuThu) " +
                      "FROM HoaDonDienNuoc " +
                      "WHERE YEAR(HoaDonDienNuoc.NgLap) = " + value;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập tháng từ 1-12 hoặc năm có đúng 4 chữ số!');", true);
                return;
            }

            object result = ketnoi.ExecuteScalar(sql);

            if (result == null || result == DBNull.Value)
            {
                if (value >= 1 && value <= 12)
                {
                    lb_dtThang.Text = "0 VNĐ";
                }
                else
                {
                    lb_dtNam.Text = "0 VNĐ";
                }
            }
            else
            {
                if (value >= 1 && value <= 12)
                {
                    lb_dtThang.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
                }
                else
                {
                    lb_dtNam.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
                }
            }
        }

        protected void btn_tkTDT_Click(object sender, EventArgs e)
        {
            string sql = "SELECT SUM(HoaDonDienNuoc.TieuThu * HoaDonDienNuoc.GiaTieuThu) " +
                 "FROM HoaDonDienNuoc";

            object result = ketnoi.ExecuteScalar(sql);

            if (result == null || result == DBNull.Value)
            {
                lb_tongDT.Text = "0 VNĐ";
            }
            else
            {
                lb_tongDT.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
            }
        }

        protected void btntong_Click(object sender, EventArgs e)
        {
            TinhTongDoanhThu();
        }
        private void TinhTongDoanhThu()
        {
            // Tính tổng doanh thu từ cả 2 bảng HoaDonDienNuoc và HoaDonDichVu
            string sqlTongDoanhThu = @"
        SELECT 
            SUM(HoaDonDienNuoc.TieuThu * HoaDonDienNuoc.GiaTieuThu) + 
            (SELECT SUM(DichVu.Gia * HoaDonDichVu.SoThangSD) 
             FROM HoaDonDichVu 
             JOIN DichVu ON DichVu.IDDichVu = HoaDonDichVu.IDDichVu)
        FROM HoaDonDienNuoc";

            decimal tongDoanhThu = 0;

            // Thực thi câu lệnh SQL để lấy tổng doanh thu
            object result = ketnoi.ExecuteScalar(sqlTongDoanhThu);
            if (result != null && result != DBNull.Value)
            {
                tongDoanhThu = Convert.ToDecimal(result);
            }

            // Hiển thị tổng doanh thu lên TextBox
            txttongdoanhthu.Text = tongDoanhThu.ToString("N0") + " VNĐ";
        }
        protected void btn_tkTong_Click(object sender, EventArgs e)
        {
            string input = TextBox1.Text.Trim();

            // Kiểm tra xem người dùng đã nhập gì hay chưa
            if (string.IsNullOrEmpty(input))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập tháng hoặc năm cần thống kê!');", true);
                return;
            }

            int value;
            // Kiểm tra xem giá trị nhập vào có phải là một số nguyên không
            if (!int.TryParse(input, out value))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập lại!');", true);
                return;
            }

            // Kiểm tra xem giá trị nhập vào có hợp lệ (tháng từ 1 đến 12 hoặc năm 4 chữ số)
            if (!(value >= 1 && value <= 12 || value.ToString().Length == 4))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tháng hoặc năm không hợp lệ!');", true);
                return;
            }

            // Xây dựng câu truy vấn SQL tùy theo giá trị tháng/năm nhập vào
            string sql = "";
            if (value >= 1 && value <= 12) // Thống kê theo tháng
            {
                sql = @"
            SELECT 
                SUM(HoaDonDienNuoc.TieuThu * HoaDonDienNuoc.GiaTieuThu) + 
                (SELECT SUM(DichVu.Gia * HoaDonDichVu.SoThangSD) 
                 FROM HoaDonDichVu 
                 JOIN DichVu ON DichVu.IDDichVu = HoaDonDichVu.IDDichVu)
            FROM HoaDonDienNuoc
            WHERE MONTH(HoaDonDienNuoc.NgLap) = " + value;
            }
            else if (value.ToString().Length == 4) // Thống kê theo năm
            {
                sql = @"
            SELECT 
                SUM(HoaDonDienNuoc.TieuThu * HoaDonDienNuoc.GiaTieuThu) + 
                (SELECT SUM(DichVu.Gia * HoaDonDichVu.SoThangSD) 
                 FROM HoaDonDichVu 
                 JOIN DichVu ON DichVu.IDDichVu = HoaDonDichVu.IDDichVu)
            FROM HoaDonDienNuoc
            WHERE YEAR(HoaDonDienNuoc.NgLap) = " + value;
            }

            // Thực thi câu truy vấn và xử lý kết quả trả về
            object result = ketnoi.ExecuteScalar(sql);

            // Kiểm tra kết quả trả về có phải là NULL
            if (result == null || result == DBNull.Value)
            {
                if (value >= 1 && value <= 12)
                {
                    Label1.Text = "0 VNĐ";
                }
                else
                {
                    Label2.Text = "0 VNĐ";
                }
            }
            else
            {
                if (value >= 1 && value <= 12)
                {
                    Label1.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
                }
                else
                {
                    Label2.Text = Convert.ToDecimal(result).ToString("N0") + " VNĐ";
                }
            }
        }
    }
}