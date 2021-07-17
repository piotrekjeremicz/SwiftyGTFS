//
//  File.swift
//  
//
//  Created by Piotrek on 28/06/2021.
//

import Foundation

public extension GTFS {
    struct Route: Codable {
        
        public typealias ID = String
        
        public init(
            route_id: GTFS.Route.ID,
            agency_id: GTFS.Agency.ID,
            route_short_name: String,
            route_long_name: String? = nil,
            route_desc: String? = nil,
            route_type: GTFS.Route.`Type`,
            route_url: URL? = nil,
            route_color: String? = nil,
            route_text_color: String? = nil,
            route_sort_order: UInt? = nil,
            continuous_pickup: GTFS.Pickup? = nil,
            continuous_drop_off: GTFS.DropOff? = nil
        ) {
            self.route_id = route_id
            self.agency_id = agency_id
            self.route_short_name = route_short_name
            self.route_long_name = route_long_name
            self.route_desc = route_desc
            self.route_type = route_type
            self.route_url = route_url
            self.route_color = route_color
            self.route_text_color = route_text_color
            self.route_sort_order = route_sort_order
            self.continuous_pickup = continuous_pickup
            self.continuous_drop_off = continuous_drop_off
        }
        
        ///Indicates the type of transportation used on a route. Valid options are:
        ///0 - Tram, Streetcar, Light rail. Any light rail or street level system within a metropolitan area.
        ///1 - Subway, Metro. Any underground rail system within a metropolitan area.
        ///2 - Rail. Used for intercity or long-distance travel.
        ///3 - Bus. Used for short- and long-distance bus routes.
        ///4 - Ferry. Used for short- and long-distance boat service.
        ///5 - Cable tram. Used for street-level rail cars where the cable runs beneath the vehicle, e.g., cable car in San Francisco.
        ///6 - Aerial lift, suspended cable car (e.g., gondola lift, aerial tramway). Cable transport where cabins, cars, gondolas or open chairs are suspended by means of one or more cables.
        ///7 - Funicular. Any rail system designed for steep inclines.
        ///11 - Trolleybus. Electric buses that draw power from overhead wires using poles.
        ///12 - Monorail. Railway in which the track consists of a single rail or a beam.
        public enum `Type`: Int, Codable {
            ///0 - Tram, Streetcar, Light rail. Any light rail or street level system within a metropolitan area.
            case tram = 0
            
            ///1 - Subway, Metro. Any underground rail system within a metropolitan area.
            case subway = 1
            
            ///2 - Rail. Used for intercity or long-distance travel.
            case rail = 2
            
            ///3 - Bus. Used for short- and long-distance bus routes.
            case bus = 3
            
            ///4 - Ferry. Used for short- and long-distance boat service.
            case ferry = 4
            
            ///5 - Cable tram. Used for street-level rail cars where the cable runs beneath the vehicle, e.g., cable car in San Francisco.
            case cable_tram = 5
            
            ///6 - Aerial lift, suspended cable car (e.g., gondola lift, aerial tramway). Cable transport where cabins, cars, gondolas or open chairs are suspended by means of one or more cables.
            case cable_car = 6
            
            ///7 - Funicular. Any rail system designed for steep inclines.
            case funicular = 7
            
            ///11 - Trolleybus. Electric buses that draw power from overhead wires using poles.
            case trolleybus = 11
            
            ///12 - Monorail. Railway in which the track consists of a single rail or a beam.
            case monorail = 12
            
        }
        
        
        ///Identifies a route.
        public let route_id: ID
        
        ///Agency for the specified route. This field is required when the dataset provides data for routes from more than one agency in agency.txt, otherwise it is optional.
        public let agency_id: Agency.ID
        
        ///Short name of a route. This will often be a short, abstract identifier like "32", "100X", or "Green" that riders use to identify a route, but which doesn't give any indication of what places the route serves. Either route_short_name or route_long_name must be specified, or potentially both if appropriate.
        public let route_short_name: String
        
        ///Full name of a route. This name is generally more descriptive than the route_short_name and often includes the route's destination or stop. Either route_short_name or route_long_name must be specified, or potentially both if appropriate.
        public let route_long_name: String?
        
        ///Description of a route that provides useful, quality information. Do not simply duplicate the name of the route.
        ///----------------------
        ///Example: "A" trains operate between Inwood-207 St, Manhattan and Far Rockaway-Mott Avenue, Queens at all times. Also from about 6AM until about midnight, additional "A" trains operate between Inwood-207 St and Lefferts Boulevard (trains typically alternate between Lefferts Blvd and Far Rockaway).
        public let route_desc: String?
        
        ///Indicates the type of transportation used on a route. Valid options are:
        ///0 - Tram, Streetcar, Light rail. Any light rail or street level system within a metropolitan area.
        ///1 - Subway, Metro. Any underground rail system within a metropolitan area.
        ///2 - Rail. Used for intercity or long-distance travel.
        ///3 - Bus. Used for short- and long-distance bus routes.
        ///4 - Ferry. Used for short- and long-distance boat service.
        ///5 - Cable tram. Used for street-level rail cars where the cable runs beneath the vehicle, e.g., cable car in San Francisco.
        ///6 - Aerial lift, suspended cable car (e.g., gondola lift, aerial tramway). Cable transport where cabins, cars, gondolas or open chairs are suspended by means of one or more cables.
        ///7 - Funicular. Any rail system designed for steep inclines.
        ///11 - Trolleybus. Electric buses that draw power from overhead wires using poles.
        ///12 - Monorail. Railway in which the track consists of a single rail or a beam.
        public let route_type: Type
        
        ///URL of a web page about the particular route. Should be different from the agency.agency_url value.
        public let route_url: URL?
        
        ///Route color designation that matches public facing material. Defaults to white (FFFFFF) when omitted or left empty. The color difference between route_color and route_text_color should provide sufficient contrast when viewed on a black and white screen.
        public let route_color: String?
        
        ///Legible color to use for text drawn against a background of route_color. Defaults to black (000000) when omitted or left empty. The color difference between route_color and route_text_color should provide sufficient contrast when viewed on a black and white screen.
        public let route_text_color: String?
        
        ///Orders the routes in a way which is ideal for presentation to customers. Routes with smaller route_sort_order values should be displayed first.
        public let route_sort_order: UInt?
        
        ///Indicates that the rider can board the transit vehicle at any point along the vehicle’s travel path as described by shapes.txt, on every trip of the route. Valid options are:
        ///
        ///0 - Continuous stopping pickup.
        ///1 or empty - No continuous stopping pickup.
        ///2 - Must phone agency to arrange continuous stopping pickup.
        ///3 - Must coordinate with driver to arrange continuous stopping pickup.
        ///
        ///The continuous pickup behavior defined in routes.txt can be overridden in stop_times.txt.
        public let continuous_pickup: Pickup?
        
        ///Indicates that the rider can alight from the transit vehicle at any point along the vehicle’s travel path as described by shapes.txt, on every trip of the route. Valid options are:
        ///
        ///0 - Continuous stopping drop off.
        ///1 or empty - No continuous stopping drop off.
        ///2 - Must phone agency to arrange continuous stopping drop off.
        ///3 - Must coordinate with driver to arrange continuous stopping drop off.
        ///
        ///The continuous drop-off behavior defined in routes.txt can be overridden in stop_times.txt.
        public let continuous_drop_off: DropOff?
    }
}
