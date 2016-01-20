require 'faraday'
require 'faraday_middleware'
require 'faraday-cookie_jar'

require 'regis/configuration'
require 'regis/endpoint/section'
require 'regis/endpoint/sections'

module Regis
    class Client
        REQUEST_CLASSES = [ Regis::Endpoint::Section, Regis::Endpoint::Sections ]
        
        attr_reader :configuration
        
        def initialize(options = nil)
            @configuration = nil
            define_request_methods
            
            unless options.nil?
                @configuration = Configuration.new(options)
            end
        end
        
        def configure
            @configuration = Configuration.new
            yield(@configuration)
        end
        
        def connection
            return @connection if instance_variable_defined?(:@connection)
            @connection = Faraday.new(@configuration.url, :ssl => {:verify => false}) do |faraday|
                faraday.basic_auth(@configuration.username, @configuration.password)
                faraday.request :json
                
                faraday.response :json, :content_type => /\bjson$/
                
                faraday.use :cookie_jar #preserve the servicestack session
                #faraday.response :logger
                
                faraday.adapter Faraday.default_adapter
            end
        end
        
        private

        # This goes through each endpoint class and creates singletone methods
        # on the client that query those classes. We do this to avoid possible
        # namespace collisions in the future when adding new classes
        def define_request_methods
            REQUEST_CLASSES.each do |request_class|
                endpoint_instance = request_class.new(self)
                create_methods_from_instance(endpoint_instance)
            end
        end

        # Loop through all of the endpoint instances' public singleton methods to
        # add the method to client
        def create_methods_from_instance(instance)
            instance.public_methods(false).each do |method_name|
                add_method(instance, method_name)
            end
        end

        # Define the method on the client and send it to the endpoint instance
        # with the args passed in
        def add_method(instance, method_name)
            define_singleton_method(method_name) do |*args|
                instance.public_send(method_name, *args)
            end
        end
    end
end