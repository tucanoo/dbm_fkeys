package seller


import org.hibernate.envers.Audited

@Audited
class SellerState implements Serializable {

    static belongsTo = [seller: Seller]

    Integer fiscalYear

    static constraints = {
        seller nullable: false, unique: true
        fiscalYear nullable: false, min: 2012, max: 9999
    }

    static mapping = {
//        seller index:'UC_LIVE_SELLER_STATESELLER_ID_COL', unique:true
    }

    @Override
    String toString() {
        seller
    }
}
