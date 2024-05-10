<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="shop.Product" %>
<%@ page import="java.io.IOException" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>

<html>
<head>
    <title>Shopping Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1{
           background-color: #af804f;
            color: #fff;
            margin: 0;
            padding: 1rem;
            text-align: center;
        }
        nav {
            background-color: #af804f;
            padding: 1rem;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin-right: 1rem;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 1rem;
        }
        .product {
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            padding: 1rem;
            width: 30%;
            margin-bottom: 1rem;
        }
        .product img {
            width: 100%;
            height: auto;
        }
        .product h2 {
            margin: 0;
            padding: 0.5rem 0;
        }
        .product p {
            margin: 0;
            padding: 0.5rem 0;
        }
        .product a {
            
            background-color: #af804f;
            color: #fff;
            padding: 0.5rem;
            text-decoration: none;
            display: block;
            margin-top: 1rem;
        }
        .product img:hover {
    transform: scale(1.1);
    transition: transform 0.3s ease;
}
@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}


    </style>
</head>
<body>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products.jsp">My cart</a>
        <a href="login.jsp">Login/Logout</a>
      
    </nav>
    <h1>Your shopping zone</h1>
    <center><h2>One stop solution for all your needs</h2></center>
    <h3>Browse categories...</h3>
    <div class="container">
        <div class="product">
     
<img src="https://www.u2kinternational.com/wp-content/uploads/2020/04/Electronics_Banner-1536x682.png"/>   
<h2>Electronics deals</h2>
            <p>$9.99 onwards..</p>
            <a href="products.jsp">Add to Cart</a>
          
        </div>
        <div class="product">
            <img src="https://th.bing.com/th/id/R.b34118f5f050ec13b50a14d876f58558?rik=5bQQECmgsenD3g&riu=http%3a%2f%2fgraphicgoogle.com%2fwp-content%2fuploads%2f2017%2f10%2fFacebook-New-Fashion-Sale-Banner.jpg&ehk=cZjhCfdi%2fqQLhrZBnjXF%2bq65d%2fwT4aEvKaZvpY%2bGvhI%3d&risl=&pid=ImgRaw&r=0" alt="Product 2">
            <h2>Fashion aparels</h2>
            <p>$19.99 onwards</p>
            <a href="products.jsp">Add to Cart</a>
        </div>
        <div class="product">
            <img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/toys-sale-banner-design-template-55c7b108773cc559e86b6d886f7fa304_screen.jpg?ts=1606734612" alt="Product 3">
            <h2>toys and games</h2>
            <p>$29.99 onwards</p>
            <a href="products.jsp">Add to Cart</a>
        </div>
     </div>
       <div class="container">
        <div class="product">
            <img src="https://s3.envato.com/files/228955216/01_Preview%203.jpg" alt="Product 1">
            <h2>Food products</h2>
            <p>$9.99 onwards</p>
            <a href="products.jsp">Add to Cart</a>
          
        </div>
        <div class="product">
            <img src="https://static.vecteezy.com/system/resources/previews/003/692/287/original/big-sale-discount-promotion-banner-template-with-blank-product-podium-scene-graphic-free-vector.jpg" alt="Product 2">
            <h2>software products</h2>
            <p>$19.99</p>
            <a href="products.jsp">Add to Cart</a>
        </div>
        <div class="product">
            <img src="https://s3.envato.com/files/145279023/01_preview3.jpg" alt="Product 3">
            <h2>fitness goals</h2>
            <p>$29.99</p>
            <a href="products.jsp">Add to Cart</a>
        </div>
     </div>
       <div class="container">
        <div class="product">
            <img src="https://graphicsfamily.com/wp-content/uploads/edd/2020/05/Auto-Company-Ad-Banner-Design-870x489.jpg" alt="Product 1">
            <h2>vehicles</h2>
            <p>$99.99</p>
            <a href="products.jsp">Add to Cart</a>
          
        </div>
        <div class="product">
            <img src="https://image.freepik.com/free-vector/beauty-skin-care-product-banner_33099-2057.jpg" alt="Product 2">
            <h2>Skin care</h2>
            <p>$19.99</p>
            <a href="products.jsp">Add to Cart</a>
        </div>
        <div class="product">
            <img src="https://th.bing.com/th/id/OIP.dsct9jfteTTbXysH8a51lgHaEK?rs=1&pid=ImgDetMain" alt="Product 3">
            <h2>Books</h2>
            <p>$29.99</p>
            <a href="products.jsp">Add to Cart</a>
        </div>
     </div>
    <script>
    const image = document.querySelector('.product img');

    image.addEventListener('click', function() {
        const animation = image.animate([
            { transform: 'scale(1)', opacity: 1 },
            { transform: 'scale(1.5)', opacity: 0.5 }
        ], {
            duration: 500,
            iterations: 1
        });

        animation.onfinish = function() {
            image.style.transform = 'scale(1)';
            image.style.opacity = 1;
        };
    });
    </script>
</body>
</html>