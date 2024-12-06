<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormThongBaoChiTiet.aspx.cs" Inherits="QuanLyChungCu.CCFormThongBaoChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 40px;
        }

        .container_box {
            width: 750px;
            padding: 20px;
            border: 2px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .auto-style1 {
            height: 31px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container_box">
            <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td colspan="2" style="text-align:center;font-size:25px; font-weight: bold;">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TieuDe") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="font-size: 18px;font-weight: bold;">Người gửi</td>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenChuHo") %>'></asp:Label>
                        </td>
                    
                    </tr>
                    <tr>
                        <td style="font-size: 18px;font-weight: bold;">Ngày thông báo</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("NgThongBao") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-size: 18px;font-weight: bold;">Nội dung</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="margin-top: 30px;">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        </div>
    </div>
</asp:Content>
