<%@ Page Title="" Language="C#" MasterPageFile="~/HomeChungCu.Master" AutoEventWireup="true" CodeBehind="CCFormGioiThieu.aspx.cs" Inherits="QuanLyChungCu.CCFormGioiThieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            color: #333;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .content_gioithieu {
;           padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            margin-top: 40px;
        }

        .content_gioithieu .content_box {
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 40px;
        }

        .highlight {
            color: #e74c3c;
        }

        img {
            width: 100%;
            max-width: 800px;
            height: auto;
            display: block;
            margin: 20px auto;
            border-radius: 8px;
        }

        section {
            margin: 20px 200px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
        }

        section h2 {
            margin-bottom: 10px;
            color: #2c3e50;
        }

        section p {
            line-height: 1.8;
            margin: 10px 0;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            font-size: 1.1em;
            margin-bottom: 10px;
            padding-left: 20px;
            position: relative;
        }

        ul li:before {
            content: '✔';
            position: absolute;
            left: 0;
            color: #e74c3c;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content_gioithieu">
        <header>
            <h1>Giới thiệu <span class="highlight">P HOUSE</span></h1>
        </header>
        <div class="content_box">
            <section>
                <p>
                    Chung cư P HOUSE là biểu tượng của phong cách sống hiện đại, sang trọng và tiện nghi tại thành phố biển Đà Nẵng 
                    – nơi được mệnh danh là "thành phố đáng sống" của Việt Nam. Tọa lạc tại vị trí đắc địa, gần các trung tâm kinh tế, 
                    giải trí và chỉ cách bãi biển thơ mộng vài phút di chuyển, các căn hộ tại đây mang đến không gian sống trong lành và tiện ích vượt trội cho cư dân.
                </p>
                <p>
                    Với thiết kế tinh tế và đẳng cấp, chung cư P HOUSE được xây dựng theo phong cách kiến trúc xanh, 
                    tận dụng ánh sáng tự nhiên và tầm nhìn rộng mở hướng ra biển, sông Hàn, hoặc các công viên cây xanh. 
                    Dự án tích hợp hàng loạt tiện ích như hồ bơi, phòng gym hiện đại, khu vui chơi trẻ em, siêu thị mini, nhà hàng, 
                    và khu sinh hoạt cộng đồng, đáp ứng nhu cầu sống đa dạng của cư dân.
                </p>
                <p>
                    Được phát triển với tâm huyết tạo nên không gian sống hoàn hảo, chung cư Đà Nẵng không chỉ là nơi ở mà còn là nơi bạn tận hưởng 
                    cuộc sống trọn vẹn với gia đình. Đây chính là lựa chọn lý tưởng cho những ai tìm kiếm một môi trường sống tiện nghi, hiện đại và 
                    hài hòa giữa thiên nhiên và nhịp sống đô thị năng động.
                </p>
                <img src="https://moivaonhatoi.com/uploads/2020/05/chung-cu-la-gi-thumbnail.jpg" alt="">
                <h2>Vị trí</h2>
                <img src="https://toprealty.vn/mp-up/2021/04/the-ori-garden-da-nang-vi-tri.jpg" alt="">
                </section>
            <section>
                <h2>Tầm nhìn và sứ mệnh</h2>
                <p>
                    <strong>Tầm nhìn:</strong> Trở thành lựa chọn hàng đầu cho những cư dân trẻ năng động, yêu thích phong cách sống hiện đại.
                </p>
                <p>
                    <strong>Sứ mệnh:</strong> Cung cấp không gian sống chất lượng cao, kết hợp tiện ích đẳng cấp nhằm nâng tầm cuộc sống của cư dân.
                </p>
            </section>
    
            <section>
                <h2>Tiện ích nổi bật</h2>
                <ul>
                    <li>Hồ bơi vô cực với tầm nhìn hướng biển</li>
                    <li>Phòng gym và yoga trang bị hiện đại</li>
                    <li>Khu vui chơi trẻ em an toàn và sáng tạo</li>
                    <li>Trung tâm thương mại và siêu thị mini</li>
                    <li>Khu BBQ ngoài trời và không gian xanh thoáng đãng</li>
                    <li>Hệ thống an ninh 24/7 với camera giám sát</li>
                </ul>
            </section>
        </div>
    </div>
</asp:Content>
