require 'json'
require 'regis/responses/section'

module Regis
    module Endpoint
        class Section
            def initialize(client)
                @client = client
            end
                        
            def section_get_by_uuid(uuid)
                response = @client.connection.get "/Section/Admin/#{uuid}", { :format => 'json' }
                Response::Section.new(response.body)
            end
        end
    end
end