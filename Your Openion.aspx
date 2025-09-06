<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Your Openion.aspx.cs" Inherits="Movie_Website.Your_Openion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Public Opinion</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Navbar Styles */
        .navbar {
            background-color:orchid;
            padding: 14px 0;
            display: flex;
            justify-content: center;
            gap: 20px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background 0.3s;
        }

        .navbar a:hover {
            background-color: #e91e63;
        }

        .navbar a.active {
            background-color: #e91e63;
        }

        /* Main Container */
        .repeater-container {
            max-width: 1200px;
            margin: 120px auto 40px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 0 20px;
        }

        /* Card Style */
        .repeater-item {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s ease;
        }

        .repeater-item:hover {
            transform: translateY(-8px);
        }

        /* Profile Image */
        .repeater-item img {
            border-radius: 50%;
            border: 3px solid #e91e63;
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        /* Text Content */
        .repeater-text {
            text-align: center;
        }

        .repeater-text h3 {
            margin: 0;
            font-size: 1.2em;
            color: #333;
        }

        .repeater-text p {
            margin: 8px 0;
            font-size: 0.95em;
            color: #555;
        }

        .repeater-text strong {
            color: #e91e63;
        }

        @media (max-width: 500px) {
            .navbar {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="Home.aspx">Home</a>
        <a href="Movie_List.aspx">Movies</a>
        <a href="Registration.aspx">Registration</a>
        <a href="Your Openion.aspx" class="active">Public Opinion</a>
    </div>

    <!-- Repeater Section -->
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <div class="repeater-container">
        </HeaderTemplate>

        <ItemTemplate>
            <div class="repeater-item">
                <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("Image") %>' />
                <div class="repeater-text">
                    <h3><%# Eval("Name") %></h3>
                    <p><strong>Age:</strong> <%# Eval("Age") %></p>
                    <p><strong>Date:</strong> <%# Eval("Date") %></p>
                    <p><strong>Content:</strong> <%# Eval("Content") %></p>
                </div>
            </div>
        </ItemTemplate>

        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <form id="form1" runat="server"></form>
</body>
</html>
