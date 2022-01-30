//
//  NearEarthObjectTile.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/28/22.
//

import SwiftUI

struct NearEarthObjectTile: View {
    
    let nearEarthObject : NearEarthObject
    
    var body: some View {
        HStack( alignment: .top, spacing: 5.0){
            
            VStack (alignment: .leading, spacing: 7.0) {
                
                Text(nearEarthObject.name).font(.title2).fontWeight(.bold)
                
                HStack {
                    Text("Diameter: ")
                    Text("\(String(nearEarthObject.estimatedDiameter.kilometers.max)) km")
                }
                HStack {
                    Text("Distance: ")
                    Text("\(String(nearEarthObject.closeApproachData.first?.missDistance.kilometers ?? "N/A")) km")
                }
                HStack {
                    Text("Velocity: ")
                    Text("\(String(nearEarthObject.closeApproachData.first?.relativeVelocity.kilometersPerHour ?? "N/A")) km/h")
                }
                
            }
            
            Spacer()
            
            VStack (alignment: .trailing, spacing: 1.0){
                Text(nearEarthObject.id)
            }
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

struct NearEarthObjectTile_Previews: PreviewProvider {
    static var previews: some View {
        NearEarthObjectTile(nearEarthObject: nearEarthObject)
    }
}
