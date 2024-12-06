<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormDoiPassWord.aspx.cs" Inherits="QuanLyChungCu.CCFormDoiPassWord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .center-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 95vw;
            height: 100vh;
            background-color: #f1f1f1; /* Màu nền */
        }

        .form-container {
            width: 400px;
            padding: 20px;
            border: 2px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            font-size: 16px;
        }

        td[colspan="2"] {
            text-align: center;
            font-weight: bold;
            font-size: 18px;
        }

        input[type="password"],
        .button,
        label {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .button {
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            background-color: dimgray;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-wrapper">
        <div class="form-container">
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td colspan="2">Đổi Mật Khẩu</td>
                        </tr>
                        <tr>
                            <td>Tên Tài Khoản</td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenDangNhap") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Nhập Mật Khẩu Cũ</td>
                            <td>
                                <asp:TextBox ID="txt_matkhau" runat="server" TextMode="Password" placeholder="Nhập mật khẩu cũ"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Mật Khẩu Mới</td>
                            <td>
                                <asp:TextBox ID="txt_passnew" runat="server" TextMode="Password" placeholder="Nhập mật khẩu mới"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Nhập Lại Mật Khẩu</td>
                            <td>
                                <asp:TextBox ID="txt_passnew1" runat="server" TextMode="Password" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                                <asp:CompareValidator ID="cv_pass" runat="server"
                                    ControlToCompare="txt_passnew"
                                    ControlToValidate="txt_passnew1"
                                    ErrorMessage="*"
                                    ToolTip="Mật khẩu mới và nhập lại mật khẩu không khớp."
                                    ForeColor="Red"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button CssClass="button" ID="btndoi" runat="server" Text="Đổi Mật Khẩu" CommandArgument='<%# Eval("TenDangNhap") %>' OnClick="btndoi_Click" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
