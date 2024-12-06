<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCChiTietDichVu.aspx.cs" Inherits="QuanLyChungCu.CCChiTietDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Tổng thể container */
        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin: 20px auto;
            padding: 20px;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 10px;
        }

        /* Phần trái (ảnh và nút) */
        .left {
            width: 40%;
            text-align: center;
        }

        .left .img {
            width: 400px; /* Đảm bảo ảnh chiếm toàn bộ chiều rộng của container */
            height: 300px; /* Giữ tỷ lệ ảnh */
            border-radius: 10px; /* Bo góc ảnh */
            margin-bottom: 10px;
        }

        .left button, 
        .left a {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .left button:hover, 
        .left a:hover {
            background-color: #0056b3;
        }

        /* Phần phải (thông tin dịch vụ) */
        .right {
            width: 55%;
            display: flex;
            flex-direction: column; /* Đặt các phần tử trong .right thành cột dọc */
            gap: 15px; /* Khoảng cách giữa các mục */
            font-size: 16px;
            color: #333;
        }

        .right_box td {
            display: block; /* Biến mỗi thẻ td thành khối để hiển thị thành cột dọc */
            padding: 10px 0;
            width: 100%; /* Đảm bảo chiếm toàn bộ chiều rộng */
        }

        .right_box label {
            font-weight: bold;
            margin-right: 10px; /* Khoảng cách giữa nhãn và nội dung */
        }

        .table-soluong {
            display: flex;
            align-items: center;
            gap: 10px;
        }


        .table-soluong td {
            margin: 0;
        }

        .table-soluong input {
            width: 50px;
            text-align: center;
            font-size: 16px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .table-soluong button {
            width: 35px;
            height: 35px;
            font-size: 18px;
            font-weight: bold;
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 50%;
            cursor: pointer;
        }

        .table-soluong button:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server">
         <ItemTemplate>
            <div class="container">
                <!-- Phần trái: Hình ảnh và nút -->
                <div class="left">
                    <asp:Image CssClass="img" ID="Image1" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                    <asp:LinkButton ID="btnThem" runat="server" CommandArgument='<%# Eval("IDDichVu") %>' OnClick="btnThem_Click">
                        <i class="fa-solid fa-check"></i> Đặt dịch vụ
                    </asp:LinkButton>
                </div>

                <!-- Phần phải: Thông tin -->
                <div class="right">
                    <div class="right_box">
                        <td>
                            <label>Tên dịch vụ:</label>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenDV") %>'></asp:Label>
                        </td>
                        <td>
                            <label>Giá:</label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Convert.ToDecimal(Eval("Gia")).ToString("N0") + " vnđ / 1 tháng" %>'></asp:Label>
                        </td>
                        <td>
                            <label>Trạng thái:</label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("TrangThai") %>'></asp:Label>
                        </td>
                        <td>
                            <label>Mô tả:</label>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                        </td>
                        <td>
                            <label>Số tháng sử dụng:</label>
                            <div class="table-soluong">
                                <asp:Button ID="btn_giam" runat="server" Text="-" OnClick="btn_giam_Click" />
                                <asp:TextBox ID="txt_soluong" runat="server" Text="1"></asp:TextBox>
                                <asp:Button ID="btn_tang" runat="server" Text="+" OnClick="btn_tang_Click" />
                            </div>
                        </td>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
