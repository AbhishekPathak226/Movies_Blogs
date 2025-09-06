<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Movie_Website.Registration" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            background-image: url('images/WhatsApp Image 2024-12-24 at 1.17.11 PM.jpeg');
            background-position: top center;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: #333;
            height: 200vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #e91e63;
            color: white;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
            height: 100%;
            max-height: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            margin-left: 25rem;
        }

        h2 {
            color: #e91e63;
            text-align: left;
            padding: 10px 0;
            font-size: 1.5em;
        }

        .form-group {
            font-size: 16px;
            margin-bottom: 15px;
            color: #555;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group input[type="file"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .form-group input[type="button"],
        .form-group input[type="submit"],
        .form-group button {
            background-color: #e91e63;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .form-group input[type="button"]:hover,
        .form-group input[type="submit"]:hover,
        .form-group button:hover {
            background-color: #d81b60;
        }

        .error {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 15px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: lightgreen;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .form-group input[type="submit"] {
            width: 100%;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <!-- Navbar -->
        <div class="navbar">
            <a href="Home.aspx">Home</a>
            <a href="Registration.aspx" class="active">Register</a>
            <a href="Movie_List.aspx">Movies</a>
             <a href="Your Openion.aspx">Public Openion</a>
   
          <!--  <a href="#" onclick="document.getElementById('loginModal').style.display='block'">Login</a>-->
        </div>

        <div class="form-container">
            <h2>Register Here</h2>

            <!-- Form Fields -->

            <!-- Name -->
            <div class="form-group">
                <label for="TextBox1">Name:</label>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your name"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="TextBox1" 
                    ErrorMessage="Name is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Age -->
            <div class="form-group">
                <label for="TextBox5">Age:</label>
                <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter your age"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator2" 
                    runat="server" 
                    ControlToValidate="TextBox5" 
                    ErrorMessage="Age is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Gender -->
            <div class="form-group">
                <label for="DropDownList1">Gender:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="100%">
                    <asp:ListItem>Select--</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator3" 
                    runat="server" 
                    ControlToValidate="DropDownList1" 
                    InitialValue="Select--" 
                    ErrorMessage="Gender is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="TextBox6">Email Id:</label>
                <asp:TextBox ID="TextBox6" runat="server" placeholder="Enter your Email"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" 
                    runat="server" 
                    ControlToValidate="TextBox6" 
                    ErrorMessage="Email is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- City -->
            <div class="form-group">
                <label for="TextBox2">City:</label>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter your city"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator5" 
                    runat="server" 
                    ControlToValidate="TextBox2" 
                    ErrorMessage="City is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="TextBox3">Password:</label>
                <asp:TextBox ID="TextBox3" runat="server" placeholder="Create new password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator6" 
                    runat="server" 
                    ControlToValidate="TextBox3" 
                    ErrorMessage="Password is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="TextBox7">Confirm Password:</label>
                <asp:TextBox ID="TextBox7" runat="server" placeholder="Repeat your password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator7" 
                    runat="server" 
                    ControlToValidate="TextBox7" 
                    ErrorMessage="Confirm Password is required" 
                    ForeColor="#FF3300">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
            </div>

            <!-- Error Label -->
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
