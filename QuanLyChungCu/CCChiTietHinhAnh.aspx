<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCChiTietHinhAnh.aspx.cs" Inherits="QuanLyChungCu.CCChiTietHinhAnh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        ItemTemplate {
            width: 700px;
            height: auto;
        }

        .img {
            width: 100%;
            height: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
        <ItemTemplate>
            <asp:Image CssClass="img" ID="Image1" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
