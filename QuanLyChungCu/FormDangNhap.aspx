<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDangNhap.aspx.cs" Inherits="QuanLyChungCu.FormDangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" rel="stylesheet" />
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f4f8;
            font-family: Arial, sans-serif;
        }

        /* Container chính */
        .container {
            display: flex;
            flex-wrap: nowrap;
            width: 800px;
            height: 400px;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        /* Form đăng nhập */
        .container_box {
            flex: 1;
            padding: 30px;
        }

        .container_box table {
            width: 100%;
        }

        .container_box table td {
            padding: 10px;
        }

        .container_box h2 {
            text-align: center;
            color: White;
            background-color: black;
            font-size: 1.4em;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .container_box_input {
            width: 100%;
            max-width: 70%;
            height: 60px;
        }
        
        .container_box_input .container_box_nhap {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .container_box_input i {
            font-size: 25px;
        }

        .container_box_input .nhap_box {
            width: 80%;
            height: 30px;
            border: none; 
            border-bottom: 2px solid black; 
            outline: none;
            padding: 5px 0;
            font-size: 1em;
        }

        .container_box_input .nhap_box:focus {
             border-bottom: 2px solid #0056b3;
        }

        .container_box .login-btn {
            width: 100%;
            padding: 10px;
            background-color: darkgray;
            color: black;
            font-size: 1rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        .checkbox {
            gap: 30px;
        }

        .container_box .login-btn:hover {
            background-color: black;
            color: white;
        }

        /* Hình ảnh bên cạnh */
        .container_img {
            flex: 1;
            position: relative;
            background-size: cover;
            background-image: url('images/pexels-kelly-1179532-2833657.jpg');
            background-position: center;
        }

         .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 2.5em; 
            font-weight: bold; 
            text-align: center;
         }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <div class="container">
                        <table class="container_box" cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2" style="color:White;background-color:black;font-size:1.3em;font-weight:bold;">LOG IN</td>
                                </tr>
                                <tr class="container_box_input">
                                    <td class="container_box_nhap">
                                        <i class="fa-regular fa-user"></i>
                                        <asp:TextBox CssClass="nhap_box" ID="UserName" runat="server" Font-Size="0.8em" placeholder="Enter your username" />
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="container_box_input">
                                    <td class="container_box_nhap">
                                        <i class="fa-solid fa-lock"></i>
                                        <asp:TextBox CssClass="nhap_box" ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" placeholder="Enter your password" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox CssClass="checkbox" ID="RememberMe" runat="server" Text="Remember me next time." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" CssClass="login-btn" runat="server"  CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                    </table>
                    <div class="container_img">
                        <div class="overlay">
                            Chào mừng bạn đến với P HOUSE
                        </div>
                    </div>
                    </div>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
    </form>
</body>
</html>
