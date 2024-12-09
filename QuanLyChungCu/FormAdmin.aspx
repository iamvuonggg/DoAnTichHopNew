<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="FormAdmin.aspx.cs" Inherits="QuanLyChungCu.FormAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            position: relative;
            margin-top: 20px;
            height: 100%;
            width: 100%;
            overflow: hidden;
        }
        img {
            width: 100%;
            height: 600px;
            object-fit: contain; /* Đảm bảo ảnh không bị cắt xén */
        }
        h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 3rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            z-index: 2; /* Đảm bảo chữ nằm trên ảnh */
            margin: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Admin</h1>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/admin.jpg" />
    </div>
</asp:Content>
