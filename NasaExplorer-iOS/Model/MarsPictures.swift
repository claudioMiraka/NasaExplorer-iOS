//
//  MarsPictures.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/30/22.
//

import Foundation


struct MarsPictures : Decodable {
    var photos: [MarsPicture]
}

struct MarsPicture : Decodable, Hashable, Identifiable{
    
    var id: Int
    
    var sol: Int
    
    var camera: MarsCameraInfo

    var imgSrc: String
    
    var earthDate: String
    
    var rover : MarsRoverInfo
    
    enum CodingKeys: String, CodingKey {
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case id, sol, camera, rover
    }
    
    static func == (lhs: MarsPicture, rhs: MarsPicture) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct MarsCameraInfo : Decodable {
    
    var id: Int
    
    var name: String
    
    var roverId: Int
    
    var fullName: String
    
    enum CodingKeys: String, CodingKey {
        case roverId = "rover_id"
        case fullName = "full_name"
        case id, name
    }
}

struct MarsRoverInfo : Decodable {
    
    var id: Int
    
    var name: String
   
    var landingDate: String
    
    var launchDate: String
    
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case id, name , status
    }
}

