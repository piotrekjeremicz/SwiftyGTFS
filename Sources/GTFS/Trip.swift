//
//  File.swift
//  
//
//  Created by Piotrek on 28/06/2021.
//

import Foundation

public extension GTFS {
    struct Trip: Codable {
        public typealias ID = String
        
        public init(
            route_id: GTFS.Route.ID,
            service_id: GTFS.Service.ID,
            trip_id: GTFS.Trip.ID,
            trip_headsign: String? = nil,
            trip_short_name: String? = nil,
            direction_id: GTFS.Trip.Direction? = nil,
            block_id: GTFS.Block.ID? = nil,
            shape_id: GTFS.Shape.ID? = nil,
            wheelchair_accessible: GTFS.WheelchairBoardings? = nil,
            bikes_allowed: GTFS.BikesAllowed? = nil
        ) {
            self.route_id = route_id
            self.service_id = service_id
            self.trip_id = trip_id
            self.trip_headsign = trip_headsign
            self.trip_short_name = trip_short_name
            self.direction_id = direction_id
            self.block_id = block_id
            self.shape_id = shape_id
            self.wheelchair_accessible = wheelchair_accessible
            self.bikes_allowed = bikes_allowed
        }
        
        ///Indicates the direction of travel for a trip. This field is not used in routing; it provides a way to separate trips by direction when publishing time tables. Valid options are:
        ///
        ///0 - Travel in one direction (e.g. outbound travel).
        ///1 - Travel in the opposite direction (e.g. inbound travel).
        ///Example: The trip_headsign and direction_id fields could be used together to assign a name to travel in each direction for a set of trips. A trips.txt file could contain these records for use in time tables:
        ///trip_id,...,trip_headsign,direction_id
        ///1234,...,Airport,0
        ///1505,...,Downtown,1
        public enum Direction: Int, Codable {
            ///0 - Travel in one direction (e.g. outbound travel).
            case one_direction
            
            ///1 - Travel in the opposite direction (e.g. inbound travel).
            case opposite_direction
        }
        
        ///Identifies a route.
        public let route_id: Route.ID
        
        ///Identifies a set of dates when service is available for one or more routes.
        public let service_id: Service.ID
        
        ///Identifies a trip.
        public let trip_id: ID
        
        ///Text that appears on signage identifying the trip's destination to riders. Use this field to distinguish between different patterns of service on the same route. If the headsign changes during a trip, trip_headsign can be overridden by specifying values for the stop_times.stop_headsign.
        public let trip_headsign: String?
        
        ///Public facing text used to identify the trip to riders, for instance, to identify train numbers for commuter rail trips. If riders do not commonly rely on trip names, leave this field empty. A trip_short_name value, if provided, should uniquely identify a trip within a service day; it should not be used for destination names or limited/express designations.
        public let trip_short_name: String?
        
        ///Indicates the direction of travel for a trip. This field is not used in routing; it provides a way to separate trips by direction when publishing time tables. Valid options are:
        ///
        ///0 - Travel in one direction (e.g. outbound travel).
        ///1 - Travel in the opposite direction (e.g. inbound travel).
        ///Example: The trip_headsign and direction_id fields could be used together to assign a name to travel in each direction for a set of trips. A trips.txt file could contain these records for use in time tables:
        ///trip_id,...,trip_headsign,direction_id
        ///1234,...,Airport,0
        ///1505,...,Downtown,1
        public let direction_id: Direction?
        
        ///Identifies the block to which the trip belongs. A block consists of a single trip or many sequential trips made using the same vehicle, defined by shared service days and block_id. A block_id can have trips with different service days, making distinct blocks. See the example below
        public let block_id: Block.ID?
        
        ///Identifies a geospatial shape describing the vehicle travel path for a trip.
        ///
        ///Conditionally Required:
        ///- Required if the trip has a continuous pickup or drop-off behavior defined either in routes.txt or in stop_times.txt.
        ///- Optional otherwise.
        public let shape_id: Shape.ID?
        
        ///Indicates wheelchair accessibility. Valid options are:
        ///
        ///0 or empty - No accessibility information for the trip.
        ///1 - Vehicle being used on this particular trip can accommodate at least one rider in a wheelchair.
        ///2 - No riders in wheelchairs can be accommodated on this trip.
        public let wheelchair_accessible: WheelchairBoardings?
        
        ///Indicates whether bikes are allowed. Valid options are:
        ///
        ///0 or empty - No bike information for the trip.
        ///1 - Vehicle being used on this particular trip can accommodate at least one bicycle.
        ///2 - No bicycles are allowed on this trip.
        public let bikes_allowed: BikesAllowed?
        
        
    }
}
