//
//  DailyPicture.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/21/22.
//

import Foundation


struct DailyPicture : Decodable{
    
    var date: String
    
    var explanation : String
    
    var hdurl: String
    
    var mediaType : String?
    
    var serviceVersion : String
    
    var title: String
    
    var url : String
    
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case date, explanation, hdurl, title, url
    }
    
}

