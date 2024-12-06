<%@ Page Title="" Language="C#" MasterPageFile="~/HomeAdmin.Master" AutoEventWireup="true" CodeBehind="AdminListAnhCanHo.aspx.cs" Inherits="QuanLyChungCu.AdminListAnhCanHo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .out-main {
            display: flex;
        }
        .img-load{
            width:150px;
            height:160px;
        }
        .img{
            width:100px;
            height:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-main">
        <div class="left">
                <table style="width:100%;">
                        <tr>
                            <td colspan="2">Add Hình Ảnh</td>
                        </tr>
                        <tr>
                            <td>ID Ảnh</td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>ID Căn Hộ</td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Upload Ảnh</td>
                            <td>
                                <asp:Image ID="Image2" CssClass="img-load" runat="server" />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="them" runat="server" Text="Create" OnClick="them_Click" />
                                <asp:Button ID="xoa" runat="server" Text="Delete" OnClick="xoa_Click" />
                            </td>
                        </tr>
                    </table>
        </div>
        <div class="right">
            <h3>Danh Sách Ảnh Căn Hộ</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-image"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDHinhAnh" HeaderText="ID Ảnh" />
                    <asp:BoundField DataField="IDCanHo" HeaderText="ID Căn Hộ" />
                    <asp:TemplateField HeaderText="Hình Ảnh">
                        <ItemTemplate>
                            <asp:Image ID="Image1" CssClass="img" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
