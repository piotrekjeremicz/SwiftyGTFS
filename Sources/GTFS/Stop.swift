//
//  Stop.swift
//  
//
//  Created by Piotrek Jeremicz on 24/04/2021.
//

import Foundation

public extension GTFS {
    struct Stop: Codable {
        
        public typealias ID = String
        
        public init(
            stop_id: GTFS.Stop.ID,
            stop_code: String? = nil,
            stop_name: String,
            tts_stop_name: String? = nil,
            stop_desc: String,
            stop_lat: GTFS.Latitude,
            stop_lon: GTFS.Longitude,
            zone_id: GTFS.Zone.ID,
            stop_url: URL? = nil,
            location_type: GTFS.LocationType,
            parent_station: GTFS.Stop.ID? = nil,
            stop_timezone: GTFS.Timezone? = nil,
            wheelchair_boarding: GTFS.WheelchairBoardings,
            level_id: GTFS.Level.ID?, platform_code: String? = nil
        ) {
            self.stop_id = stop_id
            self.stop_code = stop_code
            self.stop_name = stop_name
            self.tts_stop_name = tts_stop_name
            self.stop_desc = stop_desc
            self.stop_lat = stop_lat
            self.stop_lon = stop_lon
            self.zone_id = zone_id
            self.stop_url = stop_url
            self.location_type = location_type
            self.parent_station = parent_station
            self.stop_timezone = stop_timezone
            self.wheelchair_boarding = wheelchair_boarding
            self.level_id = level_id
            self.platform_code = platform_code
        }
        
        /// Identifies a stop, station, or station entrance.
        ///
        ///The term "station entrance" refers to both station entrances and station exits. Stops, stations or station entrances are collectively referred to as locations. Multiple routes may use the same stop.
        public let stop_id: ID
        
        ///Short text or a number that identifies the location for riders. These codes are often used in phone-based transit information systems or printed on signage to make it easier for riders to get information for a particular location. The stop_code can be the same as stop_id if it is public facing. This field should be left empty for locations without a code presented to riders.
        public let stop_code: String?
        
        ///Name of the location. Use a name that people will understand in the local and tourist vernacular.
        ///
        ///When the location is a boarding area (location_type=4), the stop_name should contains the name of the boarding area as displayed by the agency. It could be just one letter (like on some European intercity railway stations), or text like “Wheelchair boarding area” (NYC’s Subway) or “Head of short trains” (Paris’ RER).
        ///
        ///Conditionally Required:
        ///• Required for locations which are stops (location_type=0), stations (location_type=1) or entrances/exits (location_type=2).
        ///• Optional for locations which are generic nodes (location_type=3) or boarding areas (location_type=4).
        public let stop_name: String
        
        ///Readable version of the stop_name. See "Text-to-speech field" in the Term Definitions for more.
        public let tts_stop_name: String?
        
        ///Description of the location that provides useful, quality information. Do not simply duplicate the name of the location.
        public let stop_desc: String
        
        ///Latitude of the location.
        ///
        ///For stops/platforms (location_type=0) and boarding area (location_type=4), the coordinates must be the ones of the bus pole — if exists — and otherwise of where the travelers are boarding the vehicle (on the sidewalk or the platform, and not on the roadway or the track where the vehicle stops).
        ///
        ///Conditionally Required:
        ///• Required for locations which are stops (location_type=0), stations (location_type=1) or entrances/exits (location_type=2).
        ///• Optional for locations which are generic nodes (location_type=3) or boarding areas (location_type=4).
        public let stop_lat: Latitude
        
        ///Longitude of the location.
        ///
        ///For stops/platforms (location_type=0) and boarding area (location_type=4), the coordinates must be the ones of the bus pole — if exists — and otherwise of where the travelers are boarding the vehicle (on the sidewalk or the platform, and not on the roadway or the track where the vehicle stops).
        ///
        ///Conditionally Required:
        ///• Required for locations which are stops (location_type=0), stations (location_type=1) or entrances/exits (location_type=2).
        ///• Optional for locations which are generic nodes (location_type=3) or boarding areas (location_type=4).
        public let stop_lon: Longitude
        
        ///Identifies the fare zone for a stop. This field is required if providing fare information using fare_rules.txt, otherwise it is optional. If this record represents a station or station entrance, the zone_id is ignored.
        public let zone_id: GTFS.Zone.ID
        
        ///URL of a web page about the location. This should be different from the agency.agency_url and the routes.route_url field values.
        public let stop_url: URL?
        
        public let location_type: LocationType
        
        ///Defines hierarchy between the different locations defined in stops.txt. It contains the ID of the parent location, as followed:
        ///• Stop/platform (location_type=0): the parent_station field contains the ID of a station.
        ///• Station (location_type=1): this field must be empty.
        ///• Entrance/exit (location_type=2) or generic node (location_type=3): the parent_station field contains the ID of a station (location_type=1)
        ///• Boarding Area (location_type=4): the parent_station field contains ID of a platform.
        ///
        ///Conditionally Required:
        ///• Required for locations which are entrances (location_type=2), generic nodes (location_type=3) or boarding areas (location_type=4).
        ///• Optional for stops/platforms (location_type=0).
        ///• Forbidden for stations (location_type=1).
        public let parent_station: ID?
        
        ///Timezone of the location. If the location has a parent station, it inherits the parent station’s timezone instead of applying its own. Stations and parentless stops with empty stop_timezone inherit the timezone specified by agency.agency_timezone. If stop_timezone values are provided, the times in stop_times.txt should be entered as the time since midnight in the timezone specified by agency.agency_timezone. This ensures that the time values in a trip always increase over the course of a trip, regardless of which timezones the trip crosses.
        public let stop_timezone: Timezone?
        
        ///Indicates whether wheelchair boardings are possible from the location.
        public let wheelchair_boarding: WheelchairBoardings
        
        ///Level of the location. The same level can be used by multiple unlinked stations.
        public let level_id: GTFS.Level.ID?
        
        ///Platform identifier for a platform stop (a stop belonging to a station). This should be just the platform identifier (eg. "G" or "3"). Words like “platform” or "track" (or the feed’s language-specific equivalent) should not be included. This allows feed consumers to more easily internationalize and localize the platform identifier into other languages.
        public let platform_code: String?
    }
}
