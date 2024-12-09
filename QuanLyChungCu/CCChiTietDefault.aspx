<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCChiTietDefault.aspx.cs" Inherits="QuanLyChungCu.CCChiTietDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1 {
            font-weight: bold;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            box-sizing: border-box;
        }

        .container {
            display: flex;
            justify-content: center;
            height: 100vh;
            padding: 20px;
        }

        .left {
            width: 35%;
            height: 680px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }

        .right {
            width: 45%;
            height: 600px;
            font-size: 20px;
            color: #555;
            padding: 20px;
            background-color: #f9f9f9; 
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-sizing: border-box;
        }

        .left_img {
            width: 100%;
            max-width: 400px;
            height: 600px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .left a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .left a:hover {
            color: #0056b3;
        }

        .right_info {
            display: flex;
        }

        .right label {
            font-weight: bold;
            color: #333;
            margin-right: 10px;
        }

        .right p {
            font-size: 14px;
            color: #777;
            margin-top: 10px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <table style="width: 100%;">
                <h1>THÔNG TIN CĂN HỘ</h1>
                <div class="container">
                    <div class="left">
                        <asp:ImageButton CssClass="left_img" ID="ImageButton1" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("IDCanHo") %>' OnClick="LinkButton1_Click">Xem Chi Tiết Ảnh</asp:LinkButton>
                    </div>
                    <div class="right">
                        <div class="right_info">
                            ID Căn Hộ:<asp:Label ID="Label1" runat="server" Text='<%# Eval("IDCanHo") %>'></asp:Label>
                        </div>
                        <div class="right_info">
                            Số Căn Hộ:<asp:Label ID="Label2" runat="server" Text='<%# Eval("SoCanHo") %>'></asp:Label>
                        </div>
                        <div class="right_info">
                            Tầng:<asp:Label ID="Label6" runat="server" Text='<%# Eval("SoTang") %>'></asp:Label>
                        </div>
                        <div class="right_info">
                            Giá:<asp:Label ID="Label3" runat="server" Text='<%# Eval("Gia") %>'></asp:Label>
                        </div>
                        <div class="right_info">
                            Số Lượng Phòng:<asp:Label ID="Label4" runat="server" Text='<%# Eval("SLPhong") %>'></asp:Label>
                        </div>
                        <div class="right_info">
                            Mô Tả:<asp:Label ID="Label5" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                        </div>
                        <p>Chi tiết xin liên hệ 0935999989</p>
                    </div>
                </div>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
