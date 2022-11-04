package patches


import org.hibernate.boot.spi.MetadataImplementor
import org.hibernate.envers.boot.internal.EnversService
import org.hibernate.envers.boot.internal.EnversServiceImpl
import org.hibernate.envers.boot.internal.EnversServiceInitiator
import org.hibernate.envers.configuration.internal.MappingCollector
import org.hibernate.service.spi.ServiceRegistryImplementor
import org.springframework.context.annotation.Configuration
import org.springframework.util.ReflectionUtils

import java.lang.reflect.Field
import java.lang.reflect.Modifier

/**
 * FIXME: horrible reflection hack of envers to ensure compatibility with database-migration
 * metadata for two databases (gorm/real) is built causing double initialization of the EnversServiceImpl
 * overriding with hibernate service contributor spi did not work because order is random and ootb EnversServiceContributor still takes precedence
 * using a custom HibernateMappingContextConfiguration worked partially - _aud tables missing in dbm diff..
 */

@Configuration
class CustomEnversConfig {
    static {
        Field enversServiceInitiatorInstanceField = ReflectionUtils.findField EnversServiceInitiator, "INSTANCE"
        int modifiers = enversServiceInitiatorInstanceField.modifiers
        Field modifierField = enversServiceInitiatorInstanceField.class.getDeclaredField "modifiers"
        modifiers = modifiers & ~Modifier.FINAL
        modifierField.setAccessible true
        modifierField.setInt enversServiceInitiatorInstanceField, modifiers
        ReflectionUtils.setField enversServiceInitiatorInstanceField, null, new CustomEnversServiceImplInitiator()
    }

    static class CustomEnversServiceImplInitiator extends EnversServiceInitiator {

        @Override
        EnversService initiateService(Map configurationValues, ServiceRegistryImplementor registry) {

            // Insert table suffix here else it will be interpreted as a map and never detected!!
            configurationValues.put('org.hibernate.envers.audit_table_suffix', '_aud')

            return new CustomEnversServiceImpl()
        }

    }

    static class CustomEnversServiceImpl extends EnversServiceImpl {

        @Override
        void initialize(final MetadataImplementor metadata, final MappingCollector mappingCollector) {
            Field initializedField = ReflectionUtils.findField(this.class, "initialized")
            ReflectionUtils.makeAccessible initializedField
            ReflectionUtils.setField initializedField, this, false
            super.initialize metadata, mappingCollector
        }

    }
}
