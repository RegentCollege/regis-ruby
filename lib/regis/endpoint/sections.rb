require 'json'
require 'regis/responses/sections'

module Regis
    module Endpoint
        class Sections
            def initialize(client)
                @client = client
            end
                        
            def sections_get_by_reporting_term(reporting_term)
                response = @client.connection.post do |req|
                    req.url '/json/reply/SectionsAdminRequest'
                    req.body = JSON.generate({:reporting_term => reporting_term})
                end
                Response::Sections.new(response.body)
            end
        end
    end
end