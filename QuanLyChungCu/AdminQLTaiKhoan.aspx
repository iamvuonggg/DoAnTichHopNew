<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminQLTaiKhoan.aspx.cs" Inherits="QuanLyChungCu.AdminQLTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            display: flex;
            width: 95%;
            max-width: 1300px;
            justify-content: space-between;
            align-items: flex-start;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            margin: 20px auto;
        }

        .left {
            width: 40%;
            padding: 20px;
            color: black;
            box-sizing: border-box;
        }

        .right {
            width: 55%;
            padding: 20px;
            box-sizing: border-box;
        }

        .left .box {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .left_textbox {
            width: 280px;
            height: 25px;
            outline: none;
        }

        .left p {
            font-weight: bold;
        }

        .button {
            display: flex;
            margin: 20px 0;
            justify-content: space-between;
        }

        .button_info {
            padding: 10px 20px;
            background-color: #444444;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .button_info:hover {
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }

       .right_find_textbox {
           width: 250px;
           height: 30px;
           outline: none;
           font-size: 16px;
           border-radius: 8px;
       }

       h3 {
           margin: 20px 0;
       }

       .right_find_button {
            width: 70px;
            height: 34px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
       }

       .right_find_button:hover {
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
       }

       .custom-gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
            font-family: Arial, sans-serif;
            background-color: black;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Tạo bóng */
            overflow: hidden; /* Bo viền và nội dung */
        }

        /* Phong cách cho hàng tiêu đề */
        .custom-gridview th {
            background-color: #444444; /* Màu nền tiêu đề */
            color: white; /* Màu chữ */
            text-align: left; /* Căn chữ sang trái */
            padding: 12px; /* Khoảng cách bên trong ô */
            font-weight: bold;
        }

        /* Phong cách cho các hàng */
        .custom-gridview td {
            padding: 12px; /* Khoảng cách bên trong ô */
            text-align: left; /* Căn chữ sang trái */
            color: #333; /* Màu chữ chính */
        }

        /* Phân biệt màu nền từng hàng */
        .custom-gridview tr:nth-child(even) {
            background-color: #f2f2f2; /* Màu nền hàng chẵn */
        }

        .custom-gridview tr:nth-child(odd) {
            background-color: #ffffff; /* Màu nền hàng lẻ */
        }

        /* Hiệu ứng hover */
        .custom-gridview tr:hover {
            background-color: #e0f7fa; /* Đổi màu khi hover */
            cursor: pointer; /* Con trỏ chỉ tay */
        }

        .user-btn {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="left">
            <div style="width: 100%;">
                <div>
                    <div colspan="2">
                        <marquee behavior="scroll" direction="left">Vui lòng nhập thông tin hộ gia đình trước để lấy ID hộ để cấp tài khoản</marquee>
                    </div>
                </div>
                <div class="box">
                    <p>Nhập tên tài khoản</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_tenDN" placeholder="Enter name" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="box">
                    <p>Mật khẩu</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_Pass" placeholder="Enter password" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="box">
                    <p>Quyền người dùng</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropQuyen" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="box">
                    <p>ID Chủ Hộ</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropIDHoGD" runat="server"></asp:DropDownList></div>
                </div>
                <div class="box">
                    <p>Trạng thái tài khoản</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropTrangThai" runat="server">
                            <asp:ListItem Text="Hoạt động"></asp:ListItem>
                            <asp:ListItem Text="Khóa"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
            <div class="button">
                <asp:Button CssClass="button_info" ID="btn_Tao" runat="server" Text="Create" OnClick="btn_Tao_Click"/>
                <asp:Button CssClass="button_info" ID="btn_Sua" runat="server" Text="Update" OnClick="btn_Sua_Click"/>
                <asp:Button CssClass="button_info" ID="btn_Xoa" runat="server" Text="Delete" OnClick="btn_Xoa_Click"/>
                <asp:Button CssClass="button_info" ID="btn_clear" runat="server" Text="ClearForm" OnClick="btn_clear_Click"/>
            </div>
        </div>
        <div class="right">
            <div class="right_find">
                <asp:TextBox CssClass="right_find_textbox" ID="txt_timkiem" placeholder="Search" runat="server"></asp:TextBox>
                <asp:Button CssClass="right_find_button" ID="btn_timkiem" runat="server" Text="Tìm kiếm" OnClick="btn_timkiem_Click" />
                <asp:Button CssClass="right_find_button" ID="btn_lammoi" runat="server" Text="Refresh" OnClick="btn_lammoi_Click"/>
            </div>
            <h3>Danh Sách Tài Khoản</h3>
            <asp:GridView CssClass="custom-gridview" ID="GridTaiKhoan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridTaiKhoan_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-user-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenDangNhap" HeaderText="Tên tài khoản" />
                    <asp:BoundField DataField="IDQuyen" HeaderText="ID Quyền"/>
                    <asp:BoundField DataField="TenQuyen" HeaderText="Tên quyền" HtmlEncode="false" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ Gia Đình" HtmlEncode="false" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Chủ Hộ" HtmlEncode="false" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" HtmlEncode="false" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
