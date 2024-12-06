<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyThongBao.aspx.cs" Inherits="QuanLyChungCu.QuanLyThongBao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .out-main {
            display: flex;
        }

        .img-input {
            width: 200px;
            height: 200px;
        }
        .txt-noidung{
            width:200px;
            height:100px;
        }
        .img {
            width: 200px;
            height: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-main">
        <div class="left">
            <table style="width: 100%;">
                <tr>
                    <td colspan="2">Add Thông Báo</td>

                </tr>
                <tr>
                    <td>ID Thông Báo</td>
                    <td>
                        <asp:Label ID="lb_idthongbao" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Người Tạo Thông Báo</td>
                    <td>
                        <asp:Label ID="lb_nguoitao" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Tiêu Đề Thông Báo</td>
                    <td>
                        <asp:TextBox ID="txt_tieude" runat="server" placeholder="Enter Tieu De"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Nội Dung</td>
                    <td>
                        <asp:TextBox ID="txt_noidung" CssClass="txt-noidung" runat="server" placeholder="Enter Noi Dung" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Ngày Tạo Thông Báo</td>
                    <td>
                        <asp:Label ID="lb_ngaytaotb" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnthem" runat="server" Text="Create" OnClick="btnthem_Click" />
                        <asp:Button ID="btnsua" runat="server" Text="Update" OnClick="btnsua_Click" />
                        <asp:Button ID="btnxoa" runat="server" Text="Delete" OnClick="btnxoa_Click"/>
                        <asp:Button ID="btnclear" runat="server" Text="ClearForm" OnClick="btnclear_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="right">
            <h3>Danh Sách Thông Báo</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-bell"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDThongBao" HeaderText="ID Thông Báo" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Người Tạo" HtmlEncode="false" />
                    <asp:BoundField DataField="TieuDe" HeaderText="Tiêu Đề" HtmlEncode="false" />
                    <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung" HtmlEncode="false" />
                    <asp:BoundField DataField="NgThongBao" HeaderText="Ngày Tạo" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
