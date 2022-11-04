package golf.club


import org.hibernate.envers.Audited
import org.hibernate.envers.RelationTargetAuditMode

//import user.UserService

@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
class Hole extends AbstractHole implements Serializable {


}
