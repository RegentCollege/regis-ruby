require 'json'
require 'regis/responses/section_search'

module Regis
    module Endpoint
        class SectionSearch
            def initialize(client)
                @client = client
            end
                        
            def get_sections_by_reporting_term(reporting_term)
                response = @client.connection.post do |req|
                    req.url '/json/reply/SectionsAdminRequest'
                    req.headers['Content-Type'] = 'application/json'
                    req.body = "{\"reporting_term\": \"#{reporting_term}\"}"
                end
                Response::SectionSearch.new(JSON.parse(response.body))
            end
        end
    end
end