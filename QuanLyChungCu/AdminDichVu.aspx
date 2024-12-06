<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminDichVu.aspx.cs" Inherits="QuanLyChungCu.AdminDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            display: flex;
            width: 100%;
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
            width: 38%;
            padding: 20px;
            color: black;
            box-sizing: border-box;
        }

        .left_box {
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

        .right {
            width: 60%;
            padding: 20px;
            box-sizing: border-box;
        }

        .img_input{
            width:100px;
            height:100px;
        }
        .img{
            width:100px;
            height:100px;
        }

        .button {
            display: flex;
            margin: 20px 0;
            justify-content: space-between;
        }

        .button_list {
            width: 100px;
            height: 35px;
            background-color: #444444;
            color: aliceblue;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .button_list:hover {
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }

        .custom-gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 14px;
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
                <h2>ADD DỊCH VỤ</h2>
                <div class="left_box">
                    <p>ID Dịch Vụ</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txtidDV" runat="server" placeholder="Enter ID dịch vụ"></asp:TextBox>
                    </div>
                </div>
                <div class="left_box">
                    <p>Tên Dịch Vụ</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txtTenDV" runat="server" placeholder="Enter name"></asp:TextBox>
                    </div>
                </div>
                <div class="left_box">
                    <p>Giá</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txtgia" runat="server" placeholder="Enter giá"></asp:TextBox>
                    </div>
                </div>
                <div class="left_noidung">
                    <p>Mô Tả</p>
                    <div>
                        <asp:TextBox CssClass="left_noidung_textbox" ID="txtmota" runat="server" TextMode="MultiLine" MaxLength="1000" placeholder="Enter mô tả"></asp:TextBox>
                    </div>
                </div>
                <div class="left_box">
                    <p>Trạng Thái</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropTrangThai" runat="server">
                            <asp:ListItem Text="Ngừng Hoạt Động"></asp:ListItem>
                            <asp:ListItem Text="Còn Hoạt Động"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="left_box">
                    <p>Ảnh Mô Tả</p>
                    <div>
                        <asp:Image ID="img" CssClass="img_input" runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
                <div class="button">
                    <asp:Button CssClass="button_list" ID="btnthem" runat="server" Text="Create" OnClick="btnthem_Click" />
                    <asp:Button CssClass="button_list" ID="btnsua" runat="server" Text="Update" OnClick="btnsua_Click" />
                    <asp:Button CssClass="button_list" ID="btnxoa" runat="server" Text="Delete" OnClick="btnxoa_Click" />
                    <asp:Button CssClass="button_list" ID="btnclear" runat="server" Text="ClearForm" OnClick="btnclear_Click" />
                </div>
            </div>
        </div>
        <div class="right">
            <h2>Danh Sách Dịch Vụ</h2>
            <asp:GridView CssClass="custom-gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="user-btn" ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-bell-concierge"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDDichVu" HeaderText="ID Dịch Vụ" />
                    <asp:BoundField DataField="TenDV" HeaderText="Tên Dịch Vụ"  HtmlEncode="false" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô Tả"  HtmlEncode="false" />
                    <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0} vnđ" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" HtmlEncode="false" />
                    <asp:TemplateField HeaderText="Ảnh Mô Tả">
                        <ItemTemplate>
                            <asp:Image ID="Image2" CssClass="img" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
