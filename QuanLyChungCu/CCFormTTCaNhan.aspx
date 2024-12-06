<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormTTCaNhan.aspx.cs" Inherits="QuanLyChungCu.CCFormTTCaNhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .box_container {
            margin: 0;
            padding: 0;
            width: 80%;
            height: auto;
            display: flex;
            justify-content: center;
        }

        .left {
            width: 30%;
            height: auto;
            margin: 30px 20px;
        }

        .left .left_button {
            display: flex;
            gap: 10px;
            margin: 20px 0;
        }

        .left .left_button i {
            width: 50px;
            height: 50px;
            font-size: 25px;
            border: 1px solid black;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left .left_button_text {
            font-size: 20px;
            color: black;
            text-decoration: none;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .left .left_button_text:hover {
            color: orange;
        }

        .divider {
            margin: 0;
            border: 0;
            border-top: 1px solid #ddd;
            width: 400px;
        }

        .right {
            width: 65%;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h3 {
            font-size: 28px;
            text-align: center;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .right_info {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 10px 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        .right_info:last-child {
            border-bottom: none;
        }

        .right_info p {
            flex-basis: 150px;
            font-size: 18px;
            color: #555;
            margin: 0;
            font-weight: bold;
        }

        .right_info_user {
            flex-grow: 1;
            margin-left: 100px;
            font-size: 16px;
            color: #333;
        }

        .right_info_user input, 
        .right_info_user textarea {
            width: 100%;
            padding: 8px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .right_info_user input:focus,
        .right_info_user textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .validation {
            font-size: 12px;
            color: #e74c3c;
            margin-top: 5px;
            display: block;
        }

        .right_info_user textarea {
            height: 80px;
            resize: none;
        }

        .right_info_user .asp-textbox {
            display: block;
        }

        .right_info_user label {
            display: block;
            font-weight: bold;
            color: #333;
        }

        .button {
            text-align: center;
            margin-top: 10px;
            margin-left: 170px;
        }

        .button .buttonUpdate {
            background-color: black;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
        }

        .button .buttonUpdate:hover {
            background-color: gainsboro;
            color: black;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
            transform: scale(1.02); /* Tăng kích thước nhẹ khi hover */
        }

        .tableinfo {
            width: 100%;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #f8f9fa; /* Màu nền nhẹ */
            border-radius: 8px;
        }

        .tableinfo h3 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #2c3e50; 
            font-weight: bold;
        }

        .tableinfo .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .tableinfo .gridview th,
        .tableinfo .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 16px;
        }

        .tableinfo .gridview th {
            color: black;
            text-transform: uppercase;
            font-weight: bold;
        }

        .tableinfo .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .tableinfo .gridview tr:hover {
            background-color: #d1ecf1;
            transition: background-color 0.3s ease;
        }

        .tableinfo .gridview td {
            color: #333;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_container">
        <div class="left">
            <div class="left_button">
                <i class="fa-solid fa-bell-concierge"></i>
                <asp:LinkButton CssClass="left_button_text" ID="hddichvu" runat="server" OnClick="hddichvu_Click"> Hóa đơn dịch vụ</asp:LinkButton>
            </div>
            <hr class="divider">
            <div class="left_button">
                <i class="fa-solid fa-receipt"></i>
                <asp:LinkButton CssClass="left_button_text" ID="hddiennuoc" runat="server" OnClick="hddiennuoc_Click"> Hóa đơn điện nước</asp:LinkButton>
            </div>
            <hr class="divider">
            <div class="left_button">
                <i class="fa-solid fa-bell"></i>
                <asp:LinkButton CssClass="left_button_text" ID="thongbao" runat="server" OnClick="thongbao_Click">Thông báo</asp:LinkButton>
            </div>
            <hr class="divider">
            <div class="left_button">
                <i class="fa-solid fa-pen-to-square"></i>
                <asp:LinkButton CssClass="left_button_text" ID="phanhoi" runat="server" OnClick="phanhoi_Click">Phản hồi</asp:LinkButton>
            </div>
            <hr class="divider">
            <div class="left_button">
                <i class="fa-solid fa-lock"></i>
                <asp:LinkButton CssClass="left_button_text" ID="doimatkhau" runat="server" OnClick="doimatkhau_Click"> Đổi mật khẩu</asp:LinkButton>
            </div>
            <hr class="divider">
        </div>
        <div class="right">
            <div class="right_table">
                <h3>THÔNG TIN CHỦ HỘ</h3>
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <table style="width:100%;">
                            <div class="right_info">
                                <p>ID Hộ Gia Đình</p>
                                <div class="right_info_user">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("IDHoGD") %>'></asp:Label>
                                </div>  
                            </div>
                            <div class="right_info">
                                <p>Tên Chủ Hộ</p>
                                <div class="right_info_user">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("TenChuHo") %>'></asp:Label>
                                </div>  
                            </div>
                            <div class="right_info">
                                <p>Ngày Sinh</p>
                                <div class="right_info_user">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NgaySinh") %>'></asp:Label></td>
                                </div>  
                            </div>
                            <div class="right_info">
                                <p>Địa Chỉ</p>
                                <div class="right_info_user">
                                    <asp:TextBox ID="txt_diachi" runat="server" TextMode="MultiLine" Text='<%# Eval("DiaChi") %>'></asp:TextBox></td>
                                </div>  
                            </div>
                            <div class="right_info">
                                <p>Email</p>
                                <div class="right_info_user">
                                    <asp:TextBox ID="txt_email" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="validation" Display="Dynamic" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-z0-9]+@gmail\.com$" ErrorMessage="Email không hợp lệ" ToolTip="Email không hợp lệ">*</asp:RegularExpressionValidator>
                                </div>  
                            </div>
                            <div class="right_info">
                                <p>Số Điện Thoại</p>
                                <div class="right_info_user">
                                    <asp:TextBox ID="txt_sdt" runat="server" Text='<%# Eval("SDT") %>'></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validation" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*</asp:RegularExpressionValidator>
                                </div>  
                            </div>
                            <div class="right_info">
                                <p>Căn cước công dân</p>
                                <div class="right_info_user">
                                    <asp:TextBox ID="txtcancuoc" runat="server" Text='<%# Eval("CCCD") %>'></asp:TextBox>
                                </div>  
                            </div>
                            <div class="right_info">
                                <div class="button">
                                    <asp:Button CssClass="buttonUpdate" ID="btncapnhat" runat="server" CommandArgument='<%# Eval("IDHoGD") %>' Text="Cập nhật thông tin" OnClick="btncapnhat_Click" />
                                </div>
                            </div>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="tableinfo">
                <h3>Thông tin thành viên gia đình</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="IDThanhVien" HeaderText="ID Thành Viên" />
                        <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ" />
                        <asp:BoundField DataField="HoTen" HeaderText="Họ và Tên" />
                        <asp:BoundField DataField="NgSinh" HeaderText="Ngày Sinh" />
                        <asp:BoundField DataField="MoiQuanHe" HeaderText="Mối Quan Hệ" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
