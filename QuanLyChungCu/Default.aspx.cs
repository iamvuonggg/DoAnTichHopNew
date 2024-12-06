using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyChungCu
{
    public partial class Default : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadData();

        }
        protected void ListView1_PagePropertiesChanged(object sender, EventArgs e)
        {
            LoadData(); // Ràng buộc lại dữ liệu khi trang thay đổi
        }
        private void LoadData()
        {           
            string sql;
            sql = "select * from CanHo where TrangThai=N'Trống'";
            ListView1.DataSource = ketnoi.ReadData(sql);
            ListView1.DataBind();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string idcanho = ((ImageButton)sender).CommandArgument;
            Response.Redirect("CCChiTietDefault.aspx?idcanho=" + idcanho);
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string idcanho = ((LinkButton)sender).CommandArgument;
            Response.Redirect("CCChiTietDefault.aspx?idcanho=" + idcanho);
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            string idcanho = ((LinkButton)sender).CommandArgument;
            Response.Redirect("CCChiTietDefault.aspx?idcanho=" + idcanho);
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string timkiem = txttimkiem.Text.Trim();
            string sql;

            if (!string.IsNullOrEmpty(timkiem))
            {
                sql = "SELECT * FROM CanHo WHERE TrangThai=N'Trống' AND (SoCanHo LIKE N'%" + timkiem + "%' OR SoTang LIKE N'%" + timkiem + "%')";
            }
            else
            {
                sql = "SELECT * FROM CanHo WHERE TrangThai=N'Trống'";
            }

            ListView1.DataSource = ketnoi.ReadData(sql);
            ListView1.DataBind();
        }

       
    }
}