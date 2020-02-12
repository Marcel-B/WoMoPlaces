//
//  PoiDetailsView.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 09.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct PoiDetailsView: View {
    let viewModel: PoiDetailsViewModel
    
    var body: some View {
        VStack {
            HStack{
                Text(viewModel.channelName)
                Image(viewModel.channelImageName)
                    .clipShape(Circle())
            }
            
            Text(viewModel.name)
            
            MapView(coordinate: viewModel.coordinate, title: viewModel.name)
                .frame(height: 320)
            
            HStack{
                Button(action: {
                    let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: self.viewModel.coordinate))
                    mapItem.name = self.viewModel.name
                    mapItem.openInMaps(launchOptions:  [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
                }) {
                    HStack{
                        Image(systemName: "car")
                            .padding(.vertical)
                    }
                }
                Spacer()
                NavigationLink(destination: VideoView(poi: viewModel.poi)) {
                    Text("zum Video")
                }
            }
            
            Spacer()
        }.padding()
    }
}

struct PoiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PoiDetailsView(viewModel: PoiDetailsViewModel(poi: Poi()))
    }
}
