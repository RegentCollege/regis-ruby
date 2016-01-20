require 'json'
require 'regis/responses/section'

module Regis
    module Endpoint
        class Section
            def initialize(client)
                @client = client
            end
                        
            def section_get_by_uuid(uuid)
                response = @client.connection.post do |req|
                    req.url '/json/reply/SectionAdminRequest'
                    req.body = JSON.generate({:uuid => uuid})
                end
                Response::Section.new(response.body)
            end
        end
    end
end