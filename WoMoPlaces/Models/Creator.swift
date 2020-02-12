//
//  Creator.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 09.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import CoreData

class ContentCreator {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func getFetch(entityName: String) -> NSFetchRequest<NSFetchRequestResult>{
        NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    }
    
    
    func createChannels(){
        do{
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Channel")
            let fetchResult = try self.context.fetch(fetch)
            let channels = fetchResult as! [Channel]
            
            let fetchCountries = NSFetchRequest<NSFetchRequestResult>(entityName: "Country")
            let fetchCountriesResult = try self.context.fetch(fetchCountries)
            let countries = fetchCountriesResult as! [Country]
            
            let germany = countries.first { $0.shortname == "de" }
            let france = countries.first { $0.shortname == "fr" }
            let croatia = countries.first { $0.shortname == "hr" }
            let espania = countries.first { $0.shortname == "es" }
            
            let maybeIrisUndUwe = channels.first { $0.name == "Iris und Uwes WoMo Welt" }
            var irisUndUwe: Channel
            
            if maybeIrisUndUwe == nil {
                irisUndUwe = Channel(context: context)
                irisUndUwe.name = "Iris und Uwes WoMo Welt"
                irisUndUwe.id = UUID()
                irisUndUwe.created = Date()
                irisUndUwe.image = "IrisUndUwesWoMoWelt96"
                irisUndUwe.link = URL(string: "https://www.youtube.com/channel/UCUx3cTr_gnQY8UtWLXRNWcg/about")
            }else{
                irisUndUwe = maybeIrisUndUwe!
            }

            let maybeCamper = channels.first { $0.name == "Die-Camper.com" }
            var camper: Channel
            if maybeCamper == nil {
                camper = Channel(context: context)
                camper.id = UUID()
                camper.created = Date()
                camper.name = "Die-Camper.com"
                camper.image = "die_camper_com96"
                camper.link = URL(string: "https://www.youtube.com/channel/UCcGiIegYTvv81Gkzef7rf2Q")
            }else{
                camper = maybeCamper!
            }
            
            let camperPois = camper.poi?.allObjects as! [Poi]
            
            if !camperPois.contains { $0.name == "Picknickplatz Nähe Belej"}
            {
                let poi = Poi(context: context)
                poi.longitude = 14.448194
                poi.latitude = 44.785444
                poi.name = "Picknickplatz Nähe Belej"
                poi.id = UUID()
                poi.link = URL(string: "https://youtu.be/NF9tsUJ46NQ?t=65")
                
                poi.created = Date()
                
                croatia?.addToPoi(poi)
                camper.addToPoi(poi)
            }
            
            if !camperPois.contains { $0.name == "Picknickplatz Leuchtturm Savudrija" }{
                let poi = Poi(context: context)
                poi.id = UUID()
                poi.name = "Picknickplatz Leuchtturm Savudrija"
                poi.longitude =  13.491389
                poi.latitude = 45.490444
                poi.link = URL(string: "https://youtu.be/24jLUHjEo9Y?t=115")
                
                poi.created = Date()
                
                croatia?.addToPoi(poi)
                camper.addToPoi(poi)
            }
            
            
            
            let maybeHaco = channels.first { $0.name == "Hartmut Conrad" }
            var haco: Channel
            if maybeHaco == nil{
                haco = Channel(context: context)
                haco.id = UUID()
                haco.created = Date()
                haco.name = "Hartmut Conrad"
                haco.image = "haco96"
                haco.link = URL(string: "https://www.youtube.com/channel/UC1u-0qknJkPpVDxmUFWkl1g/about")
            }else{
                haco = maybeHaco!
            }
            
            let hacosPois = haco.poi?.allObjects as! [Poi]
            
            if !hacosPois.contains { $0.name == "Stellplatz Mendig" }{
                let poi = Poi(context: context)
                poi.longitude = 7.284167
                poi.latitude = 50.376944
                poi.name = "Stellplatz Mendig"
                poi.id = UUID()
                poi.created = Date()
                poi.link = URL(string: "https://youtu.be/DssJ-gZT1PE?t=116")
                germany?.addToPoi(poi)
                haco.addToPoi(poi)
            }
     
            if !hacosPois.contains { $0.name == "Stellplatz Langres" }{
                let langres = Poi(context: context)
                langres.longitude =  5.335000
                langres.latitude = 47.854722
                langres.name = "Stellplatz Langres"
                langres.created = Date()
                langres.id = UUID()
                langres.link = URL(string: "https://youtu.be/DssJ-gZT1PE?t=366")
                france?.addToPoi(langres)
                haco.addToPoi(langres)
            }
            
        
       
            
            try context.save()
        }catch{
            print("Error while saving camper")
            print(error)
        }
    }
    
    func createCountrys(){
        do{
            let fetchCountries = NSFetchRequest<NSFetchRequestResult>(entityName: "Country")
            let fetchCountriesResult = try self.context.fetch(fetchCountries)
            let countries = fetchCountriesResult as! [Country]
            
            
            if !countries.contains { $0.shortname == "fr" } {
                let france = Country(context: context)
                france.created = Date()
                france.id = UUID()
                france.name = "Frankreich"
                france.shortname = "fr"
            }
            
            
            if !countries.contains { $0.shortname == "hr" } {
                let croatia = Country(context: context)
                croatia.created = Date()
                croatia.id = UUID()
                croatia.name = "Kroatien"
                croatia.shortname = "hr"
            }
            
            if !countries.contains { $0.shortname == "de" } {
                let germany = Country(context: context)
                germany.created = Date()
                germany.id = UUID()
                germany.name = "Deutschland"
                germany.shortname = "de"
            }
            
            if !countries.contains { $0.shortname == "es" }{
                let espania = Country(context: context)
                espania.created = Date()
                espania.name = "Spanien"
                espania.shortname = "es"
                espania.id = UUID()
            }
           
            try context.save()
        }catch{
            print("Error while saving camper")
            print(error)
        }
    }
    
    func createPois(){
 
    }
    
    func create(){
        createCountrys()
        createChannels()
        
    }
}
