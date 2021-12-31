//
//  Calendar.swift
//  
//
//  Created by Piotrek on 25/08/2021.
//

import Foundation

public extension GTFS {
    struct Calendar: Codable {
        public init(
            service_id: GTFS.Service.ID,
            monday: Bool,
            tuesday: Bool,
            wednesday: Bool,
            thursday: Bool,
            friday: Bool,
            saturday: Bool,
            sunday: Bool,
            start_date: Date,
            end_date: Date
        ) {
            self.service_id = service_id
            self.monday = monday
            self.tuesday = tuesday
            self.wednesday = wednesday
            self.thursday = thursday
            self.friday = friday
            self.saturday = saturday
            self.sunday = sunday
            self.start_date = start_date
            self.end_date = end_date
        }
        
        ///Uniquely identifies a set of dates when service is available for one or more routes. Each service_id value can appear at most once in a calendar.txt file.
        public let service_id: GTFS.Service.ID
        
        ///Indicates whether the service operates on all Mondays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Mondays in the date range.
        ///false - Service is not available for Mondays in the date range.
        public let monday: Bool
        
        ///Indicates whether the service operates on all Tuesdays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Tuesdays in the date range.
        ///false - Service is not available for Tuesdays in the date range.
        public let tuesday: Bool
        
        ///Indicates whether the service operates on all Wednesdays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Wednesdays in the date range.
        ///false - Service is not available for Wednesdays in the date range.
        public let wednesday: Bool
        
        ///Indicates whether the service operates on all Thursdays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Thursdays in the date range.
        ///false - Service is not available for Thursdays in the date range.
        public let thursday: Bool
        
        ///Indicates whether the service operates on all Fridays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Fridays in the date range.
        ///false - Service is not available for Fridays in the date range.
        public let friday: Bool
        
        ///Indicates whether the service operates on all Saturdays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Saturdays in the date range.
        ///false - Service is not available for Saturdays in the date range.
        public let saturday: Bool
        
        ///Indicates whether the service operates on all Sundays in the date range specified by the start_date and end_date fields. Note that exceptions for particular dates may be listed in calendar_dates.txt. Valid options are:
        ///
        ///true - Service is available for all Sundays in the date range.
        ///false - Service is not available for Sundays in the date range.
        public let sunday: Bool
        
        ///Start service day for the service interval.
        public let start_date: Date
        
        ///End service day for the service interval. This service day is included in the interval.
        public let end_date: Date
    }
}
