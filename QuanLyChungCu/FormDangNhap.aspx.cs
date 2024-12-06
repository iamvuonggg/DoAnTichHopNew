using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class FormDangNhap : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string username = Login1.UserName;
            string password = Login1.Password;
            string sql = "select * from TaiKhoan where TenDangNhap= '"+username+"' and MatKhau='"+password+"'";
            DataTable dt = ketnoi.ReadData(sql);
            if (dt.Rows.Count > 0)
            {
                string trangthai = dt.Rows[0]["TrangThai"].ToString();
                if (trangthai == "Khóa")
                {
                    // Nếu tài khoản bị khóa, hiển thị thông báo và không cho đăng nhập
                    Login1.FailureText = "Tài khoản của bạn đã bị khóa";
                }
                else
                {
                    Session["UserName"] = username;
                    // Đặt cờ IsLoggedIn thành true khi đăng nhập thành công
                    Session["IsLoggedIn"] = true;
                    int idQuyen = Convert.ToInt32(dt.Rows[0]["IDQuyen"]);
                    if (idQuyen == 1)
                    {
                        Response.Redirect("FormAdmin.aspx");
                    }

                    else if (idQuyen == 2)
                    {
                        Response.Redirect("FormQuanLy.aspx");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                
            }
            else
            {
                Login1.FailureText = "Sai tên đăng nhập hoặc mật khẩu";
            }

        }
    }
}