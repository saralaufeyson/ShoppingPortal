package shop;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/shop?characterEncoding=latin1";
    private String jdbcUsername = "root";
    private String jdbcPassword = "sara";

    public List<Product> getProducts() {
        List<Product> prod = new ArrayList<>();

        String sql = "SELECT * FROM product";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");

                Product product = new Product(id, name, price,quantity);
                product.getQuantity();
                prod.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return prod;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO product (name, price,quantity) VALUES (?,?,?)";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setDouble(3, product.getQuantity());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE product SET name =?, price =? WHERE id =?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM product WHERE id =?";

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    public  double getTotalPrice() {
        double totalPrice = 0;

        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT SUM(price*quantity) AS total_price FROM product");) {

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalPrice = resultSet.getDouble("total_price");
            }
}
        catch (SQLException e) {
            e.printStackTrace();
        }
		return totalPrice;
    }}