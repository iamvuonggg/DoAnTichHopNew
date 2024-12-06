using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class CCFormDichVu : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            Loaddata();
        }
        private void Loaddata()
        {
            string sql = "select * from DichVu";
            DataList1.DataSource = ketnoi.ReadData(sql);
            DataList1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string iddichvu = ((LinkButton)sender).CommandArgument;
            Response.Redirect("CCChiTietDichVu.aspx?iddichvu=" + iddichvu);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string iddichvu = ((ImageButton)sender).CommandArgument;
            Response.Redirect("CCChiTietDichVu.aspx?iddichvu=" + iddichvu);
        }
    }
}