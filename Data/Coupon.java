public class Coupon{
    private int couponId;
    private String couponCode;
    private Date startDate;
    private Date endDate;
    private long discount;
    private boolean isActive;

    public Coupon(int couponId, String couponCode, Date startDate, Date endDate, long discount, boolean isActive) {
        this.couponId = couponId;
        this.couponCode = couponCode;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discount = discount;
        this.isActive = isActive;
    }

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public long getDiscount() {
        return discount;
    }

    public void setDiscount(long discount) {
        this.discount = discount;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
}