using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class CCFormHoaDonBillDV : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            load();
        }
        private void load()
        {
            string idhoadon = Request.QueryString["idhoadon"] + "";
            if (idhoadon != "")
            {
                string sql = "select HinhAnh from HoaDonDichVu where IDHoaDon='" + idhoadon + "'";
                DataList1.DataSource = ketnoi.ReadData(sql);
                DataList1.DataBind();
            }
        }

       
    }
}