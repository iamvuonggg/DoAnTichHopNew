using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace QuanLyChungCu
{
    public partial class CCFormDoiPassWord : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            loaddata();
        }
        private void loaddata(){
            string username = Session["UserName"] + "";
            if(username != "")
            {
                string sql = "select * from TaiKhoan where TenDangNhap='" + username + "'";
                DataList1.DataSource = ketnoi.ReadData(sql);
                DataList1.DataBind();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }

        }
        protected void btndoi_Click(object sender, EventArgs e)
        {
            string username = Session["UserName"] + "";
            string tendangnhap = ((Button)sender).CommandArgument;
            Button btnsua = ((Button)sender);
            DataListItem item = (DataListItem)btnsua.Parent;
            string matkhau = ((TextBox)item.FindControl("txt_matkhau")).Text;
            string matkhau1 = ((TextBox)item.FindControl("txt_passnew")).Text;
            string matkhau2 = ((TextBox)item.FindControl("txt_passnew1")).Text;
            if (username != "")
            {
                if(matkhau != "" && matkhau1 != "" && matkhau2 != "")
                {
                    string sqlCheck = "select * from TaiKhoan where TenDangNhap='" + username + "'";
                    DataTable dt = ketnoi.ReadData(sqlCheck);
                    if (dt.Rows.Count > 0)
                    {
                        string matkhauDB = dt.Rows[0]["MatKhau"].ToString();
                        if (matkhau == matkhauDB)
                        {
                            string sqldoi = "update TaiKhoan set MatKhau='" + matkhau1 + "'";
                            int ketqua = ketnoi.ExecNonQuery(sqldoi);
                            if (ketqua > 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đổi mật khẩu thành công'); window.location='FormDangNhap.aspx';", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đổi mật khẩu thất bại!');", true);
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mật khẩu cũ không đúng!');", true);
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Chưa nhập mật khẩu!');", true);
                }
                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Bạn chưa đăng nhập! Vui lòng đăng nhập để xem thông tin.'); window.location='FormDangNhap.aspx';", true);
            }
        }
    }
}