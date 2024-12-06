<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminHoaDon.aspx.cs" Inherits="QuanLyChungCu.AdminHoaDon" %>

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
            width:48%;
            padding: 10px 20px;
        }
        .right{
            width:48%;
            padding: 10px 20px;
        }

        .left_box {
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

        .right_box {
            margin: 20px 0;
            display: flex;
            justify-content: space-between;
        }

        .right_textbox {
            width: 300px;
            height: 25px;
            outline: none;
        }

        .right p {
            font-weight: bold;
        }

        .hinh-bill{
            width:80px;
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

        h2 {
            margin: 20px 0;
        }

        .custom-gridview {
            width: 80%;
            font-size: 14px;
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
                <div class="left_input">
                    <h2>HÓA ĐƠN DỊCH VỤ</h2>
                    <div class="left_box">
                        <p>ID Hóa Đơn</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txt_idhoadon" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Tên Chủ Hộ</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txt_tenchuho" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Tên Dịch Vụ</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txt_tendv" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Giá</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txt_gia" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Ngày Lập</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txtngaylap" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Số Tháng Sử Dụng</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txt_sothang" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Tổng Tiền</p>
                        <div>
                            <asp:TextBox CssClass="left_textbox" ID="txt_tongtien" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="left_box">
                        <p>Trạng Thái</p>
                        <div>
                            <asp:DropDownList CssClass="left_textbox" ID="DropTrangThai" runat="server">
                                <asp:ListItem Text="Chờ xác nhận"></asp:ListItem>
                                <asp:ListItem Text="Đã thanh toán"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <div align="center">
                            <asp:Button CssClass="button_list" ID="btntrangthai" runat="server" Text="Update" OnClick="btntrangthai_Click" />
                        </div>
                    </div>
                </div>
            <div class="left_output">
                <h2>Danh Sách Hóa Đơn Dịch Vụ</h2>
                <asp:GridView CssClass="custom-gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton CssClass="user-btn" ID="SelectLink" runat="server" CommandName="Select"><i class="fa-solid fa-bell-concierge"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDHoaDon" HeaderText="ID" />
                        <asp:BoundField DataField="TenCHuHo" HeaderText="Hộ" />
                        <asp:BoundField DataField="TenDV" HeaderText="Dịch Vụ" />
                        <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="NgLapHD" HeaderText="Ngày Lập" />
                        <asp:BoundField DataField="SoThangSD" HeaderText="Số Tháng Sử Dụng" />
                        <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0} vnđ" />
                        <asp:TemplateField HeaderText="Bill">
                            <ItemTemplate>
                                <asp:ImageButton CssClass="hinh-bill" ID="btn_bill" runat="server" CommandArgument='<%# Eval("IDHoaDon") %>' ImageUrl='<%# "images/"+Eval("HinhAnh") %>' OnClick="btn_bill_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" />
                    </Columns>
                </asp:GridView>
            </div>
            </div>
        <div class="right">
            <div class="right_input">
                    <h2>HÓA ĐƠN ĐIỆN NƯỚC</h2>
                    <div class="right_box">
                        <p>ID Hóa Đơn</p>
                        <div>
                            <asp:TextBox CssClass="right_textbox" ID="txt_idhoadonDN" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Hộ Gia Đình</p>
                        <div>
                            <asp:DropDownList CssClass="right_textbox" ID="DropHoGD" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Ngày Lập</p>
                        <div>
                            <asp:TextBox CssClass="right_textbox" ID="txtngaylapHD" placeholder="Được lấy tự động" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Số Tiêu Thụ</p>
                        <div>
                            <asp:TextBox CssClass="right_textbox" ID="txtsotieuthu" placeholder="Số điện / nước tiêu thụ" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Giá Tiêu Thụ</p>
                        <div>
                            <asp:TextBox CssClass="right_textbox" ID="txt_giatieuthu" placeholder="Giá tiêu thụ / 1 chữ" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Tổng Tiền</p>
                        <div>
                            <asp:TextBox CssClass="right_textbox" ID="txt_tongtienDN" placeholder="Số tiêu thụ * Giá tiêu thụ" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Loại Hóa Đơn</p>
                        <div>
                            <asp:DropDownList CssClass="right_textbox" ID="DropLoaiHD" runat="server">
                                <asp:ListItem Text="Hóa Đơn Điện"></asp:ListItem>
                                <asp:ListItem Text="Hóa Đơn Nước"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="right_box">
                        <p>Tình Trạng</p>
                        <div>
                            <asp:DropDownList CssClass="right_textbox" ID="DropTinhTrang" runat="server">
                                <asp:ListItem Text="Chưa Thanh Toán"></asp:ListItem>
                                <asp:ListItem Text="Chờ xác nhận"></asp:ListItem>
                                <asp:ListItem Text="Đã Thanh Toán"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <div class="button">
                            <asp:Button CssClass="button_list" ID="btnthem" runat="server" Text="Create" OnClick="btnthem_Click" />
                            <asp:Button CssClass="button_list" ID="btnsua" runat="server" Text="Update" OnClick="btnsua_Click" />
                            <asp:Button CssClass="button_list" ID="btnuptrangthai" runat="server" Text="Update State" OnClick="btnuptrangthai_Click" />
                            <asp:Button CssClass="button_list" ID="btnxoa" runat="server" Text="Delete" OnClick="btnxoa_Click" />
                            <asp:Button CssClass="button_list" ID="btnClearForm" runat="server" Text="ClearForm" OnClick="btnClearForm_Click" />
                        </div>
                    </div>
            </div>
            <div class="form-griddiennuoc">
                <h2>Danh Sách Hóa Đơn Điện Nước</h2>
                <asp:GridView CssClass="custom-gridview" ID="GridView2" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton CssClass="user-btn" ID="SelectLink" runat="server" CommandName="Select"><i class="fa-solid fa-receipt"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="Mã" />
                    <asp:BoundField DataField="LoaiHD" HeaderText="Hóa Đơn" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Chủ Hộ" />
                    <asp:BoundField DataField="TieuThu" HeaderText="Tiêu Thụ" />
                    <asp:BoundField DataField="GiaTieuThu" HeaderText="Giá"  />
                    <asp:BoundField DataField="NgLap" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0}" />
                    <asp:BoundField DataField="TinhTrang" HeaderText="Tình Trạng" />
                    <asp:TemplateField HeaderText="Bill">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="hinh-bill" ID="btn_billDN" runat="server" CommandArgument='<%# Eval("IDHoaDon") %>' ImageUrl='<%# "images/"+Eval("HinhAnh") %>' OnClick="btn_billDN_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
