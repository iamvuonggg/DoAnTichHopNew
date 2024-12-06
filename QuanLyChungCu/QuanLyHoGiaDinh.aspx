<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyHoGiaDinh.aspx.cs" Inherits="QuanLyChungCu.QuanLyHoGiaDinh" %>
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
                    <td>ID Hộ</td>
                    <td>
                        <asp:DropDownList ID="DropIDHo" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Tên Chủ Hộ</td>
                    <td>
                        <asp:TextBox ID="txt_tenchu" placeholder="Enter name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Ngày sinh</td>
                    <td>
                        <asp:TextBox ID="txt_ngaysinh" placeholder="dd/MM/YYYY" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Địa Chỉ</td>
                    <td>
                        <asp:TextBox ID="txt_diachi" placeholder="Enter address" runat="server" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txt_email" runat="server" placeholder="Enter mail Ex:Example@gmail.com" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="update" CssClass="validation" Display="Dynamic" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-z0-9]+@gmail\.com$" ErrorMessage="Email không hợp lệ" ToolTip="Email không hợp lệ">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Số Điện Thoại</td>
                    <td>
                        <asp:TextBox ID="txt_sdt" runat="server" placeholder="Enter phone number" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="update" CssClass="validation" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ControlToValidate="txt_sdt" ValidationExpression="^0[3-9]\d{8}$" ToolTip="Sai định dạng SDT">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Căn Cước Công Dân</td>
                    <td>
                        <asp:TextBox ID="txt_Cancuoc" runat="server" placeholder="Enter ID Card" ></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div class="nutbam">
                <asp:Button ID="btn_Tao" runat="server" Text="Update HouseHolder Members" OnClick="btn_Tao_Click" />
                <asp:Button ID="btn_Sua" runat="server" Text="Add HouseHolder" OnClick="btn_Sua_Click" ValidationGroup="update" />
                <asp:Button ID="btn_Xoa" runat="server" Text="Delete HouseHolder" OnClick="btn_Xoa_Click" />
                <asp:Button ID="btn_clear" runat="server" Text="ClearForm" OnClick="btn_clear_Click" />
            </div>
        </div>
        <div class="right">
            <div>
                <asp:TextBox ID="txt_timkiem" placeholder="Enter HDG..." runat="server"></asp:TextBox>
                <asp:Button ID="btn_timkiem" runat="server" Text="Tìm kiếm" OnClick="btn_timkiem_Click" />
                <asp:Button ID="btn_lammoi" runat="server" Text="Refresh" OnClick="btn_lammoi_Click" />
            </div>
            <h3>Danh Sách Hộ Gia Đình</h3>
            <asp:GridView ID="GridTaiKhoan" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridTaiKhoan_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLink" CssClass="user-btn" runat="server" CommandName="Select"><i class="fa-solid fa-person"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Tên Chủ Hộ" HtmlEncode="false" />
                    <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" HtmlEncode="false" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="SDT" HeaderText="Số Điện Thoại" />
                    <asp:BoundField DataField="CCCD" HeaderText="Căn Cước Công Dân" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
