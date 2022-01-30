//
//  ContentView.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/21/22.
//

import SwiftUI

struct ContentView: View {
    
    let marsPicturesViewModel = MarsPicturesViewModel()
    let dailyPictureViewModel = DailyPictureViewModel()
    let nearEarthObjectsViewModel = NearEarthObjectsViewModel()
    
    @State private var selection : Tab = .DailyPicture
    
    enum Tab {
        case MarsPictures
        case DailyPicture
        case NearEarthObjects
    }
    
    var body: some View {
        TabView(selection: $selection){
            MarsPicturesView(marsPicturesViewModel: marsPicturesViewModel )
                .tabItem{
                    Label("Mars Pictures", systemImage: "gyroscope")
                }
                .tag(Tab.MarsPictures)
                .onAppear {
                    if(marsPicturesViewModel.marsPictures == nil && !marsPicturesViewModel.isWaiting){
                        marsPicturesViewModel.fetchMarsPictures()
                    }
                }
                
            DailyPictureView(dailyPictureViewModel: dailyPictureViewModel)
                .tabItem{
                    Label("Daily Picture", systemImage: "star")
                }
                .tag(Tab.DailyPicture)
                .onAppear {
                    if(dailyPictureViewModel.dailyPicture == nil && !dailyPictureViewModel.isWaiting){
                        dailyPictureViewModel.fetchDailyPicture()
                    }
                }
            
            NearEarthObjectsView(nearEarthObjectsViewModel: nearEarthObjectsViewModel )
                .tabItem{
                    Label("Near Earth Objects", systemImage: "list.bullet")
                }
                .tag(Tab.NearEarthObjects)
                .onAppear {
                    if(nearEarthObjectsViewModel.nearEarthObjects == nil && !nearEarthObjectsViewModel.isWaiting){
                        nearEarthObjectsViewModel.fetchNearEarthObjects()
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
