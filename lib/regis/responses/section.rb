require 'regis/responses/base'
require 'regis/responses/models/section'

module Regis
    module Response
        class Section < Base
            attr_reader :section
            
            def initialize(json)
                @section = parse(json, Model::Section)
            end
            
            def get_by_reporting_term(reporting_term)
                response = self.class.request("SectionsAdminRequest", { reporting_term: "2016WI" })
                #p self.class.parse_to_json(response)
                section = new(response)
            end
        end
    end
end