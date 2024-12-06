using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class AdminPhanHoi : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid();
        }
        private void loadgrid(){
            string sql = "select IDPhanHoi, HoGiaDinh.IDHoGD, HoGiaDinh.TenChuHo, NoiDung, NgPhanHoi, TraLoi, NgTraLoi from PhanHoi, TaiKhoan, HoGiaDinh " +
                "where TaiKhoan.TenDangNhap = PhanHoi.TenDangNhap and TaiKhoan.IDHoGD = HoGiaDinh.IDHoGD";
            GridView1.DataSource = ketnoi.ReadData(sql);
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            lb_idphanhoi.Text = row.Cells[1].Text;
            lb_idhogd.Text = row.Cells[2].Text;
            lb_tenchuho.Text = row.Cells[3].Text;
            txt_noidung.Text = row.Cells[4].Text;
            lb_ngayphanhoi.Text = row.Cells[5].Text;
            txttraloi.Text = row.Cells[6].Text == "&nbsp;" ? "" : row.Cells[6].Text;
            lb_ngaytraloi.Text = row.Cells[7].Text;
        }

        protected void btn_clearForm_Click(object sender, EventArgs e)
        {
            lb_idphanhoi.Text = string.Empty;
            lb_idhogd.Text = string.Empty;
            lb_tenchuho.Text = string.Empty;
            txt_noidung.Text = string.Empty;
            lb_ngayphanhoi.Text = string.Empty;
            txttraloi.Text = string.Empty;
            lb_ngaytraloi.Text = string.Empty;
        }

        protected void btn_traloi_Click(object sender, EventArgs e)
        {
            string idphanhoi = lb_idphanhoi.Text;
            string traloi = txttraloi.Text.Trim();
            string ngaythang = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            if (string.IsNullOrEmpty(idphanhoi))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn phản hồi cần trả lời!');", true);
                return;
            }
            if (string.IsNullOrEmpty(traloi))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa viết câu trả lời');", true);
            }
            else
            {
                string sql = "update PhanHoi set TraLoi=N'" + traloi + "', NgTraLoi='" + ngaythang + "' where IDPhanHoi='"+idphanhoi+"'";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Trả lời thành công');", true);
                    loadgrid();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Trả lời thất bại');", true);
                }
            }
        }

        protected void btn_xoa_Click(object sender, EventArgs e)
        {
            string idphanhoi = lb_idphanhoi.Text;
            if (string.IsNullOrEmpty(idphanhoi))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng chọn phản hồi cần xóa!');", true);
                return;
            }
            string sqlcheck = "SELECT * FROM PhanHoi WHERE IDPhanHoi = '" + idphanhoi + "'";
            DataTable dt = ketnoi.ReadData(sqlcheck);
            if (dt.Rows.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('ID phản hồi không tồn tại');", true);
                return;
            }
            else
            {
                string sql = "delete from PhanHoi where IDPhanHoi='" + idphanhoi + "'";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa Phản Hồi Thành Công');", true);
                    loadgrid();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa Phản Hồi Thất Bại');", true);
                }
            }
        }
    }
}