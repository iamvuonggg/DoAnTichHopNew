<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyThanhVienHGD.aspx.cs" Inherits="QuanLyChungCu.QuanLyThanhVienHGD" %>
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
            <div class="left-on">
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2">Chủ Hộ</td>
                            </tr>
                            <tr>
                                <td>ID Hộ</td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("IDHoGD") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Tên Chủ Hộ</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TenChuHo") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Thêm Thành Viên</td>
                            </tr>
                            <tr>
                                <td>ID Thành Viên</td>
                                <td>
                                    <asp:TextBox ID="txtidthanhvien" runat="server" Enabled="false" ReadOnly="true" placeholder="Enter id"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Họ tên</td>
                                <td>
                                    <asp:TextBox ID="txt_hoten" runat="server" placeholder="Enter name"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Ngày sinh</td>
                                <td>
                                    <asp:TextBox ID="txt_ngaysinh" runat="server" placeholder="Enter dd/MM/YYYY"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Mối quan hệ</td>
                                <td>
                                    <asp:TextBox ID="txt_mqh" runat="server" placeholder="Enter mối quan hệ"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btn_them" runat="server" Text="Create" OnClick="btn_them_Click" />
                                    <asp:Button ID="btn_sua" runat="server" Text="Update" OnClick="btn_sua_Click" />
                                    <asp:Button ID="btn_xoa" runat="server" Text="Delete" OnClick="btn_xoa_Click" />
                                    <asp:Button ID="btn_clear" runat="server" Text="ClearForm" OnClick="btn_clear_Click" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div class="right">
            <h3>Thành Viên Gia Đình</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-child"></i></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDThanhVien" HeaderText="ID Thành Viên" />
                    <asp:BoundField DataField="IDHoGD" Visible="false" />
                    <asp:BoundField DataField="HoTen" HeaderText="Họ tên" HtmlEncode="false" />
                    <asp:BoundField DataField="NgSinh" HeaderText="Ngày Sinh" />
                    <asp:BoundField DataField="MoiQuanHe" HeaderText="Mối Quan Hệ" HtmlEncode="false" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
