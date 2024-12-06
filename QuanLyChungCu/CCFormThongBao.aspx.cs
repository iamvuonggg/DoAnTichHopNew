using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class CCFormThongBao : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadData();
        }
        private void loadData()
        {
            string sql = "select * from ThongBao";
            DataList1.DataSource = ketnoi.ReadData(sql);
            DataList1.DataBind();
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            string idtb = ((LinkButton)sender).CommandArgument;
            Response.Redirect("CCFormThongBaoChiTiet.aspx?idthongbao=" + idtb);
        }
    }
}