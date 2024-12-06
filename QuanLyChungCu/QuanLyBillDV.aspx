<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyBillDV.aspx.cs" Inherits="QuanLyChungCu.QuanLyBillDV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .image{
            width:300px;
            height:600px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" CssClass="image" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
