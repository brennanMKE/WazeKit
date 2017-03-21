//
//  WazeLauncher.swift
//  Waze
//
//  Created by Brennan Stehling on 3/20/17.
//  Copyright © 2017 SmallSharpTools LLC. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

open class WazeLauncher: NSObject {

    open func navigate(toLocation location: CLLocation) {
        navigate(toCoordinate: location.coordinate)
    }

    open func navigate(toCoordinate coordinate: CLLocationCoordinate2D) {
        guard let appURL = URL(string: "waze://?ll=\(coordinate.latitude),\(coordinate.longitude)&navigate=yes") else {
            debugPrint("Unable to create URL to launch Waze.")
            return
        }
        debugPrint("Opening Waze: \(appURL.absoluteString)")
        UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
    }

}
