//
//  NearEarthObjects.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/27/22.
//

import Foundation


struct NearEarthObjects : Decodable {
    
    var links: Links
    
    var elementCount: Int
    
    var nearEarthObjects: [String: [NearEarthObject]]
    
    enum CodingKeys: String, CodingKey {
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
        case links
    }
}

/////////////////////////////////////////////////////

struct NearEarthObject : Decodable , Hashable , Identifiable{
    
    var links: Links
    
    var id: String
    
    var name: String
    
    var neoReferenceId: String
    
    var nasaJplUrl: String
    
    var absoluteMagnitudeH: Double
    
    var isPotentiallyHazardousAsteroid: Bool
    
    var estimatedDiameter: EstimatedDiameter
    
    var isSentryObject: Bool
    
    var closeApproachData: [CloseApproach]
    
    
    enum CodingKeys: String, CodingKey {
        case links, id, name
        case neoReferenceId = "neo_reference_id"
        case nasaJplUrl = "nasa_jpl_url"
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case isPotentiallyHazardousAsteroid = "is_potentially_hazardous_asteroid"
        case estimatedDiameter = "estimated_diameter"
        case isSentryObject = "is_sentry_object"
        case closeApproachData = "close_approach_data"
    }
    
    
    func getInfoString() -> String{
        return "id " + self.id + "\n" + "name " + self.name + "\n"
    }
    
    static func == (lhs: NearEarthObject, rhs: NearEarthObject) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

/////////////////////////////////////////////////////

struct  Links : Decodable {
    var next: String?
    var prev: String?
    var `self`: String
}

/////////////////////////////////////////////////////
struct  EstimatedDiameter : Decodable {
    
    var kilometers: EstimatedDiameterMinMax
    
    var meters: EstimatedDiameterMinMax
    
    var miles: EstimatedDiameterMinMax
    
    var feet: EstimatedDiameterMinMax

}

struct  EstimatedDiameterMinMax : Decodable {
    
    var min: Double
    
    var max: Double
    
    enum CodingKeys: String, CodingKey {
        case min = "estimated_diameter_min"
        case max = "estimated_diameter_max"
    }
}

/////////////////////////////////////////////////////

struct  CloseApproach : Decodable{

    var closeApproachDate: String
    
    var closeApproachDateFull: String
    
//    @SerializedName("epoch_date_close_approach")
//    var epochDateCloseApproach: String // where is BigInteger swift?
    
    var relativeVelocity: Velocity
    
    var missDistance: Distance
    
    var orbitingBody: String
    
    enum CodingKeys: String, CodingKey {
        case closeApproachDate = "close_approach_date"
        case closeApproachDateFull = "close_approach_date_full"
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
        case orbitingBody = "orbiting_body"
    }
    
}

struct  Velocity :Decodable {
    
    var kilometersPerSecond: String
    
    var kilometersPerHour: String
    
    var milesPerHour: String
    
    enum CodingKeys: String, CodingKey {
        case kilometersPerSecond = "kilometers_per_second"
        case kilometersPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
    }
}

struct  Distance : Decodable {
    var astronomical: String
    var lunar: String
    var kilometers: String
    var miles: String
}
