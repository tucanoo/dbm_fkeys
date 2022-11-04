package seller

import org.hibernate.envers.Audited

@Audited
class Seller implements Serializable {


    Long id

    String displayName

    static hasOne = [
        sellerState: SellerState
    ]

    static constraints = {
        displayName nullable: false, size: 1..100, blank: false, unique: true
        sellerState nullable: true
    }

    static mapping = {
        sellerState lazy: true
//        displayName defaultValue: 'NULL'
    }


}
