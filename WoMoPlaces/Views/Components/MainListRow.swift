//
//  MainListRow.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 09.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct MainListRow: View {
    let viewModel: MainListRowViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.name)
                Spacer()
                Text(viewModel.countryName)
                Image(viewModel.countryImage)
            }
            
            HStack {
                Image(viewModel.channelImage)
                    .clipShape(Circle())
                Text(viewModel.channelName)
                Spacer()
            }
        }
    }
}

struct MainListRow_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            MainListRow(viewModel: MainListRowViewModel(poi: Poi()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            MainListRow(viewModel: MainListRowViewModel(poi: Poi()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            MainListRow(viewModel: MainListRowViewModel(poi: Poi()))
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
