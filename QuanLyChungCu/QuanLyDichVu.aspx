<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyDichVu.aspx.cs" Inherits="QuanLyChungCu.QuanLyDichVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .out-main {
            display: flex;
        }
        .img-input{
             width:200px;
            height:200px;
        }
        .img{
            width:200px;
            height:200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-main">
        <div class="left">
            <table style="width: 100%;">
                <tr>
                    <td colspan="2">Add Dịch Vụ</td>
                </tr>
                <tr>
                    <td>ID Dịch Vụ</td>
                    <td>
                        <asp:TextBox ID="txtidDV" runat="server" placeholder="Enter ID dịch vụ"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Tên Dịch Vụ</td>
                    <td>
                        <asp:TextBox ID="txtTenDV" runat="server" placeholder="Enter name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Giá</td>
                    <td>
                        <asp:TextBox ID="txtgia" runat="server" placeholder="Enter giá"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mô Tả</td>
                    <td>
                        <asp:TextBox ID="txtmota" runat="server" TextMode="MultiLine" MaxLength="1000" placeholder="Enter mô tả"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Trạng Thái</td>
                    <td>
                        <asp:DropDownList ID="DropTrangThai" runat="server">
                            <asp:ListItem Text="Ngừng Hoạt Động"></asp:ListItem>
                            <asp:ListItem Text="Còn Hoạt Động"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Ảnh Mô Tả</td>
                    <td>
                        <asp:Image ID="img" CssClass="img-input" runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnthem" runat="server" Text="Create" OnClick="btnthem_Click" />
                        <asp:Button ID="btnsua" runat="server" Text="Update" OnClick="btnsua_Click" />
                        <asp:Button ID="btnxoa" runat="server" Text="Delete" OnClick="btnxoa_Click" />
                        <asp:Button ID="btnclear" runat="server" Text="ClearForm" OnClick="btnclear_Click" />
                    </td>
                    
                </tr>
            </table>
        </div>
        <div class="right">
            <h3>Danh Sách Dịch Vụ</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-bell-concierge"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDDichVu" HeaderText="ID Dịch Vụ" />
                    <asp:BoundField DataField="TenDV" HeaderText="Tên Dịch Vụ"  HtmlEncode="false" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô Tả"  HtmlEncode="false" />
                    <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0} vnđ" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" HtmlEncode="false" />
                    <asp:TemplateField HeaderText="Ảnh Mô Tả">
                        <ItemTemplate>
                            <asp:Image ID="Image2" CssClass="img" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
