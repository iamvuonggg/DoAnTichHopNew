<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminCanHo.aspx.cs" Inherits="QuanLyChungCu.AdminCanHo" %>

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

        .left p {
            font-weight: bold;
        }

        .button {
            display: flex;
            margin: 20px 0;
            justify-content: space-between;
        }

        .button_groupbutton {
            width: 85px;
            height: 30px;
            background-color: #444444;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .button_groupbutton:hover {
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }

        .list_button {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .list_button .list_button_house {
            width: 150px;
            height: 30px;
            background-color: #444444;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .list_button_house:hover {
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }
        .img{
            width:60px;
            height:70px;
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
                <h2>CĂN HỘ</h2>
                <div class="box">
                    <p>ID Căn Hộ</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_idcanho" runat="server"></asp:TextBox>
                    </div>                   
                </div>
                <div class="box">
                    <p>Số Căn Hộ</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_socanho" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="box">
                    <p>Chủ Căn Hộ</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropChuHo" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="box">
                    <p>Giá Căn Hộ</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_gia" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="box">
                    <p>Tầng</p>
                    <div>
                        <asp:DropDownList CssClass="left_textbox" ID="DropTang" runat="server">
                            <asp:ListItem Text="Tầng 1"></asp:ListItem>
                            <asp:ListItem Text="Tầng 2"></asp:ListItem>
                            <asp:ListItem Text="Tầng 3"></asp:ListItem>
                            <asp:ListItem Text="Tầng 4"></asp:ListItem>
                            <asp:ListItem Text="Tầng 5"></asp:ListItem>
                            <asp:ListItem Text="Tầng 6"></asp:ListItem>
                            <asp:ListItem Text="Tầng 7"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="box">
                    <p>Số Lượng Phòng</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_slphong" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="left_noidung">
                    <p>Mô Tả</p>
                    <div>
                        <asp:TextBox CssClass="left_noidung_textbox" ID="txt_Mota" runat="server" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                    </div>
                </div>
                <div style="display: flex; justify-content: space-between;">
                    <p>Ảnh Mô Tả</p>
                    <div>
                        <asp:Image ID="img" runat="server" Width="100px" Height="100px" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
                <div class="box">
                    <p>Trạng Thái</p>
                    <div>
                        <asp:TextBox CssClass="left_textbox" ID="txt_trangthai" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div>
                    <div class="button">
                        <asp:Button CssClass="button_groupbutton" ID="btn_them" runat="server" Text="Create" OnClick="btn_them_Click" />
                        <asp:Button CssClass="button_groupbutton" ID="btn_capnhat" runat="server" Text="Update" OnClick="btn_capnhat_Click" />
                        <asp:Button CssClass="button_groupbutton" ID="btn_xoa" runat="server" Text="Delete" OnClick="btn_xoa_Click" />
                        <asp:Button CssClass="button_groupbutton" ID="btn_xoaForm" runat="server" Text="ClearFrom" OnClick="btn_xoaForm_Click" />
                        <asp:Button CssClass="button_groupbutton" ID="btn_AddIMG" runat="server" Text="Add List IMG" OnClick="btn_AddIMG_Click" />
                    </div>
                </div>
                <div>
                    <div class="list_button">
                        <asp:Button CssClass="list_button_house" ID="btn_UpChuHo" runat="server" Text="Update HouseHolder" OnClick="btn_UpChuHo_Click" />
                        <asp:Button CssClass="list_button_house" ID="btn_DelChuHo" runat="server" Text="Delete HouseHolder" OnClick="btn_DelChuHo_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="right">
            <h3>Danh Sách Tất Cả Căn Hộ</h3>
            <asp:GridView CssClass="custom-gridview" ID="GridCanHo" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridCanHo_SelectedIndexChanged" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton CssClass="user-btn" ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-house"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDCanHo" HeaderText="ID Căn Hộ" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Chủ Hộ"/>
                    <asp:BoundField DataField="SoCanHo" HeaderText="Số Căn Hộ"/>
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Hộ" HtmlEncode="false" />
                    <asp:BoundField DataField="Gia" HeaderText="Giá" HtmlEncode="false" />
                    <asp:BoundField DataField="SoTang" HeaderText="Tầng" HtmlEncode="false" />
                    <asp:BoundField DataField="SLPhong" HeaderText="SL Phòng" HtmlEncode="false" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" HtmlEncode="false" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" HtmlEncode="false" />
                    <asp:TemplateField HeaderText="Ảnh Mô Tả">
                        <ItemTemplate>
                            <asp:Image ID="Image1" CssClass="img" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
