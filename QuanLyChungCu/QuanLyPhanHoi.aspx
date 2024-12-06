<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyPhanHoi.aspx.cs" Inherits="QuanLyChungCu.QuanLyPhanHoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .out-main {
            display: flex;
        }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-main">
        <div class="left">
            <table style="width: 100%;">
                <tr>
                    <td colspan="2" align="center">Phản Hồi</td>
                </tr>
                <tr>
                    <td>ID Phản Hồi</td>
                    <td>
                        <asp:Label ID="lb_idphanhoi" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>ID Chủ Hộ Dia Đình</td>
                    <td>
                        <asp:Label ID="lb_idhogd" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Tên Chủ Hộ</td>
                    <td>
                        <asp:Label ID="lb_tenchuho" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Nội Dung</td>
                    <td>
                        <asp:TextBox ID="txt_noidung" runat="server" TextMode="MultiLine" Width="200px" Height="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Ngày Phản Hồi</td>
                    <td>
                        <asp:Label ID="lb_ngayphanhoi" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Ngày Trả Lời</td>
                    <td>
                        <asp:Label ID="lb_ngaytraloi" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">Trả Lời</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:TextBox ID="txttraloi" runat="server" TextMode="MultiLine" Width="300px" Height="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btn_traloi" runat="server" Text="Send Reply" OnClick="btn_traloi_Click" />
                        <asp:Button ID="btn_xoa" runat="server" Text="Delete" OnClick="btn_xoa_Click" />
                        <asp:Button ID="btn_clearForm" runat="server" Text="ClearForm" OnClick="btn_clearForm_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="right">
            <h3>Danh Sách Phản Hồi</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-pen-to-square"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDPhanHoi" HeaderText="ID Phản Hồi" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ Gia Đình" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Phản Hồi" HtmlEncode="false" />
                    <asp:BoundField DataField="NoiDung" HeaderText="Nội Dung"  HtmlEncode="false" />
                    <asp:BoundField DataField="NgPhanHoi" HeaderText="Ngày Phản Hồi" />
                    <asp:BoundField DataField="TraLoi" HeaderText="Trả Lời"  HtmlEncode="false" />
                    <asp:BoundField DataField="NgTraLoi" HeaderText="Ngày Trả Lời" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
