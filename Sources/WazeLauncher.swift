//
//  WazeLauncher.swift
//  Waze
//
//  Created by Brennan Stehling on 3/20/17.
//  Copyright © 2017 SmallSharpTools LLC. All rights reserved.
//

// Waze developer documentions:
// https://www.waze.com/about/dev

import Foundation
import UIKit
import CoreLocation

open class WazeLauncher: NSObject {

    private var baseURL: URL? {
        return URL(string: "waze://")
    }

    public var configurationIsValid: Bool {
        guard let schemes = Bundle.main.infoDictionary?["LSApplicationQueriesSchemes"] as? [String] else {
            return false
        }

        return schemes.contains("waze")
    }

    open func navigate(toLocation location: CLLocation) -> Bool {
        return navigate(toCoordinate: location.coordinate)
    }

    open func navigate(toCoordinate coordinate: CLLocationCoordinate2D) -> Bool {
        let params = [
            "ll" : "\(coordinate.latitude),\(coordinate.longitude)",
            "navigate" : "yes"
        ]
        return openApplication(withParameters: params)
    }

    open func search(withAddressString addressString: String) -> Bool {
        let params = ["q" : addressString]
        return openApplication(withParameters: params)
    }

    // MARK: - Internal -

    internal func openApplication(withParameters params: [String : Any]) -> Bool {
        guard let baseURL = baseURL,
            let appURL = appendQueryParameters(params, aURL: baseURL) else {
                debugPrint("Unable to create URL to launch Waze.")
                return false
        }
        return openURL(appURL)
    }

    internal func openURL(_ appURL: URL) -> Bool {
        if UIApplication.shared.canOpenURL(appURL) {
            debugPrint("Opening Waze: \(appURL.absoluteString)")
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            return true
        }
        else {
            debugPrint("Unable to open Waze: \(appURL)")
            return false
        }
    }

    internal func appendQueryParameters(_ parameters: [String : Any], aURL: URL?) -> URL? {
        guard let aURL = aURL else { return nil }
        var components = URLComponents(url: aURL, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.flatMap {
            return URLQueryItem(name: $0, value: "\($1)")
        }

        return components?.url
    }

}
