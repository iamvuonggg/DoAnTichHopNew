<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyTaoTaiKhoan.aspx.cs" Inherits="QuanLyChungCu.QuanLyTaoTaiKhoan" %>
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
                    <td colspan="2">
                        <marquee behavior="scroll" direction="left">Vui lòng nhập thông tin hộ gia đình trước để lấy ID hộ để cấp tài khoản</marquee>
                    </td>
                </tr>
                <tr>
                    <td>Nhập tên tài khoản</td>
                    <td>
                        <asp:TextBox ID="txt_tenDN" placeholder="Enter name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mật khẩu</td>
                    <td>
                        <asp:TextBox ID="txt_Pass" placeholder="Enter password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Quyền người dùng</td>
                    <td>
                        <asp:DropDownList ID="DropQuyen" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>ID Chủ Hộ</td>
                    <td>
                        <asp:DropDownList ID="DropIDHoGD" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Trạng thái tài khoản</td>
                    <td>
                        <asp:DropDownList ID="DropTrangThai" runat="server">
                            <asp:ListItem Text="Hoạt động"></asp:ListItem>
                            <asp:ListItem Text="Khóa"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

            </table>
            <div class="nutbam">
                <asp:Button ID="btn_Tao" runat="server" Text="Tạo Tài Khoản" OnClick="btn_Tao_Click" />
                <asp:Button ID="btn_Sua" runat="server" Text="Update" OnClick="btn_Sua_Click"/>
                <asp:Button ID="btn_Xoa" runat="server" Text="Delete" OnClick="btn_Xoa_Click"/>
                <asp:Button ID="btn_clear" runat="server" Text="ClearForm" OnClick="btn_clear_Click" />
            </div>
        </div>
        <div class="right">
            <div>
                <asp:TextBox ID="txt_timkiem" placeholder="Search" runat="server"></asp:TextBox>
                <asp:Button ID="btn_timkiem" runat="server" Text="Tìm kiếm" OnClick="btn_timkiem_Click" />
                <asp:Button ID="btn_lammoi" runat="server" Text="Refresh" OnClick="btn_lammoi_Click"/>
            </div>
            <h3>Danh Sách Tài Khoản</h3>
            <asp:GridView ID="GridTaiKhoan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridTaiKhoan_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-user-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenDangNhap" HeaderText="Tên tài khoản" />
                    <asp:BoundField DataField="IDQuyen" HeaderText="ID Quyền"/>
                    <asp:BoundField DataField="TenQuyen" HeaderText="Tên quyền" HtmlEncode="false" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ Gia Đình" HtmlEncode="false" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Chủ Hộ" HtmlEncode="false" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" HtmlEncode="false" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
