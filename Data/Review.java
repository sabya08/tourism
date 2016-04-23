public class Review{
    private int reviewId;
    private int userId;
    private int productId;
    private int productRating;
    private String description;

    public Review(int reviewId, int userId, int productId, int productRating, String description) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.productId = productId;
        this.productRating = productRating;
        this.description = description;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductRating() {
        return productRating;
    }

    public void setProductRating(int productRating) {
        this.productRating = productRating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}