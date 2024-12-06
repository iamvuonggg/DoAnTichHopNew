<%@ Page Title="" Language="C#" MasterPageFile="~/HomeQuanLy.Master" AutoEventWireup="true" CodeBehind="QuanLyHoaDon.aspx.cs" Inherits="QuanLyChungCu.QuanLyHoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .out-main {
            width:100%;
            display: flex;
        }
        .left{
            width:50%;
        }
        .right{
            width:50%;
        }
        .hinh-bill{
            width:80px;
            height:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out-main">
        <div class="left">
            <div class="form-hoadonDV">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2" align="center">Hóa Đơn Dịch Vụ</td>
                    </tr>
                    <tr>
                        <td>ID Hóa Đơn</td>
                        <td>
                            <asp:TextBox ID="txt_idhoadon" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Tên Chủ Hộ</td>
                        <td>
                            <asp:TextBox ID="txt_tenchuho" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Tên Dịch Vụ</td>
                        <td>
                            <asp:TextBox ID="txt_tendv" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá</td>
                        <td>
                            <asp:TextBox ID="txt_gia" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày Lập</td>
                        <td>
                            <asp:TextBox ID="txtngaylap" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Số Tháng Sử Dụng</td>
                        <td>
                            <asp:TextBox ID="txt_sothang" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Tổng Tiền</td>
                        <td>
                            <asp:TextBox ID="txt_tongtien" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Trạng Thái</td>
                        <td>
                            <asp:DropDownList ID="DropTrangThai" runat="server">
                                <asp:ListItem Text="Chờ xác nhận"></asp:ListItem>
                                <asp:ListItem Text="Đã thanh toán"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btntrangthai" runat="server" Text="Update" OnClick="btntrangthai_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-grid">
                <h3>Danh Sách Hóa Đơn Dịch Vụ</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectLink" runat="server" CommandName="Select"><i class="fa-solid fa-bell-concierge"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IDHoaDon" HeaderText="ID" />
                        <asp:BoundField DataField="TenCHuHo" HeaderText="Hộ" />
                        <asp:BoundField DataField="TenDV" HeaderText="Dịch Vụ" />
                        <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0}" />
                        <asp:BoundField DataField="NgLapHD" HeaderText="Ngày Lập" />
                        <asp:BoundField DataField="SoThangSD" HeaderText="Số Tháng Sử Dụng" />
                        <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0} vnđ" />
                        <asp:TemplateField HeaderText="Bill">
                            <ItemTemplate>
                                <asp:ImageButton CssClass="hinh-bill" ID="btn_bill" OnClick="btn_bill_Click" runat="server" CommandArgument='<%# Eval("IDHoaDon") %>' ImageUrl='<%# "images/"+Eval("HinhAnh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TrangThai" HeaderText="Trạng Thái" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="rigth">
            <div class="form-hoadonDN">
                <table style="width: 100%;">
                    <tr>
                        <td colspan="2" align="center">Hóa Đơn Điện Nước</td>
                    </tr>
                    <tr>
                        <td>ID Hóa Đơn</td>
                        <td>
                            <asp:TextBox ID="txt_idhoadonDN" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Hộ Gia Đình</td>
                        <td>
                            <asp:DropDownList ID="DropHoGD" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày Lập</td>
                        <td>
                            <asp:TextBox ID="txtngaylapHD" placeholder="Được lấy tự động" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Số Tiêu Thụ</td>
                        <td>
                            <asp:TextBox ID="txtsotieuthu" placeholder="Số điện / nước tiêu thụ" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá Tiêu Thụ</td>
                        <td>
                            <asp:TextBox ID="txt_giatieuthu" placeholder="Giá tiêu thụ / 1 chữ" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Tổng Tiền</td>
                        <td>
                            <asp:TextBox ID="txt_tongtienDN" placeholder="Số tiêu thụ * Giá tiêu thụ" Enabled="false" ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Loại Hóa Đơn</td>
                        <td>
                            <asp:DropDownList ID="DropLoaiHD" runat="server">
                                <asp:ListItem Text="Hóa Đơn Điện"></asp:ListItem>
                                <asp:ListItem Text="Hóa Đơn Nước"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Tình Trạng</td>
                        <td>
                            <asp:DropDownList ID="DropTinhTrang" runat="server">
                                <asp:ListItem Text="Chưa Thanh Toán"></asp:ListItem>
                                <asp:ListItem Text="Chờ xác nhận"></asp:ListItem>
                                <asp:ListItem Text="Đã Thanh Toán"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnthem" runat="server" Text="Create" OnClick="btnthem_Click" />
                            <asp:Button ID="btnsua" runat="server" Text="Update" OnClick="btnsua_Click" />
                            <asp:Button ID="btnuptrangthai" runat="server" Text="Update State" OnClick="btnuptrangthai_Click" />
                            <asp:Button ID="btnxoa" runat="server" Text="Delete" OnClick="btnxoa_Click" />
                            <asp:Button ID="btnClearForm" runat="server" Text="ClearForm" OnClick="btnClearForm_Click" />
                        </td>
                    </tr>
                    
                </table>
            </div>
            <div class="form-griddiennuoc">
                <h3>Danh Sách Hóa Đơn Điện Nước</h3>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectLink" runat="server" CommandName="Select"><i class="fa-solid fa-receipt"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="IDHoaDon" HeaderText="Mã" />
                    <asp:BoundField DataField="LoaiHD" HeaderText="Hóa Đơn" />
                    <asp:BoundField DataField="IDHoGD" HeaderText="ID Hộ" />
                    <asp:BoundField DataField="TenChuHo" HeaderText="Chủ Hộ" />
                    <asp:BoundField DataField="TieuThu" HeaderText="Tiêu Thụ" />
                    <asp:BoundField DataField="GiaTieuThu" HeaderText="Giá"  />
                    <asp:BoundField DataField="NgLap" HeaderText="Ngày Lập" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng Tiền" DataFormatString="{0:N0}" />
                    <asp:BoundField DataField="TinhTrang" HeaderText="Tình Trạng" />
                    <asp:TemplateField HeaderText="Bill">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="hinh-bill" ID="btn_billDN" OnClick="btn_billDN_Click" runat="server" CommandArgument='<%# Eval("IDHoaDon") %>' ImageUrl='<%# "images/"+Eval("HinhAnh") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
