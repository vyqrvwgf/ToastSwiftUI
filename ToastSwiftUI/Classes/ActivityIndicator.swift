//
//  ActivityIndicator.swift
//  SwiftUIDemo
//
//  Created by Huy Nguyen on 9/16/20.
//  Copyright © 2020 HuyNguyen. All rights reserved.
//

import SwiftUI
#if os(OSX)
  import Cocoa
#elseif os(iOS)
  import UIKit
#endif

#if os(OSX)
struct ActivityIndicator: NSViewRepresentable {
}
#elseif os(iOS)
struct ActivityIndicator: UIViewRepresentable {
    let isAnimating: Bool
    
    init(isAnimating: Bool = true) {
        self.isAnimating = isAnimating
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = false
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating && uiView.isAnimating == false {
            uiView.startAnimating()
        }
        else if isAnimating == false && uiView.isAnimating {
            uiView.stopAnimating()
        }
    }
}
#endif
