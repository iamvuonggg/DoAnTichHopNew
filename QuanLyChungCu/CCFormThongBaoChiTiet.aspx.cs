using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class CCFormThongBaoChiTiet : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddata();
        }
        private void loaddata()
        {
            string idtb = Request.QueryString["idthongbao"] + "";
            string sql = "select TieuDe, NoiDung, NgThongBao, HoGiaDinh.TenChuHo from TaiKhoan, HoGiaDinh, ThongBao where TaiKhoan.TenDangNhap = ThongBao.TenDangNhap and TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD and IDThongBao='" + idtb + "'";
            DataList1.DataSource = ketnoi.ReadData(sql);
            DataList1.DataBind();
        }
    }
}