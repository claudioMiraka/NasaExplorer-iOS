//
//  NearEarthObjectsViewModel.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/27/22.
//

import Foundation


class NearEarthObjectsViewModel : ObservableObject {
    
    @Published var nearEarthObjects : NearEarthObjects?
    @Published var isWaiting: Bool = false
    
    func getUrl() -> String {
        let troday = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let todayFormatted = format.string(from: troday)
        let url = "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(todayFormatted)&end_date=\(todayFormatted)&api_key=\(apiKey)"
        return url
    }
    
    init(){
        fetchNearEarthObjects()
    }
    
    func fetchNearEarthObjects () {
        isWaiting = true
        Task.init(priority: TaskPriority.high, operation: {
            let nearEarthObjects :  NearEarthObjects? = await fetchData(getUrl())
            DispatchQueue.main.async {
                self.nearEarthObjects = nearEarthObjects
                self.isWaiting = false
            }
        })
    }
    
}
