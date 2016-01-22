require 'regis/responses/base'
require 'regis/responses/models/section'

module Regis
    module Response
        class Sections < Base
            attr_reader :sections
            
            def initialize(json)                
                @sections = parse(json, Model::Section)
            end
        end
    end
end