<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Movie_Website.Home" %>

<!-- Styles All CSS in one place-->
<style>
    /* Basic Styles */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("Images/theme.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        display: flex;
        flex-direction: column;
    }


    /* Animation for header */
    h1 {
        text-align: center;
        color: #e91e63;
        margin-top: 30px;
        opacity: 0;
        transform: translateY(-50px);
        animation: slideInOut 3s ease-in-out infinite;
    }

    /* Keyframe for Slide In and Out Animation */
    @keyframes slideInOut {
        0% {
            opacity: 0;
            transform: translateY(-50px);
        }
        50% {
            opacity: 1;
            transform: translateY(0);
        }
        100% {
            opacity: 0;
            transform: translateY(-50px);
        }
    }

    /* Navbar Styles */
 .navbar-container {
            background-image: url("https://via.placeholder.com/1200x200/000000/FFFFFF?text=Navbar+Background");
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding: 14px 0;
            flex-wrap: wrap;
            transition: max-height 0.4s ease-in-out;
        }

        .navbar a {
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s;
            border-radius: 5px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar a.active {
            background-color: #e91e63;
            color: white;
        }

        .menu-icon {
            display: none;
            font-size: 30px;
            color: white;
            cursor: pointer;
            padding: 14px 20px;
            position: absolute;
            right: 10px;
            top: 10px;
            z-index: 9999; 
            background-color: rgba(0, 0, 0, 0.5); 
            border-radius: 5px;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
                background-color: rgba(0, 0, 0, 0.85);
                max-height: 0;
                overflow: hidden;
            }

            .navbar.show {
                max-height: 500px;
            }

            .menu-icon {
                display: block;
            }

            .navbar a {
                display: block;
                width: 100%;
                padding: 14px 20px;
            }
        }
    /* Login Form */
    #loginForm {
        display: none;
        background-color: white;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 30px;
        width: 100%;
        max-width: 400px;
        min-width: 280px;
        border-radius: 2px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        z-index: 100;
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #f3f3f3, #ffffff);
        border: 1px solid #ddd;
        box-sizing: border-box;
    }

    #loginForm input {
        margin-bottom: 20px;
        padding: 14px;
        width: 100%;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        box-sizing: border-box;
        transition: border 0.3s ease;
    }

    #loginForm input:focus {
        outline: none;
        border: 1px solid #e91e63;
    }

    #loginForm button {
        padding: 14px 18px;
        border: none;
        background-color: #e91e63;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    #loginForm button:hover {
        background-color: #c2185b;
    }

    /* Overlay Styles */
    .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 99;
    }

    /* Main Content Section */

    .content-section {
        padding: 50px;
        color: Blue;
       
        background-size: cover;
        text-align: center;
    }



    /* Movie Gallery Section */
    .movie-gallery {
        display: grid;
       
        gap: 20px;
        margin-top: 30px;
        margin-left:15px;
         grid-template-columns:  repeat(3, 1fr);
    }

    .movie-card {
        border :solid;
        background-color: transparent;
  border-radius: 3px;
  border-color: purple;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.1s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 15px;
  height: 31rem;
  width: 23rem;
    }

    .movie-card:hover {
        transform: translateY(-20px);
    }

    .movie-card img {
        width: 25rem;
        height: 18rem;
        max-height: 620px;
        object-fit: cover;
        margin-bottom: 10px;
    }

    .movie-card h3 {
        font-size: 1.2em;
        color: mediumvioletred;
        margin: 10px 0;
    }

    .movie-card p {
        color: white;
        margin: 10px 0;
    }
   



    /* Footer Styles */
    .footer {
        top:155vh;
       margin-left:54rem;
        width: 1307px;
        height:100px;
        background-color: #333;
        color: white;
       
        padding: 30px 20px;
        position: relative;
        left:-860px;
        bottom: 0;
        
    }
    
    .footer-container {
        display: flex;
        justify-content: space-between;
        
        flex-wrap: wrap;
    }

    .footer-info p {
        margin-left: 0;
        font-size: 14px;
    }

    .footer-links {
        margin-top: 10px;
    }

    .footer-links p {
        font-size: 25px;
        margin-bottom: 10px;
        margin-left:-150px;
    }

    .footer-links ul {
        list-style-type: none;
        padding: 0;
        margin-left:-150px;
        display: flex;
        gap: 25px;
    }

    .footer-links li {
        display: inline-block;
    }

    .footer-links a {
        color: white;
        text-decoration: none;
        font-size: 21px;
        transition: color 0.3s ease;
    }

    .footer-links a:hover {
        color: #e91e63;
    }

    .back-to-top {
        margin-top: 15px;
    }

    #backToTopBtn {
        margin-right:50px;
        background-color: #e91e63;
        color: white;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

        #backToTopBtn:hover {
            background-color: #c2185b;
        }




