<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuanLyChungCu.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .grid {
        background-color: white;
        padding: 20px;
    }

    .product-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .product-item {
        width: calc(25% - 10px);
        margin-top: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        text-align: center;
        border-radius: 8px;
        overflow: hidden;
        background-color: #fff;
        transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
    }

    .product-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        background-color: #f9f9f9;
    }

    .product-item img {
        max-width: 100%;
        height: auto;
        transition: transform 0.3s ease;
    }

    .product-item:hover img {
        transform: scale(1.1);
    }

    .hinhanh {
        width: 100%;
        height: 260px;
        object-fit: cover;
    }

    .buttonCT {
        color: #333;
        font-size: 15px;
        text-decoration: none;
        display: inline-block;
        margin-top: 10px;
        padding: 5px 10px;
        border: 1px solid #333;
        border-radius: 4px;
        background-color: transparent;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .buttonCT:hover {
        color: #fff;
        background-color: #333;
    }

    .dataPager-container {
        display: flex;
        justify-content: center;
        margin: 20px 0;
        font-size: 20px;
        color: black;
    }

    /* Search bar styling */
    .in-timkiem {
        margin-bottom: 20px;
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    .tk {
        padding: 10px;
        font-size: 14px;
        width: 300px;
        border: 1px solid #ccc;
        border-radius: 4px;
        transition: border-color 0.3s ease;
    }

    .tk:focus {
        border-color: #333;
        outline: none;
    }

    .nuttk {
        padding: 10px 20px;
        font-size: 14px;
        color: #fff;
        background-color: #333;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .nuttk:hover {
        background-color: #555;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="in-timkiem">
        <asp:TextBox ID="txttimkiem" CssClass="tk" runat="server" placeholder=" Nhập số căn hộ / số tầng mong muốn xem..."></asp:TextBox>
        <asp:Button ID="btnTimKiem" CssClass="nuttk" runat="server" Text="Search" OnClick="btnTimKiem_Click" />
    </div>
    <div class="grid">
        <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanged="ListView1_PagePropertiesChanged">
            <LayoutTemplate>
                <div class="product-grid">
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate>

                <div class="product-item">
                    <asp:ImageButton ID="ImageButton1" CssClass="hinhanh" runat="server" ImageUrl='<%# "images/"+Eval("HinhAnh") %>' CommandArgument='<%# Eval("IDCanHo") %>' OnClick="ImageButton1_Click" />
                    <br />
                    <asp:LinkButton ID="LinkButton2" CssClass="buttonCT" runat="server" CommandArgument='<%# Eval("IDCanHo") %>' Text='<%# Eval("Gia") %>' OnClick="LinkButton2_Click"></asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="LinkButton1" CssClass="buttonCT" runat="server" CommandArgument='<%# Eval("IDCanHo") %>' OnClick="LinkButton1_Click">Chi tiết căn hộ</asp:LinkButton>
                </div>

            </ItemTemplate>
        </asp:ListView>
        <div class="dataPager-container">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="ListView1" RenderNonBreakingSpacesBetweenControls="true">
                <Fields>
                    <asp:NumericPagerField ButtonCount="5" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>

</asp:Content>
