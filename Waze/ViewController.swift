//
//  ViewController.swift
//  Waze
//
//  Created by Brennan Stehling on 3/20/17.
//  Copyright © 2017 SmallSharpTools LLC. All rights reserved.
//

import UIKit
import CoreLocation
import WazeKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!

    private lazy var geocoder: CLGeocoder = {
        return CLGeocoder()
    }()

    private lazy var wazeLauncher: WazeLauncher = {
        return WazeLauncher()
    }()

    @IBAction func navigateButtonTapped(_ sender: Any) {
        if let addressString = inputTextField.text, addressString.characters.count > 0 {
            geocodeAddressString(addressString)
        }
        self.setEditing(false, animated: true)
    }

    private func geocodeAddressString(_ addressString: String) {
        geocoder.geocodeAddressString(addressString) { [weak self] (placemarks, error) in
            if let location = placemarks?.first?.location {
                self?.wazeLauncher.navigate(toLocation: location)
            }
        }
    }
    
}
