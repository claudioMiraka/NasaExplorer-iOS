//
//  FakeMarsPictures.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/30/22.
//

import Foundation

private var marsCameraInfo = MarsCameraInfo(
    id : 20,
    name : "FHAZ",
    roverId : 5,
    fullName : "Front Hazard Avoidance Camera"
)

private var marsRoverInfo = MarsRoverInfo(
    id : 5,
    name : " Curiosity",
    landingDate : "2012-08-06",
    launchDate : "2011-11-26",
    status : "active"
)

var marsPicture = MarsPicture(
    id : 837321,
    sol : 3122,
    camera : marsCameraInfo,
    imgSrc : "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03122/opgs/edr/fcam/FLB_674657615EDR_F0880366FHAZ00302M_.JPG",
    earthDate : "2021-05-18",
    rover : marsRoverInfo
)

var marsPicture2 = MarsPicture(
    id : 837322,
    sol : 3122,
    camera : marsCameraInfo,
    imgSrc : "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03122/opgs/edr/fcam/FLB_674657615EDR_F0880366FHAZ00302M_.JPG",
    earthDate : "2021-05-18",
    rover : marsRoverInfo
)

var marsPicture3 = MarsPicture(
    id : 837323,
    sol : 3122,
    camera : marsCameraInfo,
    imgSrc : "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03122/opgs/edr/fcam/FLB_674657615EDR_F0880366FHAZ00302M_.JPG",
    earthDate : "2021-05-18",
    rover : marsRoverInfo
)

var marsPictures = MarsPictures(
    photos : [marsPicture, marsPicture2, marsPicture3 ]
)

