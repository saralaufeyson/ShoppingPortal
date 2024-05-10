package shop;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/", "/products"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDAO = new ProductDao();

    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();

		if (servletPath.equals("/")) {
            // Forward to the home page (index.jsp)
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);}
		
		
            else if (servletPath.equals("/products")){
		
		List<Product> products = productDAO.getProducts();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
        dispatcher.forward(request, response);

		response.getWriter().append("Served at: ").append(request.getContextPath());}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");

	        if (action!= null && action.equals("add")) {
	            String name = request.getParameter("name");
	            double price = Double.parseDouble(request.getParameter("price"));
int quantity=Integer.parseInt(request.getParameter("quantity"));
	            Product product = new Product(0, name, price,quantity);
	            productDAO.addProduct(product);

	            response.sendRedirect("products");
	        } else if (action!= null && action.equals("update")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            String name = request.getParameter("name");
	            double price = Double.parseDouble(request.getParameter("price"));
	            int quantity=Integer.parseInt(request.getParameter("quantity"));

	            Product product = new Product(id, name, price,quantity);
	            productDAO.updateProduct(product);

	            response.sendRedirect("products");
	        } else if (action!= null && action.equals("delete")) {
	            int id = Integer.parseInt(request.getParameter("id"));

	            productDAO.deleteProduct(id);

	            response.sendRedirect("products");
	        }
	    }

	    private double getTotalPrice(List<Product> products) {
	        double totalPrice = 0;

	        for (Product product : products) {
	            totalPrice += product.getTotalPrice();
	        }

	        return totalPrice;
	    }
	}