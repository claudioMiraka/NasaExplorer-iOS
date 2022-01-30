//
//  NearEarthObjectsView.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/21/22.
//

import SwiftUI

struct NearEarthObjectsView: View {
    
    @ObservedObject var nearEarthObjectsViewModel : NearEarthObjectsViewModel
    
    var body: some View {
        
        if nearEarthObjectsViewModel.isWaiting {
            Text("Loading...")
        } else{
            
            if let nearObj =
                nearEarthObjectsViewModel.nearEarthObjects {
                NearEarthObjectsWidget(nearEarthObjects: nearObj)
            }else{
                Text("Error getting data. Check logs.")
            }
            
        }
    }
}

struct NearEarthObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        NearEarthObjectsView(nearEarthObjectsViewModel: NearEarthObjectsViewModel())
    }
}
