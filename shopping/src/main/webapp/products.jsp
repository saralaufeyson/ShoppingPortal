<%@ page import="java.util.List" %>
<%@ page import="shop.Product" %>
<%@ page import="shop.ProductDao" %>
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
            background-color:#af804f;
            padding: 1rem;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin-right: 1rem;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 0.5rem;
            text-align: left;
            color:#af804f;
        }
        h2{ color:#af804f;}
        th {
            background-color: #f2f2f2;
            font-weight: normal;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        form {
            margin: 1rem;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 0.5rem;
        }
        input[type="submit"] {
            padding: 0.5rem;
            background-color: #af804f;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        input[type="button"] {
            padding: 0.5rem;
            background-color: #af804f;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>


<body>
    <h1>Your shopping list</h1>
     <nav>
        <a href="index.jsp">Home</a>
        <a href="index.jsp">Products</a>
        <a href="login.jsp">Login/logout</a>
    </nav>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products!= null) {
                    for (Product product : products) {
            %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td><%= product.getTotalPrice() %></td>
                
                <td>
                    <form action="products" method="post">
                        <input type="hidden" name="id" value="<%= product.getId() %>">
                        <input type="text" name="name" value="<%= product.getName() %>" required>
                        <input type="number" name="price" value="<%= product.getPrice() %>" step="0.01" required>
                        <input type="number" name="quantity" value="<%= product.getQuantity() %>" min="1" required>
                        <input type="hidden" name="action" value="update">
                        <input type="submit" value="Update">
                    </form>
                    <form action="products" method="post">
                        <input type="hidden" name="id" value="<%= product.getId() %>">
                        <input type="hidden" name="action" value="delete">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <h2> Total bill: <%= new ProductDao().getTotalPrice() %></h2>
     
   
  
    <h2>Add Product</h2>
    <form action="products" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" placeholder="Name" required>
        <input type="number" name="price" placeholder="Price" step="0.01" required>
        <input type="number" name="quantity" placeholder="Quantity" min="1" required>
        <input type="submit" value="Add">
    </form>
    
    <h2>Confirm Checkout</h2>
    <form action="checkout" method="post">
        <input type="hidden" name="action" value="confirm">
        <input type="button" value="Confirm Checkout" onclick="alert('Thank you for shopping with us!')">
    </form>
 
</body>
</html>