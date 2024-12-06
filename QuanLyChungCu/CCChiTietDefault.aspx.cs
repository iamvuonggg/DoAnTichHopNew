using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class CCChiTietDefault : System.Web.UI.Page
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
                string loaddls1 = " select * from CanHo where IDCanHo="+idcanho+"";
                DataList1.DataSource = ketnoi.ReadData(loaddls1);
                DataList1.DataBind();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string idcanho = ((LinkButton)sender).CommandArgument;
            Response.Redirect("CCChiTietHinhAnh.aspx?idcanho=" + idcanho);
        }
    }
}