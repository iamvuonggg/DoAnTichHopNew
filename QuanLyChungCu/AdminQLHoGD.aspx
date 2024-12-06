<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminQLHoGD.aspx.cs" Inherits="QuanLyChungCu.AdminQLHoGD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            display: flex;
            width: 95%;
            max-width: 1400px;
            justify-content: space-between;
            align-items: flex-start;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            margin: 20px auto;
        }

        .left {
            width: 35%;
            padding: 20px;
            color: black;
            box-sizing: border-box;
        }

        .right {
            width: 60%;
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

        .left_noidung {
            display: flex;
            justify-content: space-between;
        }

        .left_noidung_textbox {
            width: 200px;
            height: 100px;
            outline: none;
            resize: none; /* Ngăn kéo giãn kích thước */
            overflow: auto; /* Thêm thanh cuộn nếu nội dung vượt quá kích thước */
        }

        .left_button {
            display: flex;
            flex-wrap: wrap; /* Cho phép các nút xuống dòng khi không đủ không gian */
            gap: 20px; /* Khoảng cách giữa các nút */
            justify-content: space-between; /* Căn đều các nút trên mỗi dòng */
        }

        .button_style {
            width: calc(50% - 10px); /* Mỗi nút chiếm 50% trừ khoảng cách */
            padding: 10px 20px;
            background-color: #444444;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .button_style:hover {
            background-color: darkgrey;
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
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
                <div class="box">
                    <p>ID Hộ</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropIDHo" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="box">
                    <p>Tên Chủ Hộ</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_tenchu" placeholder="Enter name" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="box">
                    <p>Ngày sinh</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_ngaysinh" placeholder="dd/MM/YYYY" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="left_noidung">
                    <p>Địa Chỉ</p>
                    <div>
                        <asp:TextBox CssClass="left_noidung_textbox" ID="txt_diachi" placeholder="Enter address" runat="server" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="box">
                    <p>Email</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_email" runat="server" placeholder="Enter mail Ex:Example@gmail.com" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="update"  Display="Dynamic" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-z0-9]+@gmail\.com$" ErrorMessage="Email không hợp lệ" ToolTip="Email không hợp lệ">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="box">
                    <p>Số Điện Thoại</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_sdt" runat="server" placeholder="Enter phone number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="update"  runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*</asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="box">
                    <p>Căn Cước Công Dân</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_Cancuoc" runat="server" placeholder="Enter ID Card" ></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="left_button">
                <asp:Button ID="btn_Tao" CssClass="button_style" runat="server" Text="Update HouseHolder Members" OnClick="btn_Tao_Click" />
                <asp:Button ID="btn_Sua" CssClass="button_style" runat="server" Text="Add HouseHolder" OnClick="btn_Sua_Click" ValidationGroup="update" />
                <asp:Button ID="btn_Xoa" CssClass="button_style" runat="server" Text="Delete HouseHolder" OnClick="btn_Xoa_Click" />
                <asp:Button ID="btn_clear" CssClass="button_style" runat="server" Text="ClearForm" OnClick="btn_clear_Click" />
            </div>
        </div>
        <div class="right">
            <div class="right_find">
                <asp:TextBox CssClass="right_find_textbox" ID="txt_timkiem" placeholder="Enter HDG..." runat="server"></asp:TextBox>
                <asp:Button CssClass="right_find_button" ID="btn_timkiem" runat="server" Text="Tìm kiếm" OnClick="btn_timkiem_Click" />
                <asp:Button CssClass="right_find_button" ID="btn_lammoi" runat="server" Text="Refresh" OnClick="btn_lammoi_Click" />
            </div>
            <h3>Danh Sách Hộ Gia Đình</h3>
            <asp:GridView CssClass="custom-gridview" ID="GridTaiKhoan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridTaiKhoan_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-person"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Hộ" HtmlEncode="false" />
                    <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" HtmlEncode="false" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="SDT" HeaderText="Số Điện Thoại" />
                    <asp:BoundField DataField="CCCD" HeaderText="Căn Cước Công Dân" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
