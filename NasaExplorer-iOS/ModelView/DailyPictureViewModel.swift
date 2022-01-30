//
//  DailyPictureModelView.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/24/22.
//

import Foundation
import UIKit


class DailyPictureViewModel : ObservableObject {
    
    @Published var dailyPicture : DailyPicture?
    @Published var isWaiting: Bool = false
    
    let url = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)"
    
    init() {
        fetchDailyPicture()
    }
    
    
    func fetchDailyPicture(){
        self.isWaiting = true
        Task.init(priority: TaskPriority.high, operation: {
            let pic :  DailyPicture? = await fetchData(url)
            DispatchQueue.main.async {
                self.dailyPicture = pic
                self.isWaiting = false
            }
        })
    }
}
