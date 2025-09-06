<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="Movie_Website.Article" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Article Page</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h1, h2 {
            color: #444;
        }

        /* Navbar Styling */
        nav {
            background-color: #3498db; /* Bright blue background */
            padding: 15px;
            position: sticky;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        nav a {
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            font-size: 18px;
            margin: 0 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        /* Content Layout Styling */
        .container {
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 1200px;
        }

        .form-section {
            width: 80%;
            max-width: 800px;
            padding: 30px;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            margin-bottom: 40px;
        }

        .form-section h2 {
            color: #3498db;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-section input, .form-section textarea {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-section textarea {
            height: 300px;
            resize: vertical;
        }

        .form-section input[type="file"] {
            padding: 8px;
        }

        .submit-btn {
            background-color: #27ae60; /* Green background for submit */
            color: white;
            padding: 15px 25px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #2ecc71; /* Light green on hover */
        }

        /* Content Section Styling */
        .content-section {
            width: 80%;
            max-width: 1000px;
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 8px;
            margin-top: 50px;
        }

        .content-area {
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            min-height: 300px;
            word-wrap: break-word;
            color: #2c3e50;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .form-section {
                width: 90%;
            }

            nav {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <a href="Home.aspx">Home</a>
        
        <a href="Movies_List.aspx">Movies</a>
         <a href="Registration.aspx">New Registration</a>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Form Section -->
        <div class="form-section">
            <h2>Submit Your Article</h2>
            <form id="form1" runat="server">
                <label for="FileUpload1">Image</label><br />
                <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />
                
                <label for="TextBox1">Name</label><br />
                <asp:TextBox ID="TextBox1" runat="server" /><br />
                <asp:RequiredFieldValidator 
                    ControlToValidate="TextBox1" 
                    InitialValue="" 
                    ErrorMessage="Name is required" 
                    ForeColor="Red" /><br /><br />
                
                <label for="TextBox2">Age</label><br />
                <asp:TextBox ID="TextBox2" runat="server" /><br />
                <asp:RequiredFieldValidator 
                    ControlToValidate="TextBox2" 
                    InitialValue="" 
                    ErrorMessage="Age is required" 
                    ForeColor="Red" /><br /><br />
                
                <label for="TextBox3">Date</label><br />
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" /><br />
                <asp:RequiredFieldValidator 
                    ControlToValidate="TextBox3" 
                    InitialValue="" 
                    ErrorMessage="Date is required" 
                    ForeColor="Red" /><br /><br />
                
                <label for="TextBox4">Content</label><br />
                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" rows="10" /><br />
                <asp:RequiredFieldValidator 
                    ControlToValidate="TextBox4" 
                    InitialValue="" 
                    ErrorMessage="Content is required" 
                    ForeColor="Red" /><br /><br />
                
                <!-- Validation Summary -->
                <asp:ValidationSummary 
                    ID="ValidationSummary1" 
                    runat="server" 
                    ForeColor="Red" 
                    HeaderText="Please fix the following errors:" 
                    ShowSummary="true" 
                    DisplayMode="List" />
                
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Article" class="submit-btn" />
            </form>
        </div>



        <!-- Content Section -->
        <div class="content-section">
            <h2>Sample Article Content</h2>
            <div class="content-area">
                <p>
                   Here, you can paste up to 150 words of content. This text area is designed to hold large amounts of content for the article. You can type or paste the content directly into this box. The content will wrap around as you add more text.
                </p>
                <p>
                    Feel free to explore the design and make it your own. This section provides a clean, readable area where you can showcase your content.
                </p>
            </div>
        </div>
    </div>

</body>
</html>
