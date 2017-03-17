module MatParser
    class Material
        attr_accessor   :path, 
                        :name, 
                        :thumb, 
                        :blend,
                        :color,
                        :tags,
                        :category,
                        :author,
                        :maps

        def initialize
            @maps = Map.new
        end

        class Map
            attr_accessor :diffuse,
                          :reflection,
                          :roughness,
                          :height,
                          :normal
        end
    end
end