//
//  MarsPicturesView.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/21/22.
//

import SwiftUI

struct MarsPicturesView: View {
    
    @ObservedObject var marsPicturesViewModel : MarsPicturesViewModel
    
    var body: some View {
        if marsPicturesViewModel.isWaiting {
            Text("Loading...")
        } else{
            if marsPicturesViewModel.marsPictures != nil {
                MarsPictureWidget(marsPictures: marsPicturesViewModel.marsPictures!)
            }else{
                Text("Error getting data. Check logs.")
            }
        }
    }
}

struct MarsPicturesView_Previews: PreviewProvider {
    static var previews: some View {
        MarsPicturesView(marsPicturesViewModel: MarsPicturesViewModel())
    }
}