/* Movie REcomend*/

.Recm {
    margin-top: 50px;
    margin-left: 5rem;
    font-family: 'Cambria Math';
    font-size-adjust: 1;
    animation: flipEffect 12s ease-in-out infinite, colorChange 10s ease-in-out infinite;
}

@keyframes flipEffect {
    0% {
        transform: rotateY(0deg); /* Initial state */
    }
    50% {
        transform: rotateY(180deg); /* Half rotation */
    }
    100% {
        transform: rotateY(360deg); /* Full rotation */
    }
}

@keyframes colorChange {
    0% {
        color: #000000; /* Black */
    }
    25% {
        color: #FF5733; /* Red */
    }
    50% {
        color: darkgreen; /* Green */
    }
    75% {
        color: #3357FF; /* Blue */
    }
    100% {
        color: darkviolet; /* Back to black */
    }
}







/* News Section */


.news-section {
    display: flex;
    gap: 20px;
    justify-content: flex-start;
    margin-top: 110px;
    padding: 20px;
    overflow: hidden; /* Hide overflow for smooth animation */
    position: relative;
    border-radius:1px;
}



/* Apply sliding animation to the entire section */
.news-slider-controls {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
    margin-top: 50px;
}

.news-slider {
    width: 90%;
    max-width: 1100px;
    overflow: hidden;
}

.news-group {
    display: none;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

.news-card {
    background-color: #fff;
    border-radius: 0;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    text-align: center;
    transition: transform 0.3s ease;
}

.news-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 2px;
}

.news-card h3 {
    margin-top: 10px;
    color: #e91e63;
}

.news-slider-controls button {
    background-color: #e91e63;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 20px;
    border-radius: 0px;
    cursor: pointer;
}


</style>

<!-- Navbar -->
 <div class="navbar-container">
        <div class="menu-icon" onclick="toggleMenu()">☰</div>
        <div class="navbar" id="navbar">
            <a href="Homepage.aspx" class="active">Home</a>
            <a href="Movie_List.aspx">Movies</a>
            <a href="Admin.aspx">Admin</a>
            <a href="Registration.aspx">Registration</a>
            <a href="Your Openion.aspx">Public Opinion</a>
            <a href="#" id="loginLink">Write Here...</a>
        </div>
    </div>

<!-- Login Form -->
<div id="loginForm">
    <form runat="server">
        <label for="Email">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" required></asp:TextBox>
        
        <label for="Password">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password" required></asp:TextBox>
        
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <br/>
       <asp:Button ID="Register" runat="server" Text="Registration"   OnClientClick="window.location='Registration.aspx'"/>

    </form>
</div>

<!-- Main Content Section -->
<div class="content-section">
    <h1>Welcome to Movie World</h1>
</div>

<!-- Movie Gallery Section -->
<div class="movie-gallery">
    <div class="movie-card">
        <img src="Images/legend.png" alt="Movies">
        
        <h3>Movies Reflection</h3>
        <p>"Movies often reflect real life, showing us human emotions, social issues, and personal struggles. They entertain, but also make us think, feel, and connect with different perspectives. Through stories, films help us understand the world and ourselves better."</p>
    
        </div>
    <div class="movie-card">
        <img src="Images/Screenshot (89).png" alt="Movies">
     
        <h3>Speak with Us</h3>
        <p>""Movies teach us that the good guy always wins, and that every problem can be solved in just two hours, but in real life, victories often take time, and not all battles are as clear-cut. The complexity of human struggles doesn’t fit into neat narratives, and sometimes, the real challenge lies in simply navigating through uncertainty and finding a way forward, no matter how long it takes."..."</p>
    </div>
         
    <div class="movie-card">
        <img src="Images/download.png" alt="Movies" >
         
        <h3>Imagination Unleashed</h3>
        <p>"Movies are the vivid manifestation of imagination, bringing to life stories, dreams, and ideas that would otherwise remain in our minds..."</p>
   

    </div>
</div>


<!-- Recommdation section -->

<div class="Recm">

   
    OUR RECOMMENDATION
</div>

