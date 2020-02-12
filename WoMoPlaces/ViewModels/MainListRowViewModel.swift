//
//  MainListRowViewModel.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 11.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class MainListRowViewModel {
    let poi: Poi
    
    init(poi: Poi){
        self.poi = poi
    }
    
    var countryImage: String {
        get {
            if let country =  poi.country {
                if let name = country.shortname {
                    switch name {
                        case "de":
                            return "germany54"
                        case "fr":
                            return "france54"
                        case "hr":
                            return "croatia54"
                        default:
                            return ""
                    }
                }
            }
            return ""
        }
    }
    
    var channelImage: String {
        get {
            if let channel = poi.channel {
                if let image = channel.image {
                    return image
                }
            }
            return ""
        }
    }
    
    var channelName: String {
        get {
            if let channel = poi.channel {
                if let name = channel.name {
                    return name
                }
            }
            return ""
        }
    }
    
    var countryName: String {
        get {
            if let country = poi.country {
                if let name = country.name {
                    return name
                }
            }
            return ""
        }
    }
    
    var name: String {
        get {
            if let value = poi.name {
                return value
            }
            return ""
        }
    }
}
