require 'json'
require 'regis/responses/section'

module Regis
    module Endpoint
        class Section
            def initialize(client)
                @client = client
            end
                        
            def get_section_by_uuid(uuid)
                response = @client.connection.post do |req|
                    req.url '/json/reply/SectionAdminRequest'
                    req.headers['Content-Type'] = 'application/json'
                    req.body = "{\"uuid\": \"#{uuid}\"}"
                end
                Response::Section.new(JSON.parse(response.body))
            end
        end
    end
end