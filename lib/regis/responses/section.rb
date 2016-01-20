require 'regis/responses/base'
require 'regis/responses/models/section'

module Regis
    module Response
        class Section < Base
            attr_reader :section
            
            def initialize(json)
                @section = parse(json, Model::Section)
            end
        end
    end
end