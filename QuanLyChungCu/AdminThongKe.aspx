<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminThongKe.aspx.cs" Inherits="QuanLyChungCu.AdminThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            width:32%;
            padding: 10px 20px;
        }

        .center {
            width:32%;
            padding: 10px 20px;
        }

        .custom_gridview {
            width: 90%;
            font-size: 16px;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Tạo bóng */
            overflow: hidden; /* Bo viền và nội dung */
        }

        .custom_gridview th {
            background-color: #444444; /* Màu nền tiêu đề */
            color: white; /* Màu chữ */
            text-align: left; /* Căn chữ sang trái */
            padding: 12px; /* Khoảng cách bên trong ô */
            font-weight: bold;
        }

        /* Phong cách cho các hàng */
        .custom_gridview td {
            padding: 12px; /* Khoảng cách bên trong ô */
            text-align: left; /* Căn chữ sang trái */
            color: #333; /* Màu chữ chính */
        }

        .custom_gridview tr:hover {
            background-color: #e0f7fa; /* Đổi màu khi hover */
            cursor: pointer; /* Con trỏ chỉ tay */
        }

        .left_thongke_listbutton {
            gap: 20px;
            margin: 20px 0;
        }

        .left_thongke_listbutton .textbox {
            width: 350px;
            height: 25px;
            outline: none;
            font-family: 'Times New Roman', Times, serif;
        }

        .left_thongke_listbutton .listbtn {
            display: flex;
            margin: 20px 0;
            gap: 20px;
        }

        .listbtnclick {
            width: 140px;
            height: 30px;
            background-color: #444444;
            color: aliceblue;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            align-items: center;
        }

        .listbtnclick:hover {
            background-color: darkgrey; /* Đổi màu nền khi hover */
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Tăng bóng khi hover */
            transform: translateY(-2px); /* Nút nổi lên khi hover */
        }

        .right{
            width:32%;
            padding: 10px 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="left">
            <h3>Hóa Đơn Dịch Vụ</h3>
            <asp:GridView CssClass="custom_gridview" ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="ID Hóa Đơn" />
                    <asp:BoundField DataField="NgLapHD" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0}" />
                </Columns>
            </asp:GridView>
            <div class="left_thongke">
                <div class="left_thongke_listbutton">
                    <asp:TextBox CssClass="textbox" ID="txt_thongke" runat="server" placeholder="Nhập tháng hoặc năm cần thống kê"></asp:TextBox>
                    <div class="listbtn">
                        <asp:Button CssClass="listbtnclick" ID="btn_thongke" runat="server" Text="Thống Kê" OnClick="btn_thongke_Click" />
                        <asp:Button CssClass="listbtnclick" ID="btn_tongdoanhthu" runat="server" Text="Tổng Doanh Thu" OnClick="btn_tongdoanhthu_Click" />
                    </div>
                </div>
                <div class="left_thongke_listlabel">
                    <div>Doanh thu theo tháng: <asp:Label ID="lb_thongkeThang" runat="server" Text=""></asp:Label></div>
                    <div>Doanh thu theo năm: <asp:Label ID="lb_thongkeNam" runat="server" Text=""></asp:Label></div>
                    <div>Tổng Doanh Thu: <asp:Label ID="lb_tongdoanhThu" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>

        <div class="center">
            <h3>Danh Sách Hóa Đơn Điện Nước</h3>
            <asp:GridView CssClass="custom_gridview" ID="GridView2" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="ID Hóa Đơn" />
                    <asp:BoundField DataField="NgLap" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0}" />
                </Columns>
            </asp:GridView>
            <div class="thongke-diennuoc">
                <div class="left_thongke_listbutton">
                    <asp:TextBox CssClass="textbox" ID="txt_tkDN" runat="server" placeholder="Nhập tháng hoặc năm cần thống kê"></asp:TextBox>
                    <div class="listbtn">
                        <asp:Button CssClass="listbtnclick" ID="btn_tkDN" runat="server" Text="Thống Kê" OnClick="btn_tkDN_Click" />
                        <asp:Button CssClass="listbtnclick" ID="btn_tkTDT" runat="server" Text="Tổng Doanh Thu" OnClick="btn_tkTDT_Click" />
                    </div>
                </div>
                <div>
                    <div>Doanh thu theo tháng: <asp:Label ID="lb_dtThang" runat="server" Text=""></asp:Label></div>
                    <div>Doanh thu theo năm: <asp:Label ID="lb_dtNam" runat="server" Text=""></asp:Label></div>
                    <div>Tổng Doanh Thu: <asp:Label ID="lb_tongDT" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>

        <div class="right">
            <h3>Tổng Doanh Thu</h3>
            <div>
                <asp:TextBox ID="txttongdoanhthu" runat="server" Enabled="false" ReadOnly="true"></asp:TextBox>
            </div>
            <div>
                <div class="left_thongke_listbutton">
                    <asp:TextBox CssClass="textbox" ID="TextBox1" runat="server" placeholder="Nhập tháng hoặc năm cần thống kê"></asp:TextBox>
                    <div class="listbtn">
                        <asp:Button CssClass="listbtnclick" ID="btn_tkTong" runat="server" Text="Thống Kê" OnClick="btn_tkTong_Click" />
                        <asp:Button CssClass="listbtnclick" ID="btntong" runat="server" Text="Load" OnClick="btntong_Click" />
                    </div>
                </div>
                <div>
                    <div>Tổng doanh thu theo tháng: <asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
                    <div>Tổng doanh thu theo năm: <asp:Label ID="Label2" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
