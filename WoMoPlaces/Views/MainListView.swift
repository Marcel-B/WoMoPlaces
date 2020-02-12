//
//  MainListView.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 09.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct MainListView: View {
    @FetchRequest(entity: Poi.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Poi.name, ascending: true)]) var pois: FetchedResults<Poi>
    @State var search =  ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(pois, id: \.self)  { poi in
                    NavigationLink(destination: PoiDetailsView(viewModel: PoiDetailsViewModel(poi: poi))) {
                        MainListRow(viewModel: MainListRowViewModel(poi: poi))
                    }
                }
            }.navigationBarTitle("Plätze")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
