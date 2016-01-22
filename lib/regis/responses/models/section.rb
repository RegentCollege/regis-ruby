require 'regis/responses/base'
require 'regis/responses/models/instructor'

module Regis
    module Response
        module Model
            class Section < Response::Base
                attr_reader :secUUID
                attr_reader :course_name
                attr_reader :course_description
                attr_reader :course_title
                attr_reader :section_code
                attr_reader :location_code
                attr_reader :location_long_name
                attr_reader :room
                
                attr_reader :is_audio
                attr_reader :is_oncampus
                
                attr_reader :prerequisites
                attr_reader :corequisites
                
                attr_reader :current_status
                
                attr_reader :start_date
                attr_reader :end_date
                attr_reader :meeting_days
                attr_reader :start_times
                attr_reader :end_times
                
                attr_reader :is_weekend
                attr_reader :is_weekday
                attr_reader :is_evening
                attr_reader :is_waitlist
                
                attr_reader :is_unlisted           
                
                attr_reader :reporting_term
                attr_reader :term
                attr_reader :credits_long_name
                attr_reader :max_credits
                attr_reader :is_pass_fail                
                
                attr_reader :instructors
                
                def initialize(json)
                    super(json)
                    
                    @instructors = parse(@instructors, Instructor)
                end
            end
        end
    end
end