public class Order{

    private int orderId;
    private int userId;
    private int productId;
    private Date orderDate;
    private Date deliveryDate;
    private long totalPrice;

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    private String orderStatus;

    public Order(int orderId, int userId, int productId, Date orderDate, Date deliveryDate, long totalPrice, String orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.productId = productId;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.totalPrice = totalPrice;
        this.orderStatus = orderStatus;
    }


}