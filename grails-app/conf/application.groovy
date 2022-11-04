hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
//  cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
//  cache.provider_class='org.hibernate.cache.EhCacheProvider'

    tablePrefix = 'live_'
    naming_strategy = util.CustomNamingStrategy

    jdbc.batch_size = 50
}