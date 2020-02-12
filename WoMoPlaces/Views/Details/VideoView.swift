//
//  VideoView.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 10.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    let poi: Poi
    var body: some View {
        WebView(url: poi.link!)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(poi: Poi())
    }
}
