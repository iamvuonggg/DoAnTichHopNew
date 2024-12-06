<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyCanHo.aspx.cs" Inherits="QuanLyChungCu.QuanLyCanHo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .out-main {
            display: flex;
        }
        .img{
            width:60px;
            height:70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-main">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan="2">Căn Hộ</td>                   
                </tr>
                <tr>
                    <td>ID Căn Hộ</td>
                    <td>
                        <asp:TextBox ID="txt_idcanho" runat="server"></asp:TextBox>
                    </td>                   
                </tr>
                <tr>
                    <td>Số Căn Hộ</td>
                    <td>
                        <asp:TextBox ID="txt_socanho" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Chủ Căn Hộ</td>
                    <td>
                        <asp:DropDownList ID="DropChuHo" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Giá Căn Hộ</td>
                    <td>
                        <asp:TextBox ID="txt_gia" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Tầng</td>
                    <td>
                        <asp:DropDownList ID="DropTang" runat="server">
                            <asp:ListItem Text="Tầng 1"></asp:ListItem>
                            <asp:ListItem Text="Tầng 2"></asp:ListItem>
                            <asp:ListItem Text="Tầng 3"></asp:ListItem>
                            <asp:ListItem Text="Tầng 4"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Số Lượng Phòng</td>
                    <td>
                        <asp:TextBox ID="txt_slphong" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mô Tả</td>
                    <td>
                        <asp:TextBox ID="txt_Mota" runat="server" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Ảnh Mô Tả</td>
                    <td>
                        <asp:Image ID="img" runat="server" Width="100px" Height="100px" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Trạng Thái</td>
                    <td>
                        <asp:TextBox ID="txt_trangthai" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_them" runat="server" Text="Create" OnClick="btn_them_Click" />
                        <asp:Button ID="btn_capnhat" runat="server" Text="Update" OnClick="btn_capnhat_Click" />
                        <asp:Button ID="btn_xoa" runat="server" Text="Delete" OnClick="btn_xoa_Click" />
                        <asp:Button ID="btn_xoaForm" runat="server" Text="ClearFrom" OnClick="btn_xoaForm_Click" />
                        <asp:Button ID="btn_AddIMG" runat="server" Text="Add List IMG" OnClick="btn_AddIMG_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_UpChuHo" runat="server" Text="Update HouseHolder" OnClick="btn_UpChuHo_Click" />
                        <asp:Button ID="btn_DelChuHo" runat="server" Text="Delete HouseHolder" OnClick="btn_DelChuHo_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h3>Danh Sách Tất Cả Căn Hộ</h3>
            <asp:GridView ID="GridCanHo" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridCanHo_SelectedIndexChanged" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink"  runat="server" CommandName="Select"><i class="fa-solid fa-house"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDCanHo" HeaderText="ID Căn Hộ" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Chủ Hộ"/>
                    <asp:BoundField DataField="SoCanHo" HeaderText="Số Căn Hộ"/>
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Hộ" HtmlEncode="false" />
                    <asp:BoundField DataField="Gia" HeaderText="Giá" HtmlEncode="false" />
                    <asp:BoundField DataField="SoTang" HeaderText="Tầng" HtmlEncode="false" />
                    <asp:BoundField DataField="SLPhong" HeaderText="SL Phòng" HtmlEncode="false" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" HtmlEncode="false" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" HtmlEncode="false" />
                    <asp:TemplateField HeaderText="Ảnh Mô Tả">
                        <ItemTemplate>
                            <asp:Image ID="Image1" CssClass="img" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
