<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie_List.aspx.cs" Inherits="Movie_Website.Movie_List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies List</title>
    <style>
        /* Global */
        body {
            background: #111;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #eee;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* Navbar */
        .navbar {
            background: #1c1c1c;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 25px;
        }
        .navbar .links {
            display: flex;
            gap: 10px;
        }
        .navbar a {
            color: #eee;
            padding: 12px 18px;
            text-decoration: none;
            transition: 0.3s;
        }
        .navbar a:hover, .navbar a.active {
            background: #e91e63;
            border-radius: 4px;
        }

        .search-container input {
            padding: 8px 14px;
            border-radius: 20px;
            border: none;
            outline: none;
            font-size: 14px;
            width: 200px;
        }

        /* Hamburger */
        .hamburger {
            display: none;
            font-size: 24px;
            cursor: pointer;
            color: #eee;
        }
        @media(max-width: 768px) {
            .navbar .links {
                display: none;
                flex-direction: column;
                background: #1c1c1c;
                position: absolute;
                top: 50px;
                right: 0;
                width: 200px;
            }
            .navbar .links.show {
                display: flex;
            }
            .hamburger {
                display: block;
            }
        }

        /* Page Title */
        .page-title {
            text-align: center;
            padding: 80px 20px 20px;
            font-size: 2em;
            font-weight: bold;
            background: linear-gradient(90deg, #e91e63, #9c27b0);
            -webkit-background-clip: text;
            color: transparent;
        }

        /* Filters */
        .filters {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin: 15px auto;
            flex-wrap: wrap;
        }
        .filters button, .filters select {
            background: #222;
            color: #eee;
            border: 1px solid #555;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            transition: 0.3s;
        }
        .filters button:hover, .filters select:hover {
            background: #e91e63;
            color: white;
        }

        /* Card Container */
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 22px;
            padding: 25px;
            margin: auto;
            max-width: 1300px;
        }

        /* Card */
        .card {
            position: relative;
            background: #1e1e1e;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 8px 18px rgba(0, 0, 0, 0.6);
        }

        .card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            display: block;
        }

        .card .overlay {
            position: absolute;
            bottom: -100%;
            left: 0;
            right: 0;
            background: rgba(0,0,0,0.85);
            padding: 15px;
            text-align: center;
            transition: 0.4s ease;
        }
        .card:hover .overlay {
            bottom: 0;
        }

        .card h3 {
            margin: 10px 0;
            color: #fff;
        }
        .card p {
            font-size: 13px;
            color: #ccc;
            margin: 6px 0;
        }
        .card a {
            display: inline-block;
            padding: 6px 14px;
            background: #e91e63;
            color: #fff;
            border-radius: 20px;
            text-decoration: none;
            margin-top: 8px;
            font-size: 14px;
        }

        /* Badge */
        .badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: #e91e63;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        /* Favorite Icon */
        .favorite {
            position: absolute;
            top: 12px;
            right: 12px;
            font-size: 22px;
            cursor: pointer;
            color: #bbb;
            transition: 0.3s;
        }
        .favorite:hover, .favorite.active {
            color: #e91e63;
            transform: scale(1.2);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <div class="navbar">
            <div class="hamburger" onclick="toggleMenu()">☰</div>
            <div class="links" id="navLinks">
                <a href="Home.aspx">Home</a>
                <a href="Movie_List.aspx" class="active">Movies</a>
                <a href="Admin.aspx">Admin</a>
                <a href="Registration.aspx">Registration</a>
                <a href="Your Openion.aspx">Public Opinion</a>
            </div>
            <div class="search-container">
                <input type="text" placeholder="Search movies..." onkeyup="searchMovies()" id="searchBar">
            </div>
        </div>

        <!-- Page Title -->
        <div class="page-title">🎬 Explore Movies</div>

        <!-- Filters -->
        <div class="filters">
            <button onclick="filterCategory('all')" type="button">All</button>
            <button onclick="filterCategory('action')" type="button">Action</button>
            <button onclick="filterCategory('comedy')" type="button">Comedy</button>
            <button onclick="filterCategory('horror')" type="button">Horror</button>
            <button onclick="filterCategory('sci-fi')" type="button">Sci-Fi</button>
            <button onclick="filterCategory('romance')" type="button">Romance</button>

            <select id="yearFilter" onchange="filterYear()">
                <option value="all">All Years</option>
                <option value="2025">2025</option>
                <option value="2024">2024</option>
                <option value="2023">2023</option>
            </select>

            <select id="ratingFilter" onchange="filterRating()">
                <option value="all">All Ratings</option>
                <option value="5">⭐⭐⭐⭐⭐</option>
                <option value="4">⭐⭐⭐⭐</option>
                <option value="3">⭐⭐⭐</option>
            </select>
        </div>

        <!-- Card Container -->
        <div class="card-container" id="movieCards">
            <asp:Repeater ID="rptData" runat="server">
                <ItemTemplate>
                    <div class="card" >
                        <span class="badge"> </span>
                        <span class="favorite">❤</span>
                        <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("Image") %>' AlternateText="Movie Poster"/>
                        <div class="overlay">
                            <h3><%# Eval("Name") %></h3>
                           
                            <p><a href='<%# Eval("Link") %>' target="_blank">Download</a></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- JS -->
        <script>
            function toggleMenu() {
                document.getElementById("navLinks").classList.toggle("show");
            }

            function searchMovies() {
                let input = document.getElementById("searchBar").value.toLowerCase();
                let cards = document.querySelectorAll(".card");
                cards.forEach(card => {
                    let title = card.querySelector("h3").innerText.toLowerCase();
                    card.style.display = title.includes(input) ? "" : "none";
                });
            }

            function filterCategory(category) {
                let cards = document.querySelectorAll(".card");
                cards.forEach(card => {
                    let cardCategory = card.getAttribute("data-category").toLowerCase();
                    card.style.display = (category === "all" || cardCategory === category) ? "" : "none";
                });
            }

            function filterYear() {
                let year = document.getElementById("yearFilter").value;
                let cards = document.querySelectorAll(".card");
                cards.forEach(card => {
                    let cardYear = card.getAttribute("data-year");
                    card.style.display = (year === "all" || cardYear === year) ? "" : "none";
                });
            }

            function filterRating() {
                let rating = document.getElementById("ratingFilter").value;
                let cards = document.querySelectorAll(".card");
                cards.forEach(card => {
                    let cardRating = card.getAttribute("data-rating");
                    card.style.display = (rating === "all" || cardRating >= rating) ? "" : "none";
                });
            }

            // Favorite toggle
            document.addEventListener("DOMContentLoaded", () => {
                document.querySelectorAll(".favorite").forEach(fav => {
                    fav.addEventListener("click", () => {
                        fav.classList.toggle("active");
                    });
                });
            });
        </script>
    </form>
</body>
</html>
