require 'regis/responses/base'

module Regis
    module Response
        module Model
            class Section < Response::Base
                attr_reader :uuid
                attr_reader :course_name
                attr_reader :title
                attr_reader :location
                attr_reader :room
                
                attr_reader :is_audio
                attr_reader :is_oncampus
                
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
                attr_reader :min_credits
                attr_reader :max_credits
                attr_reader :is_pass_fail                
                                
                def initialize(json)
                    super(json)
                end
            end
        end
    end
end