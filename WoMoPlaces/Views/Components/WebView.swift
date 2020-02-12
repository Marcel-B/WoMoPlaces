//
//  WebView.swift
//  WoMoPlaces
//
//  Created by Marcel Benders on 12.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//
import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable{
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
