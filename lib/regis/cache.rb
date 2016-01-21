module Regis
    class Cache
        attr_accessor :store
        
        def initialize(store)
            @store = store
        end

        def write(key, value)
            @store.set(key, value)
        end

        def read(key)
            @store.get(key)
        end
        
        def delete(key)
            @store.delete(key)
        end
    end
end