//
//  PoiDetailsViewModel.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 11.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import MapKit

class PoiDetailsViewModel {
    let poi: Poi
    
    init(poi: Poi){
        self.poi = poi
    }
    
    var name: String {
        get {
            if let value = poi.name{
                return value
            }
            return String.empty
        }
    }
    
    var channelName: String {
        get {
            if let channel = poi.channel {
                if let name = channel.name {
                    return name
                }
            }
            return String.empty
        }
    }
    
    var channelImageName: String {
        get {
            if let channel = poi.channel {
                if let name = channel.image {
                    return name
                }
            }
            return String.empty
        }
    }
    
    var coordinate: CLLocationCoordinate2D {
        get {
            CLLocationCoordinate2D(latitude: poi.latitude, longitude: poi.longitude)
        }
    }
}
