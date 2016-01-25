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
                
                def formatted_start_date(format="%b %-d")
                    DateTime.strptime(@start_date,"%Y-%m-%dT%H:%M:%S").strftime(format)
                end

                def formatted_end_date(format="%b %-d")
                    DateTime.strptime(@end_date,"%Y-%m-%dT%H:%M:%S").strftime(format)
                end
                
                def self.formatted_term(value)
                    return value.gsub("WI"," Winter Term").gsub("SUR"," Summer Term").gsub("SU", " Summer (Distance)").gsub("FA"," Fall Term").gsub("SP", " Spring Session").gsub("SS", " Summer Session")
                end
                
                def formatted_term
                    if self.term["SU"] and self.location_code["VAN"]
                        Section.formatted_term(self.term.gsub("SU","SUR")) # on-campus "SU" courses are guided studies, theses, major projects, etc. Term needs to not translate as Distance.
                    else
                        Section.formatted_term(self.term)
                    end
                end

                def self.formatted_location(value)
                    return value.gsub("VAN"," Vancouver").gsub("AUDIO", " Distance").gsub("PARA", " Para-church").gsub("IV", " Intervarsity").gsub("SKAG", " Skagit Valley").gsub("KENYA", " Kenya").gsub("CAM", " Costa Rica").gsub("EU", " France").gsub("ME", " Israel & Palestine")
                end

                def formatted_location
                    self[:location].present?? Section.formatted_location(self[:location]) : ""
                end
                
                def formatted_instructors(options = {:linked => true })
                    ret = Array.new
                    for i in self.instructors
                        ret << "#{i.full_name} "
                    end
                    return ret
                end
            end
        end
    end
end