//
//  NearEarthObjectsWidget.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/28/22.
//

import SwiftUI


struct NearEarthObjectsWidget: View {
    
    let nearEarthObjects : NearEarthObjects
    
    var body: some View {
        ScrollView{
            VStack (alignment: HorizontalAlignment.center, spacing: 5.0){
                
                Text("Near Earth Objects").fontWeight(.bold).padding()
                Text("There are \(nearEarthObjects.elementCount) objects near Earth").padding()
                
                VStack (alignment: HorizontalAlignment.center, spacing: 10){
                    ForEach (nearEarthObjects.nearEarthObjects[nearEarthObjects.nearEarthObjects.first!.key]! ,  id: \.self) { obj in
                        NearEarthObjectTile(nearEarthObject: obj)
                    }
                }.padding()
            }
        }
    }
}

struct NearEarthObjectsWidget_Previews: PreviewProvider {
    static var previews: some View {
        NearEarthObjectsWidget(nearEarthObjects: nearEarthObjects)
    }
}
