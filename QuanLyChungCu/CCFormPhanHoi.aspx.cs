using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class CCFormPhanHoi : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loadgrid();
        }
        private void loadgrid()
        {
            string username = Session["UserName"] + "";
            if (username != "")
            {
                string sql = "select * from PhanHoi where TenDangNhap ='" + username + "'";
                DataTable dt = ketnoi.ReadData(sql);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = ketnoi.ReadData(sql);
                    GridView1.DataBind();
                    //lbthongbao.Visible = false;

                }
                //else
                //{
                //    lbthongbao.Visible = true;
                //    lbthongbao.Text = "Chưa có phản hồi nào!";
                //    GridView1.Visible = false;
                //}
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }

        protected void btn_phanhoi_Click(object sender, EventArgs e)
        {
            string noidung = txt_phanhoi.Text;
            string traloi = "Chờ Trả Lời";
            string ngay = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string username = Session["UserName"] + "";
            if (username != "")
            {
                string sql = "insert into PhanHoi (TenDangNhap, NoiDung, NgPhanHoi, TraLoi) values ('" + username + "',N'" + noidung + "',N'" + ngay + "',N'"+traloi+"')";
                int ketqua = ketnoi.ExecNonQuery(sql);
                if (ketqua > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Gửi phản hồi thành công');", true);
                    loadgrid();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }
    }
}