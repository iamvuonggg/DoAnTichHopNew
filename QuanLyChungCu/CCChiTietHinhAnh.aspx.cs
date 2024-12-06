using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class CCChiTietHinhAnh : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadData();
        }
        private void LoadData()
        {
            string idcanho = Request.QueryString["idcanho"] + "";

            if (idcanho != "")
            {
                string loaddls1 = " select * from ChiTietHinhAnh where IDCanHo=" + idcanho + "";
                DataList1.DataSource = ketnoi.ReadData(loaddls1);
                DataList1.DataBind();
            }
        }
    }
}