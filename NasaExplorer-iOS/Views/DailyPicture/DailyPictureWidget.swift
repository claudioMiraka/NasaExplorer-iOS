//
//  DailyPictureWidget.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/27/22.
//

import SwiftUI

struct DailyPictureWidget: View {
    
    let dailyPicture : DailyPicture
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dailyPicture.hdurl)) { phase in
                if phase.error != nil{
                    Text("Error loading image")
                }else if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    ProgressView().frame(width: 100, height: 100).padding()
                }
            }
            Text(dailyPicture.title)
                .padding()
            Text(dailyPicture.explanation)
                .padding()
        }
    }
}

struct DailyPictureWidget_Previews: PreviewProvider {
    static var previews: some View {
        DailyPictureWidget(dailyPicture: fakeDailyPicture)
    }
}
