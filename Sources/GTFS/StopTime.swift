//
//  File.swift
//  
//
//  Created by Piotrek on 28/06/2021.
//

import Foundation

public extension GTFS {
    struct StopTime: Equatable, Codable {
        public init(
            trip_id: GTFS.Trip.ID,
            arrival_time: String? = nil,
            departure_time: String,
            stop_id: GTFS.Stop.ID,
            stop_sequence: UInt,
            stop_headsign: String? = nil,
            pickup_type: GTFS.Pickup? = nil,
            drop_off_type: GTFS.DropOff? = nil,
            continuous_pickup: GTFS.Pickup? = nil,
            continuous_drop_off: GTFS.DropOff? = nil,
            shape_dist_traveled: Float? = nil,
            timepoint: GTFS.Timepoint? = nil
        ) {
            self.trip_id = trip_id
            self.arrival_time = arrival_time
            self.departure_time = departure_time
            self.stop_id = stop_id
            self.stop_sequence = stop_sequence
            self.stop_headsign = stop_headsign
            self.pickup_type = pickup_type
            self.drop_off_type = drop_off_type
            self.continuous_pickup = continuous_pickup
            self.continuous_drop_off = continuous_drop_off
            self.shape_dist_traveled = shape_dist_traveled
            self.timepoint = timepoint
        }
        
        
        ///Identifies a trip.
        public let trip_id: Trip.ID
        
        ///Arrival time at a specific stop for a specific trip on a route. If there are not separate times for arrival and departure at a stop, enter the same value for arrival_time and departure_time. For times occurring after midnight on the service day, enter the time as a value greater than 24:00:00 in HH:MM:SS local time for the day on which the trip schedule begins.
        ///
        ///Scheduled stops where the vehicle strictly adheres to the specified arrival and departure times are timepoints. If this stop is not a timepoint, it is recommended to provide an estimated or interpolated time. If this is not available, arrival_time can be left empty. Further, indicate that interpolated times are provided with timepoint=0. If interpolated times are indicated with timepoint=0, then time points must be indicated with timepoint=1. Provide arrival times for all stops that are time points. An arrival time must be specified for the first and the last stop in a trip.
        public let arrival_time: String?
        
        ///Departure time from a specific stop for a specific trip on a route. For times occurring after midnight on the service day, enter the time as a value greater than 24:00:00 in HH:MM:SS local time for the day on which the trip schedule begins. If there are not separate times for arrival and departure at a stop, enter the same value for arrival_time and departure_time. See the arrival_time description for more details about using timepoints correctly.
        ///
        ///The departure_time field should specify time values whenever possible, including non-binding estimated or interpolated times between timepoints.
        public let departure_time: String
        
        ///Identifies the serviced stop. All stops serviced during a trip must have a record in stop_times.txt. Referenced locations must be stops, not stations or station entrances. A stop may be serviced multiple times in the same trip, and multiple trips and routes may service the same stop.
        public let stop_id: Stop.ID
        
        ///Order of stops for a particular trip. The values must increase along the trip but do not need to be consecutive.
        ///
        ///Example: The first location on the trip could have a stop_sequence=1, the second location on the trip could have a stop_sequence=23, the third location could have a stop_sequence=40, and so on.
        public let stop_sequence: UInt
        
        ///Text that appears on signage identifying the trip's destination to riders. This field overrides the default trips.trip_headsign when the headsign changes between stops. If the headsign is displayed for an entire trip, use trips.trip_headsign instead.
        ///
        ///A stop_headsign value specified for one stop_time does not apply to subsequent stop_times in the same trip. If you want to override the trip_headsign for multiple stop_times in the same trip, the stop_headsign value must be repeated in each stop_time row.
        public let stop_headsign: String?
        
        ///Indicates pickup method. Valid options are:
        ///
        ///0 or empty - Regularly scheduled pickup.
        ///1 - No pickup available.
        ///2 - Must phone agency to arrange pickup.
        ///3 - Must coordinate with driver to arrange pickup.
        public let pickup_type: Pickup?
        
        ///Indicates drop off method. Valid options are:
        ///
        ///0 or empty - Regularly scheduled drop off.
        ///1 - No drop off available.
        ///2 - Must phone agency to arrange drop off.
        ///3 - Must coordinate with driver to arrange drop off.
        public let drop_off_type: DropOff?
        
        ///Indicates that the rider can board the transit vehicle at any point along the vehicle’s travel path as described by shapes.txt, from this stop_time to the next stop_time in the trip’s stop_sequence. Valid options are:
        ///
        ///0 - Continuous stopping pickup.
        ///1 or empty - No continuous stopping pickup.
        ///2 - Must phone agency to arrange continuous stopping pickup.
        ///3 - Must coordinate with driver to arrange continuous stopping pickup.
        ///
        ///If this field is populated, it overrides any continuous pickup behavior defined in routes.txt. If this field is empty, the stop_time inherits any continuous pickup behavior defined in routes.txt.
        public let continuous_pickup: Pickup?
        
        ///Indicates that the rider can alight from the transit vehicle at any point along the vehicle’s travel path as described by shapes.txt, from this stop_time to the next stop_time in the trip’s stop_sequence. Valid options are:
        ///
        ///0 - Continuous stopping drop off.
        ///1 or empty - No continuous stopping drop off.
        ///2 - Must phone agency to arrange continuous stopping drop off.
        ///3 - Must coordinate with driver to arrange continuous stopping drop off.
        ///
        ///If this field is populated, it overrides any continuous drop-off behavior defined in routes.txt. If this field is empty, the stop_time inherits any continuous drop-off behavior defined in routes.txt.
        public let continuous_drop_off: DropOff?
        
        ///Actual distance traveled along the associated shape, from the first stop to the stop specified in this record. This field specifies how much of the shape to draw between any two stops during a trip. Must be in the same units used in shapes.txt. Values used for shape_dist_traveled must increase along with stop_sequence; they cannot be used to show reverse travel along a route.
        ///
        ///Example: If a bus travels a distance of 5.25 kilometers from the start of the shape to the stop,shape_dist_traveled=5.25.
        public let shape_dist_traveled: Float?
        
        ///Indicates if arrival and departure times for a stop are strictly adhered to by the vehicle or if they are instead approximate and/or interpolated times. This field allows a GTFS producer to provide interpolated stop-times, while indicating that the times are approximate. Valid options are:
        ///
        ///0 - Times are considered approximate.
        ///1 or empty - Times are considered exact.
        public let timepoint: Timepoint?
    }
}