<!-- News Section with Swipe -->
<!-- News Carousel Section -->
<div class="news-wrapper">
    <div class="news-slider-controls">
        <button onclick="showPrevSlide()">&#8592;</button>
        <div class="news-slider" id="newsSlider">
            <div class="news-group">
                <div class="news-card">
                    <img src="Images/omg2.jpg" alt="OMG 2">
                    <h3>OMG 2</h3>
                    <p>Great movie on Indian Education System</p>
                    <p onclick="window.location.href='https://youtube.com'">Watch Now</p>
                </div>
                <div class="news-card">
                    <img src="Images/9cdd1b371423913fe4a60f397a7a1a74.jpg" alt="MERA NAAM JOKER">
                    <h3>MERA NAAM JOKER</h3>
                    <p>Timeless emotional drama</p>
                    <p onclick="window.location.href='https://youtube.com'">Watch Now</p>
                </div>
                <div class="news-card">
                    <img src="Images/hq720.jpg" alt="Solva Saal">
                    <h3>Solva Saal</h3>
                    <p>Classic Bollywood Romance</p>
                    <p onclick="window.location.href='https://youtube.com'">Watch Now</p>
                </div>
            </div>

            <div class="news-group">
                <div class="news-card">
                    <img src="Images/4882864.jpg" alt="Rangasthalam">
                    <h3>Rangasthalam</h3>
                    <p>Rural Action Drama</p>
                    <p onclick="window.location.href='https://youtube.com'">Watch Now</p>
                </div>
                <div class="news-card">
                    <img src="Images/bramyugam.jpg" alt="Brahmyugam">
                    <h3>Brahmyugam</h3>
                    <p>Psychological Thriller</p>
                    <p onclick="window.location.href='https://youtube.com'">Watch Now</p>
                </div>
                <div class="news-card">
                    <img src="Images/download.png" alt="Bonus">
                    <h3>Bonus Movie</h3>
                    <p>Must Watch</p>
                    <p onclick="window.location.href='https://youtube.com'">Watch Now</p>
                </div>
            </div>
        </div>
        <button onclick="showNextSlide()">&#8594;</button>
    </div>
</div>
  
    



<!-- Footer Section -->
<!-- Footer Section Start -->
<div class="footer">
    <div class="footer-container">

        <!-- Info -->
        <div class="footer-info">
            <p>&copy; <span id="currentYear"></span> Movie Website | All rights reserved.</p>
        </div>

        <!-- Social Links -->
        <div class="footer-links">
            <p>Follow us on:</p>
            <ul>
                <li><a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i> Facebook</a></li>
                <li><a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i> Twitter</a></li>
                <li><a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i> Instagram</a></li>
            </ul>
        </div>

        <!-- Back to Top Button -->
        <div class="back-to-top">
            <button id="backToTopBtn">Back to Top</button>
        </div>

        <!-- Contact Info -->
        <div class="footer-contact">
            <p>Email: support@moviewebsite.com</p>
            <p>Phone: +91-9876543210</p>
        </div>
    </div>

    <!-- Bottom Bar 
    <div class="footer-bottom">
        <p>Designed & Developed by Abhishek Pathak | Movie Website Project</p>
    </div>-->
</div>
<!-- Footer Section End -->



<!-- Script for Dynamic Year and Back to Top Button -->
<script>

    // nav
    function toggleMenu() {
        var navbar = document.getElementById("navbar");
        navbar.classList.toggle("show");
    }

    //news section start


        let currentGroup = 0;
        const groups = document.querySelectorAll('.news-group');

        function updateSlider() {
            groups.forEach((group, index) => {
                group.style.display = (index === currentGroup) ? 'grid' : 'none';
            });
    }

        function showNextSlide() {
            currentGroup = (currentGroup + 1) % groups.length;
        updateSlider();
    }

        function showPrevSlide() {
            currentGroup = (currentGroup - 1 + groups.length) % groups.length;
        updateSlider();
    }

        window.onload = updateSlider;



    //News Section END




    document.getElementById("loginLink").onclick = function () {
        var loginForm = document.getElementById("loginForm");
        loginForm.style.display = loginForm.style.display === "none" ? "block" : "none";
    };

    // Set the current year dynamically in the footer
    document.getElementById("currentYear").textContent = new Date().getFullYear();

    // Scroll to top functionality
    var backToTopBtn = document.getElementById("backToTopBtn");

    // When the user scrolls down 100px from the top of the document, show the button
    window.onscroll = function () {
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            backToTopBtn.style.display = "block";
        } else {
            backToTopBtn.style.display = "none";
        }
    };

    // When the user clicks on the button, scroll to the top of the document
    backToTopBtn.onclick = function () {
        window.scrollTo({ top: 0, behavior: "smooth" });
    };


    
</script>
