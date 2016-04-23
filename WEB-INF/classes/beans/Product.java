package beans;

public class Product{
  
  private String id;
	private String name;
	private String retailerName;
  private String manufacturer;
	private double price;
	private String category;
	private String imageUrl;
  private String description;
	private String rebate;
  private Boolean isActive;
  private Boolean isOnSale;
  
  public Product(String name,String manufacturer,double price,String category,String imageUrl,String description, String rebate,Boolean isActive,Boolean isOnSale){
    this.name=name;
    this.manufacturer=manufacturer;
    this.price=price;
    this.category=category;
    this.imageUrl=imageUrl;
    this.description=description;
    this.rebate=rebate;
    this.isActive=isActive;
    this.isOnSale=isOnSale;
  }

    public Product(String id, String name,String manufacturer,double price,String category,String imageUrl,String description, String rebate,Boolean isActive,Boolean isOnSale){
        this.id = id;
        this.name=name;
        this.manufacturer=manufacturer;
        this.price=price;
        this.category=category;
        this.imageUrl=imageUrl;
        this.description=description;
        this.rebate=rebate;
        this.isActive=isActive;
        this.isOnSale=isOnSale;
    }

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

   public String getRetailerName() {
    return(retailerName);
  }

  public void setRetailerName(String retailerName) {
    this.retailerName = retailerName;
  } 
public String getManufacturer() {
    return(manufacturer);
  }

  public void setManufacturer(String manufacturer) {
    this.manufacturer = manufacturer;
  } 
   public double getPrice() {
    return(price);
  }

  public void setPrice(double price) {
    this.price = price;
  } 

  public String getCategory() {
    return(category);
  }

  public void setCategory(String category) {
    this.category = category;
  } 
public String getImageUrl() {
    return(imageUrl);
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  } 
  public String getDescription() {
    return(description);
  }

  public void setDescription(String description) {
    this.description = description;
  } 

  public String getRebate() {
    return(description);
  }

  public void setRebate(String description) {
    this.description = description;
  }
  public Boolean getIsActive() {
    return(isActive);
  }

  public void setIsActive(Boolean isActive) {
    this.isActive = isActive;
  }
  public Boolean getIsOnSale() {
    return(isOnSale);
  }

  public void setIsOnSale(Boolean isOnSale) {
    this.isOnSale = isOnSale;
  }
}
