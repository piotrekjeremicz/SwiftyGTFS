//
//  GTFS.swift
//
//
//  Created by Piotrek Jeremicz on 24/04/2021.
//

public struct GTFS {
    public typealias Latitude = Double
    public typealias Longitude = Double
    public typealias Timezone = String

    /// Type of the location:
    ///0 (or blank) - Stop (or Platform). A location where passengers board or disembark from a transit vehicle. Is called a platform when defined within a parent_station.
    ///1 - Station. A physical structure or area that contains one or more platform.
    ///2 - Entrance/Exit. A location where passengers can enter or exit a station from the street. If an entrance/exit belongs to multiple stations, it can be linked by pathways to both, but the data provider must pick one of them as parent.
    ///3 -Generic Node. A location within a station, not matching any other location_type, which can be used to link together pathways define in pathways.txt.
    ///4 - Boarding Area. A specific location on a platform, where passengers can board and/or alight vehicles.
    public enum LocationType: Int, Codable {
        ///0 (or blank) - Stop (or Platform). A location where passengers board or disembark from a transit vehicle. Is called a platform when defined within a parent_station.
        case stop_platform
        
        ///1 - Station. A physical structure or area that contains one or more platform.
        case station
        
        ///2 - Entrance/Exit. A location where passengers can enter or exit a station from the street. If an entrance/exit belongs to multiple stations, it can be linked by pathways to both, but the data provider must pick one of them as parent.
        case entrance_exit
        
        ///3 -Generic Node. A location within a station, not matching any other location_type, which can be used to link together pathways define in pathways.txt.
        case generic_node
        
        ///4 - Boarding Area. A specific location on a platform, where passengers can board and/or alight vehicles.
        case boarding_area
    }
    
    ///For parentless stops:
    ///0 or empty - No accessibility information for the stop.
    ///1 - Some vehicles at this stop can be boarded by a rider in a wheelchair.
    ///2 - Wheelchair boarding is not possible at this stop.
    ///
    ///For child stops:
    ///0 or empty - Stop will inherit its wheelchair_boarding behavior from the parent station, if specified in the parent.
    ///1 - There exists some accessible path from outside the station to the specific stop/platform.
    ///2 - There exists no accessible path from outside the station to the specific stop/platform.
    ///
    ///For station entrances/exits:
    ///0 or empty - Station entrance will inherit its wheelchair_boarding behavior from the parent station, if specified for the parent.
    ///1 - Station entrance is wheelchair accessible.
    ///2 - No accessible path from station entrance to stops/platforms.
    public enum WheelchairBoardings: Int, Codable {
        case no_information
        case partly_possible
        case not_possible
        
    }
    
    ///Indicates that the rider can board the transit vehicle at any point along the vehicle’s travel path as described by shapes.txt, on every trip of the route. Valid options are:
    ///
    ///0 - Continuous stopping pickup.
    ///1 or empty - No continuous stopping pickup.
    ///2 - Must phone agency to arrange continuous stopping pickup.
    ///3 - Must coordinate with driver to arrange continuous stopping pickup.
    ///
    ///The continuous pickup behavior defined in routes.txt can be overridden in stop_times.txt.
    public enum Pickup: Int, Codable {
        ///0 - Continuous stopping pickup.
        case continous
        
        ///1 or empty - No continuous stopping pickup.
        case no_continous
        
        ///2 - Must phone agency to arrange continuous stopping pickup.
        case arrange_with_phone_agency
        
        ///3 - Must coordinate with driver to arrange continuous stopping pickup.
        case arrange_with_driver
    }
    
    ///Indicates that the rider can alight from the transit vehicle at any point along the vehicle’s travel path as described by shapes.txt, on every trip of the route. Valid options are:
    ///
    ///0 - Continuous stopping drop off.
    ///1 or empty - No continuous stopping drop off.
    ///2 - Must phone agency to arrange continuous stopping drop off.
    ///3 - Must coordinate with driver to arrange continuous stopping drop off.
    ///
    ///The continuous drop-off behavior defined in routes.txt can be overridden in stop_times.txt.
    public enum DropOff: Int, Codable {
        ///0 - Continuous stopping drop off.
        case continous
        
        ///1 or empty - No continuous stopping drop off.
        case no_continous
        
        ///2 - Must phone agency to arrange continuous stopping drop off.
        case arrange_with_phone_agency
        
        ///3 - Must coordinate with driver to arrange continuous stopping drop off.
        case arrange_with_driver
    }
    
    ///Indicates whether bikes are allowed. Valid options are:
    ///
    ///0 or empty - No bike information for the trip.
    ///1 - Vehicle being used on this particular trip can accommodate at least one bicycle.
    ///2 - No bicycles are allowed on this trip.
    public enum BikesAllowed: Int, Codable {
        ///0 or empty - No bike information for the trip.
        case no_information
        
        ///1 - Vehicle being used on this particular trip can accommodate at least one bicycle.
        case can_accomodate
        
        ///2 - No bicycles are allowed on this trip.
        case no_bicycles_allowed
    }
    
    public struct Block: Codable {
        public typealias ID = String
    }
    
    ///Indicates if arrival and departure times for a stop are strictly adhered to by the vehicle or if they are instead approximate and/or interpolated times. This field allows a GTFS producer to provide interpolated stop-times, while indicating that the times are approximate. Valid options are:
    ///
    ///0 - Times are considered approximate.
    ///1 or empty - Times are considered exact.
    public enum Timepoint: Int, Codable {
        ///0 - Times are considered approximate.
        case approximate
        
        ///1 or empty - Times are considered exact.
        case exact
    }
}
