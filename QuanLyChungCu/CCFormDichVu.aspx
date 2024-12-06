<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormDichVu.aspx.cs" Inherits="QuanLyChungCu.CCFormDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .datalist-container {
            display: flex;
            justify-content: center; /* Căn giữa theo chiều ngang */
            align-items: center;    /* Căn giữa theo chiều dọc */
            min-height: 50vh;      /* Chiều cao tối thiểu là 100% của viewport */
            margin: 0;
            background-color: #f4f4f4; /* Nền sáng nhẹ */
        }


        /* Kiểu dáng cho từng mục */
        #DataList1 .item {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 300px;
            padding: 15px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .imgbutton {
            width: 100%;
            max-width: 460px;
            height: 400px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .item a {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            margin-top: 10px;
            font-size: 16px;
            transition: color 0.3s;
        }

        .item a:hover {
            color: #0056b3;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="datalist-container">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
            <ItemTemplate>
                <div class="item">
                    <asp:ImageButton CssClass="imgbutton" ID="ImageButton1" runat="server" 
                        ImageUrl='<%# "images/"+Eval("HinhAnh") %>' 
                        OnClick="ImageButton1_Click" CommandArgument='<%# Eval("IDDichVu") %>' />
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        OnClick="LinkButton1_Click" CommandArgument='<%# Eval("IDDichVu") %>'>
                        Xem chi tiết
                    </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

