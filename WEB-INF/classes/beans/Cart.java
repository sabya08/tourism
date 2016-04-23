package beans;
public class Cart {
	private String id;	
	private String name;
  private String imageUrl;
	private int price;
	private int quantity;

public Cart(){}

	public String getId() {
    return(id);
  }

  public void setId(String id) {
    this.id = id;
  } 

	public String getName() {
    return(name);
  }

  public void setName(String name) {
    this.name = name;
  } 

  public String getImageUrl() {
    return(imageUrl);
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  } 

public int getPrice() {
    return(price);
  }

  public void setPrice(int price) {
    this.price = price;
  } 

  public int getQuantity() {
    return(quantity);
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  } 

}
