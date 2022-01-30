//
//  MarsPictureTile.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/30/22.
//

import SwiftUI

struct MarsPictureTile: View {
    
    let marsPicture : MarsPicture
    
    var body: some View {
        
        
        VStack (alignment: .leading, spacing: 7.0) {
            
            AsyncImage(url: URL(string: marsPicture.imgSrc)) { phase in
                if phase.error != nil{
                    Text("Error loading image")
                }else if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    ZStack {
                        
                    }
                    ProgressView()                       .aspectRatio(contentMode: .fill)
                }
            }
            
            Text("Rover: \(marsPicture.rover.name)")
            
            Text("Camera: \(marsPicture.camera.name)")
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

struct MarsPictureTile_Previews: PreviewProvider {
    static var previews: some View {
        MarsPictureTile(marsPicture: marsPicture)
    }
}
