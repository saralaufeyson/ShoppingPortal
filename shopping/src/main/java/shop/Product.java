package shop;
public class Product {
    private final int id;
    private final String name;
    private final double price;
    private int quantity;

    public Product(int id, String name, double price,int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity=quantity;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

  
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
	public int getQuantity() {
		// TODO Auto-generated method stub
		return quantity;
	}
	
	public double getTotalPrice() {
        return price * getQuantity();
	/*public double getTotalPrice() {
        return price * quantity;*/
    }

   

  
}
