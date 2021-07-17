//
//  File.swift
//  
//
//  Created by Piotrek Jeremicz on 25/04/2021.
//

import Foundation

extension GTFS {
    @dynamicMemberLookup
    public struct Extend<Model, Extended> {
        public var model: Model
        public var extended: Extended
        
        public subscript<T>(dynamicMember keyPath: WritableKeyPath<Model, T>) -> T {
            get { model[keyPath: keyPath] }
            set { model[keyPath: keyPath] = newValue }
        }
        
        public subscript<T>(dynamicMember keyPath: WritableKeyPath<Extended, T>) -> T {
            get { extended[keyPath: keyPath] }
            set { extended[keyPath: keyPath] = newValue }
        }
        
        public init(_ element1: Model, _ element2: Extended) {
            self.model = element1
            self.extended = element2
        }
    }
}

extension GTFS.Extend: Encodable where Model: Encodable, Extended: Encodable {
    public func encode(to encoder: Encoder) throws {
        try model.encode(to: encoder)
        try extended.encode(to: encoder)
    }
}
extension GTFS.Extend: Decodable where Model: Decodable, Extended: Decodable {
    public init(from decoder: Decoder) throws {
        self.model = try Model(from: decoder)
        self.extended = try Extended(from: decoder)
    }
}
