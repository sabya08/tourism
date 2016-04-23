public class Offer{
    private int offerId;
    private String offerDescription;
    private Date startDate;
    private Date endDate;

    public Offer(int offerId, String offerDescription, Date startDate, Date endDate) {
        this.offerId = offerId;
        this.offerDescription = offerDescription;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getOfferId() {
        return offerId;
    }

    public void setOfferId(int offerId) {
        this.offerId = offerId;
    }

    public String getOfferDescription() {
        return offerDescription;
    }

    public void setOfferDescription(String offerDescription) {
        this.offerDescription = offerDescription;
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
}