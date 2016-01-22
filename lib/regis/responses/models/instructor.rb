require 'regis/responses/base'

module Regis
    module Response
        module Model
            class Instructor < Response::Base
                attr_reader :regent_id
                attr_reader :first_name
                attr_reader :last_name
                attr_reader :full_name
                attr_reader :image_base64          
                                
                def initialize(json)
                    super(json)
                end
            end
        end
    end
end