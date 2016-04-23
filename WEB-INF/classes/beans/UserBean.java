package beans;

public class UserBean{
  
  private String id;
	private String firstName;
	private String lastName;
	private String userName;
	private String password;
	private String email;
  private String role;
	private String shippingAddress;
  private Boolean isActive;

 public String getId() {
    return(id);
  }

  public void setId(String id) {
    this.id = id;
  } 

   public String getEmail() {
    return(email);
  }

  public void setEmail(String email) {
    this.email = email;
  } 
  public String getFirstName() {
    return(firstName);
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }
public String getLastName() {
    return(lastName);
  }
public void setLastName(String lastName) {
    this.lastName = lastName;
  }
  public void setUserName(String userName) {
    this.userName = userName;
  }
public String getUserName() {
    return(userName);
  }
  public void setPassword(String password) {
    this.password = password;
  }
public String getPassword() {
    return(password);
  }
  public void setRole(String role) {
    this.role = role;
  } 
  public String getRole() {
    return(role);
  }
 public void setShippingAddress(String shippingAddress) {
    this.shippingAddress = shippingAddress;
  }
public String getShippingAddress() {
    return(shippingAddress);
  }

   public void setIsActive(Boolean isActive) {
    this.isActive = isActive;
  }
public Boolean getIsActive() {
    return(isActive);
  }
}
