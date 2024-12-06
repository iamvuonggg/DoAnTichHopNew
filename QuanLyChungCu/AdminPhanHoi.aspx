<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminPhanHoi.aspx.cs" Inherits="QuanLyChungCu.AdminPhanHoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            display: flex;
            width: 100%;
            max-width: 1500px;
            justify-content: space-between;
            align-items: flex-start;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            margin: 20px auto;
        }
        .left{
            width:35%;
            padding: 10px 20px;
        }
        .right{
            width:60%;
            padding: 10px 20px;
        }

        .left_box {
            margin: 20px 0;
            display: flex;
            justify-content: space-between;
        }

        .left_text {
            margin: 20px 0;
            display: flex;
            justify-content: space-between;
        }

        .left_textbox {
            width: 300px;
            height: 25px;
            outline: none;
        }

        .left p {
            font-weight: bold;
        }
        
        h3 {
            align-items: center;
            text-align: center;
        }

        .left_box_noidung {
            width: 370px;
            height: 200px;
            overflow: auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #f9f9f9;
            resize: none;
            overflow-y: auto; /* Hiển thị thanh cuộn dọc nếu nội dung vượt quá */
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .left_box_noidung:focus {
            border-color: #808080;
            outline: none;
            background-color: #fff;
        }

        .button {
            display: flex;
            margin: 20px 0;
            align-items: center;
        }

        .button_list {
            width: 100px;
            height: 35px;
            margin: 0 30px;
            background-color: #444444;
            color: aliceblue;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            align-items: center;
        }

        .button_list:hover {
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }

        .custom-gridview {
            width: 90%;
            font-size: 16px;
            border-collapse: collapse;
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
                <h2>PHẢN HỒI</h2>
                <div class="left_box">
                    <p>ID Phản Hồi</p>
                    <div>
                        <asp:Label ID="lb_idphanhoi" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="left_box">
                    <p>ID Chủ Hộ Dia Đình</p>
                    <div>
                        <asp:Label ID="lb_idhogd" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="left_box">
                    <p>Tên Chủ Hộ</p>
                    <div>
                        <asp:Label ID="lb_tenchuho" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="left_text">
                    <p>Nội Dung</p>
                    <div>
                        <asp:TextBox CssClass="left_box_noidung" ID="txt_noidung" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="left_box">
                    <p>Ngày Phản Hồi</p>
                    <div>
                        <asp:Label ID="lb_ngayphanhoi" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="left_box">
                    <p>Ngày Trả Lời</p>
                    <div>
                        <asp:Label ID="lb_ngaytraloi" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <h3>Trả lời</h3>
                <div>
                    <div align="center">
                        <asp:TextBox CssClass="left_box_noidung" ID="txttraloi" runat="server" TextMode="MultiLine" ></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="button">
                 <asp:Button CssClass="button_list" ID="btn_traloi" runat="server" Text="Send Reply" OnClick="btn_traloi_Click" />
                 <asp:Button CssClass="button_list" ID="btn_xoa" runat="server" Text="Delete" OnClick="btn_xoa_Click" />
                 <asp:Button CssClass="button_list" ID="btn_clearForm" runat="server" Text="ClearForm" OnClick="btn_clearForm_Click" />
            </div>
        </div>
        <div class="right">
            <h2 style="text-align:center;margin: 20px 0;">Danh Sách Phản Hồi</h2>
            <asp:GridView CssClass="custom-gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="user-btn" ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDPhanHoi" HeaderText="ID Phản Hồi" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ Gia Đình" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Phản Hồi" HtmlEncode="false" />
                    <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung"  HtmlEncode="false" />
                    <asp:BoundField DataField="NgPhanHoi" HeaderText="Ngày Phản Hồi" />
                    <asp:BoundField DataField="TraLoi" HeaderText="Trả Lời"  HtmlEncode="false" />
                    <asp:BoundField DataField="NgTraLoi" HeaderText="Ngày Trả Lời" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
