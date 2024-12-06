<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormHoTro.aspx.cs" Inherits="QuanLyChungCu.CCFormHoTro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        header {
            background-color: #2c3e50;
            color: white;
            width: 100%;
            text-align: center;
            padding: 20px 0;
        }

        header h1 {
            margin: 0;
        }

        .container {
            width: 90%;
            max-width: 900px;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 40px;
        }

        .container h2 {
            font-size: 24px;
            color: #2c3e50;
            text-align: center;
        }

        .container p {
            font-size: 16px;
            color: #34495e;
            line-height: 1.6;
            text-align: center;
        }

        .info {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }

        .info i {
            margin-right: 10px;
            font-size: 20px;
            color: #e74c3c;
        }

        .info p {
            margin: 0;
            font-size: 16px;
            color: #34495e;
        }

        @media (max-width: 768px) {
            .container {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>