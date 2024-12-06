using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class AdminHoaDon : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid1();
            loadgrid2();
            loadDropHDG();
        }
        private void loadDropHDG()
        {
            string sql = "SELECT * FROM HoGiaDinh WHERE TenChuHo IS NOT NULL AND TenChuHo <> ''";
            DropHoGD.DataSource = ketnoi.ReadData(sql);
            DropHoGD.DataTextField = "TenChuHo";
            DropHoGD.DataValueField = "IDHoGD";
            DropHoGD.DataBind();
            // thêm một loại mới vào drl
            DropHoGD.Items.Insert(0, new ListItem("Tất cả", "0"));
        }
        private void loadgrid1()
        {
            string sql = " select HoaDonDichVu.IDHoaDon, DichVu.IDDichVu, DichVu.Gia, DichVu.TenDV, HoaDonDichVu.NgLapHD, HoaDonDichVu.TrangThai, HoaDonDichVu.SoThangSD, HoaDonDichVu.HinhAnh, HoGiaDinh.TenChuHo, (DichVu.Gia*HoaDonDichVu.SoThangSD) As TongTien " +
                    " from TaiKhoan, DichVu, HoGiaDinh, HoaDonDichVu " +
                    "where TaiKhoan.TenDangNhap = HoaDonDichVu.TenDangNhap AND DichVu.IDDichVu = HoaDonDichVu.IDDichVu AND TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD";
            GridView1.DataSource = ketnoi.ReadData(sql);
            GridView1.DataBind();
        }
        private void loadgrid2()
        {
            string sql = "SELECT HoaDonDienNuoc.IDHoaDon, HoaDonDienNuoc.LoaiHD, HoGiaDinh.IDHoGD, HoGiaDinh.TenChuHo, HoaDonDienNuoc.TieuThu,HoaDonDienNuoc.NgLap, HoaDonDienNuoc.GiaTieuThu, HoaDonDienNuoc.TinhTrang, HoaDonDienNuoc.HinhAnh, (HoaDonDienNuoc.TieuThu*HoaDonDienNuoc.GiaTieuThu) As TongTien " +
                    "FROM TaiKhoan, HoGiaDinh, HoaDonDienNuoc " +
                    "WHERE TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD " +
                    "AND HoGiaDinh.IDHoGD = HoaDonDienNuoc.IDHoGD ";
                    
            GridView2.DataSource = ketnoi.ReadData(sql);
            GridView2.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txt_idhoadon.Text = row.Cells[1].Text;
            txt_tenchuho.Text = row.Cells[2].Text;
            txt_tendv.Text = row.Cells[3].Text;
            txt_gia.Text = row.Cells[4].Text;
            txtngaylap.Text = row.Cells[5].Text;
            txt_sothang.Text = row.Cells[6].Text;
            txt_tongtien.Text = row.Cells[7].Text;
            string trangThai = row.Cells[9].Text.Trim();
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

        protected void btntrangthai_Click(object sender, EventArgs e)
        {
            string trangthai = DropTrangThai.SelectedItem.Text.Trim();
            string idhoadon = txt_idhoadon.Text.Trim();
            if (string.IsNullOrEmpty(idhoadon))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn hóa đơn cần cập nhật!');", true);
                return;
            }
            string sqlUpdate = "UPDATE HoaDonDichVu SET " +
                               "TrangThai = N'" + trangthai + "'" +
                               "WHERE IDHoaDon = '" + idhoadon + "'";

            int ketqua = ketnoi.ExecNonQuery(sqlUpdate);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thành công');", true);
                loadgrid1();// Gọi lại hàm load để cập nhật danh sách
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại');", true);
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            txt_idhoadonDN.Text = row.Cells[1].Text.Trim();
            DropHoGD.SelectedValue = row.Cells[3].Text.Trim();
            txtngaylapHD.Text = row.Cells[7].Text.Trim();
            txtsotieuthu.Text = row.Cells[5].Text.Trim();
            txt_giatieuthu.Text = row.Cells[6].Text.Trim();
            txt_tongtienDN.Text = row.Cells[8].Text.Trim();
            string loaiHD = row.Cells[2].Text.Trim();
            ListItem item = DropLoaiHD.Items.FindByText(loaiHD);
            if (item != null)
            {
                DropLoaiHD.ClearSelection();
                item.Selected = true;
            }
            else
            {
                // Nếu trạng thái không tìm thấy trong DropDownList
                DropLoaiHD.ClearSelection();
            }
            string tinhtrang = row.Cells[9].Text.Trim();
            ListItem itemTT = DropTinhTrang.Items.FindByText(tinhtrang);
            if (itemTT != null)
            {
                DropTinhTrang.ClearSelection();
                itemTT.Selected = true;
            }
            else
            {
                // Nếu trạng thái không tìm thấy trong DropDownList
                DropTinhTrang.ClearSelection();
            }

        }

        protected void btnClearForm_Click(object sender, EventArgs e)
        {
            txt_idhoadonDN.Text = string.Empty;
            DropHoGD.SelectedIndex = 0;
            txtngaylapHD.Text = string.Empty;
            txtsotieuthu.Text = string.Empty;
            txt_giatieuthu.Text = string.Empty;
            txt_tongtienDN.Text = string.Empty;
            DropLoaiHD.SelectedIndex = 0;
            DropTinhTrang.SelectedIndex = 0;
            
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            string idho = DropHoGD.SelectedValue;
            string ngay = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sotieuthu = txtsotieuthu.Text.Trim();
            string giatieuthu = txt_giatieuthu.Text.Trim();
            string loaiHD = DropLoaiHD.SelectedItem.Text;
            string trangthai = DropTinhTrang.SelectedItem.Text;
            string sql = "insert into HoaDonDienNuoc (IDHoGD, NgLap, TieuThu, GiaTieuThu, LoaiHD, TinhTrang) " +
                "values('"+idho+"','"+ngay+"','"+sotieuthu+"','"+giatieuthu+"',N'"+loaiHD+"',N'"+trangthai+"')";
            int ketqua = ketnoi.ExecNonQuery(sql);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tạo hóa đơn thành công');", true);
                loadgrid2();// Gọi lại hàm load để cập nhật danh sách
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tạo hóa đơn thất bại');", true);
            }
        }

        protected void btnsua_Click(object sender, EventArgs e)
        {
            string idhoadon = txt_idhoadonDN.Text;
            string idho = DropHoGD.SelectedValue;
            string ngay = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string sotieuthu = txtsotieuthu.Text.Trim();
            string giatieuthu = txt_giatieuthu.Text.Trim();
            string loaiHD = DropLoaiHD.SelectedItem.Text;
            string trangthai = DropTinhTrang.SelectedItem.Text;
            if (string.IsNullOrEmpty(idhoadon))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn hóa đơn cần cập nhật!');", true);
                return;
            }
            string sql = "update HoaDonDienNuoc set " +
                "IDHoGD='"+idho+"', NgLap='"+ngay+"', TieuThu='"+sotieuthu+"', GiaTieuThu='"+giatieuthu+"', LoaiHD=N'"+loaiHD+"', TinhTrang=N'"+trangthai+"' " +
                "where IDHoaDon='"+idhoadon+"'";
            int ketqua = ketnoi.ExecNonQuery(sql);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật hóa đơn thành công');", true);
                loadgrid2();// Gọi lại hàm load để cập nhật danh sách
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật hóa đơn thất bại');", true);
            }
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            string idhoadon = txt_idhoadonDN.Text;
            if (string.IsNullOrEmpty(idhoadon))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn hóa đơn cần xóa!');", true);
                return;
            }
            string sql = "delete from HoaDonDienNuoc where IDHoaDon='" + idhoadon + "'";
            int ketqua = ketnoi.ExecNonQuery(sql);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa hóa đơn thành công');", true);
                loadgrid2();// Gọi lại hàm load để cập nhật danh sách
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa hóa đơn thất bại');", true);
            }
        }

        protected void btnuptrangthai_Click(object sender, EventArgs e)
        {
            string idhoadon = txt_idhoadonDN.Text;
           
            string trangthai = DropTinhTrang.SelectedItem.Text;
            if (string.IsNullOrEmpty(idhoadon))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn hóa đơn cần cập nhật trạng thái!');", true);
                return;
            }
            string sql = "update HoaDonDienNuoc set " +
                "TinhTrang=N'" + trangthai + "' " +
                "where IDHoaDon='" + idhoadon + "'";
            int ketqua = ketnoi.ExecNonQuery(sql);

            if (ketqua > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật trạng thái thành công');", true);
                loadgrid2();// Gọi lại hàm load để cập nhật danh sách
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật trạng thái thất bại');", true);
            }
        }

        protected void btn_bill_Click(object sender, ImageClickEventArgs e)
        {
            string idhoadon = ((ImageButton)sender).CommandArgument;
            Response.Redirect("AdminBillDV.aspx?idhoadon=" + idhoadon);
        }

        protected void btn_billDN_Click(object sender, ImageClickEventArgs e)
        {
            string idhoadon = ((ImageButton)sender).CommandArgument;
            Response.Redirect("AdminBillDN.aspx?idhoadon=" + idhoadon);
        }
    }
}