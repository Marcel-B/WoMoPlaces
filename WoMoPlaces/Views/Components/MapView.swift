//
//  MapView.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 10.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    let title: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = coordinate
        
        
        view.addAnnotation(annotation)
        var span: MKCoordinateSpan
        var region: MKCoordinateRegion
        
        
        span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        region = MKCoordinateRegion(center: coordinate, span: span)
        view.mapType = MKMapType.satellite
        
        
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 2, longitude: 2), title: "Test")
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: 2, longitude: 2), title: "Test")
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
            
            MapView(coordinate: CLLocationCoordinate2D(latitude: 2, longitude: 2), title: "Test")
                .previewLayout(.sizeThatFits)
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")
        }
    }
}
