<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCChiTietDichVu.aspx.cs" Inherits="QuanLyChungCu.CCChiTietDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .box {
            display: flex;
            justify-content: center;
        }
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

        .left_image {
            display: flex;
            justify-content: center;
        }

        .left .img {
            display: flex;
            width: 400px; /* Đảm bảo ảnh chiếm toàn bộ chiều rộng của container */
            height: 300px; /* Giữ tỷ lệ ảnh */
            border-radius: 10px; /* Bo góc ảnh */
            margin-bottom: 10px;
            align-items: center;
            justify-content: center;
        }

        .left button, 
        .left a {
            display: inline-block;
            background-color: #444444;
            color: aliceblue;
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
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }

        /* Phần phải (thông tin dịch vụ) */
        .right {
            width: 55%;
            gap: 15px;
            font-size: 16px;
            color: #333;
        }

        .right_box {
            display: flex;
            flex-direction: column;
        }

        .right_box .label {
            font-weight: bold;
            margin: 20px 0;
        }

        .table-soluong {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 15px 0;
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
    <asp:DataList CssClass="box" ID="DataList1" runat="server">
         <ItemTemplate>
            <div class="container">
                <!-- Phần trái: Hình ảnh và nút -->
                <div class="left">
                    <div class="left_image">
                        <asp:Image CssClass="img" ID="Image1" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                    </div>
                    <asp:LinkButton ID="btnThem" runat="server" CommandArgument='<%# Eval("IDDichVu") %>' OnClick="btnThem_Click">
                        <i class="fa-solid fa-check"></i> Đặt dịch vụ
                    </asp:LinkButton>
                </div>

                <!-- Phần phải: Thông tin -->
                <div class="right">
                    <div class="right_box">
                        <div class="label">
                            <label>Tên dịch vụ:</label>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenDV") %>'></asp:Label>
                        </div>
                        <div class="label">
                            <label>Giá:</label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Convert.ToDecimal(Eval("Gia")).ToString("N0") + " vnđ / 1 tháng" %>'></asp:Label>
                        </div>
                        <div class="label">
                            <label>Trạng thái:</label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("TrangThai") %>'></asp:Label>
                        </div>
                        <div class="label">
                            <label>Mô tả:</label>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                        </div>
                        <div class="label">
                            <label>Số tháng sử dụng:</label>
                            <div class="table-soluong">
                                <asp:Button ID="btn_giam" runat="server" Text="-" OnClick="btn_giam_Click" />
                                <asp:TextBox ID="txt_soluong" runat="server" Text="1"></asp:TextBox>
                                <asp:Button ID="btn_tang" runat="server" Text="+" OnClick="btn_tang_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
