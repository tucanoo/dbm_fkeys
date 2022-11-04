package util


import org.hibernate.cfg.ImprovedNamingStrategy

class CustomNamingStrategy extends ImprovedNamingStrategy {

  final String prefix = 'live_'

  @Override
  String classToTableName( String className ) {
    prefix +  super.classToTableName( className ).toLowerCase()
  }



  @Override
  String collectionTableName(String ownerEntity, String ownerEntityTable, String associatedEntity, String associatedEntityTable, String propertyName) {

    return prefix + super.collectionTableName(ownerEntity, ownerEntityTable, associatedEntity, associatedEntityTable, propertyName).toLowerCase()

  }


}
