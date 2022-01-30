//
//  MarsPicturesViewModel.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/30/22.
//

import Foundation

class MarsPicturesViewModel : ObservableObject {
    
    @Published var marsPictures : MarsPictures?
    @Published var isWaiting: Bool = false
    
    func getUrl() -> String {
        let troday = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let todayFormatted = format.string(from: troday)
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=\(todayFormatted)&api_key=\(apiKey)"
//        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2021-5-18&api_key=stbdBW7kFv7rdSOxvogZL4e43QYHEtFTUrQ7Z54B"// this has many pics
        return url
    }
    
    init() {
        fetchMarsPictures()
    }
    
    
    func fetchMarsPictures(){
        self.isWaiting = true
        Task.init(priority: TaskPriority.high, operation: {
            let pics :  MarsPictures? = await fetchData(getUrl())
            DispatchQueue.main.async {
                self.marsPictures = pics
                self.isWaiting = false
            }
        })
    }
}

