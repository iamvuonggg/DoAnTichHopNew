<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormHoaDonDichVu.aspx.cs" Inherits="QuanLyChungCu.CCFormHoaDonDichVu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            width: 100%;
            height: auto;
            display: flex;
            align-items: center;
        }
        .left {
            width: 30%;
            height: auto;
            text-align: center;
        }

        .left .img {
            width: 300px;
            height: 300px;
            text-align: center;
            align-items: center;
        }

        .right {
            width: 65%;
            height: auto;
        }
        h1 {
            text-align: center;
        }
        .right .gridview {
            width: 90%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .right .gridview th,
        .right .gridview td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }

        .right .gridview th {
            color: black;
            text-transform: uppercase;
            font-weight: bold;
        }

        .right .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .right .gridview tr:hover {
            background-color: #d1ecf1;
            transition: background-color 0.3s ease;
        }

        .right .gridview td {
            color: #333;
        }
        .hinh-bill {
            width: 40px;
            height: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="left">
            <p>Vui lòng chuyển khoản theo QRCode này và Upload ảnh minh chứng</p>
            <asp:Image CssClass="img" ID="Image1" runat="server" ImageUrl="~/images/qrcode.png" />
        </div>
        <div class="right">
            <h1>Hóa Đơn Dịch Vụ</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="Mã Hóa Đơn" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Hộ" />
                    <asp:BoundField DataField="IDDichVu" HeaderText="" Visible="false" />
                    <asp:BoundField DataField="TenDV" HeaderText="Tên Dịch Vụ" HtmlEncode="false" />
                    <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0} vnđ / 1 tháng" />
                    <asp:BoundField DataField="NgLapHD" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="SoThangSD" HeaderText="Số Tháng Sử Dụng" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0} vnđ" />
                    <asp:BoundField DataField="TrangThai" HeaderText="TrangThai" />
                    <asp:TemplateField HeaderText="Bill">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="hinh-bill" ID="btn_bill" runat="server" CommandArgument='<%# Eval("IDHoaDon") %>' ImageUrl='<%# "images/"+Eval("HinhAnh") %>' OnClick="btn_bill_Click" />
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br />
                            <asp:Button ID="btn_upload" runat="server" Text="Tải lên" CommandArgument='<%# Eval("IDHoaDon") %>' OnClick="btn_upload_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
