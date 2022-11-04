package golf.club


import org.hibernate.envers.Audited
import org.hibernate.envers.RelationTargetAuditMode

@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
//@EqualsAndHashCode( includes =  "id" )
abstract class AbstractHole implements Serializable {

  //String displayName
  //String shortName

  Long id
  int number

  static mapping = {
    tablePerHierarchy false
  }

}
