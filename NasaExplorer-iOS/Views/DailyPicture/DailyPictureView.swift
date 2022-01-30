//
//  DailyPictureView.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/21/22.
//

import SwiftUI

struct DailyPictureView: View {
    
    @ObservedObject var dailyPictureViewModel : DailyPictureViewModel
    
    var body: some View {
        if dailyPictureViewModel.isWaiting {
            Text("Loading...")
        } else{
            if dailyPictureViewModel.dailyPicture != nil {
                DailyPictureWidget(dailyPicture: dailyPictureViewModel.dailyPicture!)
            }else{
                Text("Error getting data. Check logs.")
            }
        }
    }
}

struct DailyPictureView_Previews: PreviewProvider {
    static var previews: some View {
        DailyPictureView(dailyPictureViewModel: DailyPictureViewModel())
    }
}
