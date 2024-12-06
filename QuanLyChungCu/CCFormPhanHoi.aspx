<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormPhanHoi.aspx.cs" Inherits="QuanLyChungCu.CCFormPhanHoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .box_table {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h3 {
            text-align: center;
            text-transform: uppercase;
        }

        .box_text {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .feedback-box {
            width: 100%;
            max-width: 600px;
            padding: 15px;
            height: 300px;
            font-size: 16px;
            font-family: Arial, sans-serif;
            border: 1px solid #ccc;
            transition: border-color 0.3s, box-shadow 0.3s;
            resize: none;
            outline: none;
        }

        .feedback-box:focus {
            border-color: darkgrey;
            box-shadow: 0 2px 8px rgba(0, 123, 255, 0.2);
        }

        .button {
            width: 100px;
            height: 40px;
            text-align: center;
            font-size: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_table">
        <h3>Phản hồi của bạn</h3>
        <%--<asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="IDPhanHoi" HeaderText="Mã Phản Hồi" />
                <asp:BoundField DataField="NoiDung" HeaderText="NoiDung" HtmlEncode="false" />
                <asp:BoundField DataField="NgPhanHoi" HeaderText="Ngày Gửi Phản Hồi" HtmlEncode="false" />
                <asp:BoundField DataField="Traloi" HeaderText="Phản Hồi Từ Admin" HtmlEncode="false" />
                <asp:BoundField DataField="NgTraLoi" HeaderText="Ngày Trả Lời " HtmlEncode="false" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="box_text">
        <h3>Viết phản hồi</h3>
        <asp:TextBox CssClass="feedback-box" ID="txt_phanhoi" runat="server" TextMode="MultiLine" MaxLength="2000" placeholder="Nhập phản hồi của bạn..."></asp:TextBox>
        <br />
        <asp:Button CssClass="button" ID="btn_phanhoi" runat="server" Text="Gửi" OnClick="btn_phanhoi_Click" />
    </div>
</asp:Content>
