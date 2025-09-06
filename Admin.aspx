<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Movie_Website.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Movie Upload</title>
    <style>
        /* General Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h2 {
            color: #e91e63;
            text-align: center;
            padding: 10px 0;
            font-size: 1.8em;
        }

        /* Form Section */
        .form-group {
            margin-bottom: 15px;
            background-color: #fff;
            border-radius: 8px;
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            color: #4CAF50;
            font-weight: bold;
        }

        .form-group input[type="text"], .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .form-group input[type="text"]:focus, .form-group input[type="file"]:focus {
            border-color: #4CAF50;
        }

        .form-group input[type="button"], .form-group input[type="submit"] {
            background-color: #e91e63;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .form-group input[type="button"]:hover, .form-group input[type="submit"]:hover {
            background-color: #d81b60;
        }

        /* Error/Success Message */
        .error {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 15px;
        }

        /* Movies List Section */
        .movies-list {
            background-color: #ffffff;
            border-radius: 10px;
            margin-top: 30px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* GridView Styling */
        .movies-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .movies-list th, .movies-list td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .movies-list th {
            background-color: #4CAF50;
            color: white;
        }

        .movies-list tr:hover {
            background-color: #f9f9f9;
        }

        .movies-list td img {
            border-radius: 5px;
            width: 50px;
            height: 50px;
        }

        /* GridView Command Buttons */
        .movies-list .command-buttons {
            text-align: center;
        }

        .movies-list .command-buttons button {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s;
        }

        .movies-list .command-buttons button:hover {
            background-color: #1976D2;
        }

        /* Modal Styling (If needed for Login or other functionalities) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            float: right;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Upload Form Section -->
            <h2>Upload Movie Details</h2>
            
            <div class="form-group">
                <label for="TextBox1">Movie Name:</label>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter movie name"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="TextBox2">Movie Link:</label>
                <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter movie link"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="TextBox3">Movie Size:</label>
                <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter movie size"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="FileUpload1">Upload Movie Image:</label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
            
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
            </div>
            
            <!-- Display Error/Success Messages -->
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="False" CssClass="error"></asp:Label>
            
            <!-- Movies List Section -->
            <h2>Movies List</h2>
            <div class="movies-list">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
                              
           
                    <Columns>
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" />
                        <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
