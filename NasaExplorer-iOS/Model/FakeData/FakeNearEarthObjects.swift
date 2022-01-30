//
//  FakeNearEarthObjects.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/28/22.
//

import Foundation



private var estimatedDiameterMinMaxKilometerFake = EstimatedDiameterMinMax(min: 0.1838886721, max: 0.411187571)

private var estimatedDiameterMinMaxMeters = EstimatedDiameterMinMax(min : 183.8886720703, max : 411.1875710413)

private var estimatedDiameterMinMaxMiles = EstimatedDiameterMinMax(min : 0.1142630881 , max : 0.255500032)

private var estimatedDiameterMinMaxFeet = EstimatedDiameterMinMax(min : 603.309310875, max : 1349.040630575)

private var estimatedDiameter = EstimatedDiameter(
    kilometers : estimatedDiameterMinMaxKilometerFake,
    meters : estimatedDiameterMinMaxMeters,
    miles : estimatedDiameterMinMaxMiles,
    feet : estimatedDiameterMinMaxFeet
)

/////////////////////////////////////////////////////
private var links = Links(
    next : "http://www.neowsapp.com/rest/v1/feed?start_date=2021-05-16&end_date=2021-05-23&detailed=false&api_key=DEMO_KEY",
    prev : "http://www.neowsapp.com/rest/v1/feed?start_date=2021-05-02&end_date=2021-05-09&detailed=false&api_key=DEMO_KEY",
    self : "http://www.neowsapp.com/rest/v1/feed?start_date=2021-05-09&end_date=2021-05-16&detailed=false&api_key=DEMO_KEY"
)

/////////////////////////////////////////////////////
private var velocity = Velocity(
    kilometersPerSecond : "8.5968416308",
    kilometersPerHour : "30948.6298707206",
    milesPerHour : "19230.2750438374"
)

private var distance = Distance(
    astronomical : "0.2150532009",
    lunar : "83.6556951501",
    kilometers : "32171500.791322083",
    miles : "19990443.6225394254"
)
private var closeApproach = CloseApproach(
    closeApproachDate : "2021-05-09",
    closeApproachDateFull : "2021-May-09 14:43",
    //        epochDateCloseApproach : "1620571380000",
    relativeVelocity : velocity,
    missDistance : distance,
    orbitingBody : "Earth"
)
/////////////////////////////////////////////////////

var nearEarthObject = NearEarthObject(
    links : Links(
        next : nil,
        prev : nil, self : "http://www.neowsapp.com/rest/v1/neo/2494710?api_key=DEMO_KEY"
    ),
    id : "2494710",
    name : "494710 (2005 MO13)",
    neoReferenceId : "2494710",
    nasaJplUrl : "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2494710",
    absoluteMagnitudeH : 20.8,
    isPotentiallyHazardousAsteroid : true,
    estimatedDiameter : estimatedDiameter,
    isSentryObject : false,
    closeApproachData : [closeApproach]
)

/////////////////////////////////////////////////////

var nearEarthObjects = NearEarthObjects(
    links : links,
    elementCount : 77,
    nearEarthObjects : [
        "2021-05-09" : [
            nearEarthObject,
            nearEarthObject,
            nearEarthObject,
            nearEarthObject
        ],
    ]
)

