public class Category{
    private int categoryId;
    private String categoryName;
    private boolean isActive;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Category(int categoryId, String categoryName, boolean isActive) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.isActive = isActive;
    }
}