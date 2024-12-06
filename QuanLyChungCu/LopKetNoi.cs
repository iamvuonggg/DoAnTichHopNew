using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace QuanLyChungCu
{
    public class LopKetNoi
    {
        // khai báo đối tượng
        SqlConnection con;

        // tạo hàm mở kết nối
        private void OpenKN()
        {
            // khai báo chuỗi kết nối cơ sở dữ liệu
            string sqlCon = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\QuanLyChungCu\QuanLyChungCu\QuanLyChungCu\App_Data\DBChungCu.mdf;Integrated Security=True";
            // tạo đối tượng mới sqlConnection truyền vào chuỗi kết nối csdl
            con = new SqlConnection(sqlCon);
            // gọi phương thức Open để mở kết nối đến cơ sở dữ liệu
            con.Open();
        }

        // tạo hàm đóng kết nối
        private void CloseKN()
        {
            // kiểm tra xem csdl đã được mở hay chưa nếu mở thì mới gọi phương thức Close để đóng kết nối csdl lại
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        // tạo hàm đọc dữ liệu 
        public DataTable ReadData(string sql)
        {
            // khai báo đối tượng 
            DataTable dt = new DataTable();
            // sử dụng try catch finally để kiểm tra phòng trường hợp lỗi sẽ không bị bung lỗi khi đang chạy
            try
            {
                OpenKN(); // đầu tiên phải mở kết nối
                // khai báo đối tượng sqlDataAdapter, sau đó truyền chuỗi lệnh sql và chuỗi kết nối csdl vào
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                // sqldataAdapter sẽ đọc dữ liệu từ csdl và đưa vào trong datatable (dt) thông qua phương thức Fill
                da.Fill(dt);

            }
            catch (Exception ex)
            {
                // Ghi log lỗi, ví dụ:
                Console.WriteLine("Error in ReadData: " + ex.Message);
                dt = new DataTable(); // Trả về DataTable rỗng thay vì null
            }
            finally
            {
                // cuối cùng sẽ đóng kết nối
                CloseKN();
            }
            // trả về
            return dt;
        }

        // tạo hàm thêm sửa xóa dữ liệu
        public int ExecNonQuery(string sql)
        {
            // khai báo một biến kết quả
            int ketqua = 0;
            try
            {
                // mở kết nối
                OpenKN();
                // khai báo một đối tượng sqlcommand và truyền vào 2 tham số câu lệnh sql và chuỗi kết nối csdl
                SqlCommand cmd = new SqlCommand(sql, con);
                // kết quả sẽ bằng cmd gọi phương thức ExecuteNonQuery() để thêm, sửa, xóa
                ketqua = cmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                // đóng kết nối
                CloseKN();
            }
            return ketqua;

        }
        public object ExecuteScalar(string sql)
        {
            object result = null; // Biến để lưu giá trị trả về
            try
            {
                // Mở kết nối
                OpenKN();
                // Tạo đối tượng SqlCommand với câu lệnh SQL và kết nối
                SqlCommand cmd = new SqlCommand(sql, con);
                // Thực thi ExecuteScalar để lấy giá trị duy nhất
                result = cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                // Ghi log lỗi, nếu cần
                Console.WriteLine("Error in ExecuteScalar: " + ex.Message);
            }
            finally
            {
                // Đóng kết nối
                CloseKN();
            }
            return result; // Trả về giá trị
        }
    }
}