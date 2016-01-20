require 'regis/responses/base'
require 'regis/responses/models/section'

module Regis
    module Response
        class Sections < Base
            attr_reader :sections
            
            def initialize(json)
                super(json)
                
                @sections = parse(@sections, Model::Section)
            end
        end
    end
end