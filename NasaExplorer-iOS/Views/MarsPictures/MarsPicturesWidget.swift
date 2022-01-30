//
//  MarsPictureWidget.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/30/22.
//

import SwiftUI

struct MarsPictureWidget: View {
    
    let marsPictures : MarsPictures
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100, maximum: UIScreen.screenWidth/2)),
        GridItem(.flexible(minimum: 100, maximum: UIScreen.screenWidth/2)),
    ]
    
    var body: some View {
        if(marsPictures.photos.isEmpty){
            Text("No Pictures to show")
        }else{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(marsPictures.photos, id: \.self) { pic in
                        MarsPictureTile(marsPicture: pic)
                    }
                }.font(.body)
            }
        }
    }
}

struct MarsPictureWidget_Previews: PreviewProvider {
    static var previews: some View {
        MarsPictureWidget(marsPictures: marsPictures)
    }
}
