<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyThongKe.aspx.cs" Inherits="QuanLyChungCu.QuanLyThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .out-main{
            display:flex;
            gap:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="out-main">
        <div class="form-dichvu">
            <h3>Hóa Đơn Dịch Vụ</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="ID Hóa Đơn" />
                    <asp:BoundField DataField="NgLapHD" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0}" />
                </Columns>
            </asp:GridView>
            <div class="thongke-dichvu">
                <div>
                    <asp:TextBox ID="txt_thongke" runat="server" placeholder="Nhập tháng hoặc năm cần thống kê"></asp:TextBox>
                    <asp:Button ID="btn_thongke" runat="server" Text="Thống Kê" OnClick="btn_thongke_Click" />
                    <asp:Button ID="btn_tongdoanhthu" runat="server" Text="Tổng Doanh Thu" OnClick="btn_tongdoanhthu_Click" />
                </div>
                <div>
                    <div>Doanh thu theo tháng: <asp:Label ID="lb_thongkeThang" runat="server" Text=""></asp:Label></div>
                    <div>Doanh thu theo năm: <asp:Label ID="lb_thongkeNam" runat="server" Text=""></asp:Label></div>
                    <div>Tổng Doanh Thu: <asp:Label ID="lb_tongdoanhThu" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>

        <div class="form-diennuoc">
            <h3>Danh Sách Hóa Đơn Điện Nước</h3>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="ID Hóa Đơn" />
                    <asp:BoundField DataField="NgLap" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0}" />
                </Columns>
            </asp:GridView>
            <div class="thongke-diennuoc">
                <div>
                    <asp:TextBox ID="txt_tkDN" runat="server" placeholder="Nhập tháng hoặc năm cần thống kê"></asp:TextBox>
                    <asp:Button ID="btn_tkDN" runat="server" Text="Thống Kê" OnClick="btn_tkDN_Click" />
                    <asp:Button ID="btn_tkTDT" runat="server" Text="Tổng Doanh Thu" OnClick="btn_tkTDT_Click" />
                </div>
                <div>
                    <div>Doanh thu theo tháng: <asp:Label ID="lb_dtThang" runat="server" Text=""></asp:Label></div>
                    <div>Doanh thu theo năm: <asp:Label ID="lb_dtNam" runat="server" Text=""></asp:Label></div>
                    <div>Tổng Doanh Thu: <asp:Label ID="lb_tongDT" runat="server" Text=""></asp:Label></div>
                </div>
            </div>
        </div>

        <div class="form-tongdoanhthu">
            <h3>Tổng Doanh Thu</h3>
            <div>
                <asp:TextBox ID="txttongdoanhthu" runat="server" Enabled="false" ReadOnly="true"></asp:TextBox>
            </div>

            <div>
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Nhập tháng hoặc năm cần thống kê"></asp:TextBox>
                    <asp:Button ID="btn_tkTong" runat="server" Text="Thống Kê" OnClick="btn_tkTong_Click" />
                </div>
                <div>
                    <div>Tổng doanh thu theo tháng: <asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
                    <div>Tổng doanh thu theo năm: <asp:Label ID="Label2" runat="server" Text=""></asp:Label></div>
                </div>
                <asp:Button ID="btntong" runat="server" Text="Load" OnClick="btntong_Click" />
            </div>
        </div>
    </div>
</asp:Content>
