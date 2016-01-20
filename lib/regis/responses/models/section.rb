require 'regis/responses/base'

module Regis
    module Response
        module Model
            class Section < Response::Base
                attr_reader :uuid, :course_name, :reporting_term
                
                def initialize(json)
                    super(json)
                end
            end
        end
    end
end