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
        else {
            alert(title: "Waze", message: "Please enter an address.")
        }
        self.setEditing(false, animated: true)
    }

    @IBAction func searchButtonTapped(_ sender: Any) {
        if let addressString = inputTextField.text, addressString.characters.count > 0 {
            searchAddressString(addressString)
        }
        else {
            alert(title: "Waze", message: "Please enter an address.")
        }
        self.setEditing(false, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        if !wazeLauncher.configurationIsValid {
            alert(title: "Waze", message: "Application is not configured to integrate with Waze. See Info.plist.")
        }
    }

    private func searchAddressString(_ addressString: String) {
        if !wazeLauncher.search(withAddressString: addressString) {
            promptToOpenAppStore()
        }
    }

    private func geocodeAddressString(_ addressString: String) {
        if let addressString = inputTextField.text,
            addressString.characters.count > 0 {
            geocoder.geocodeAddressString(addressString) {
                [weak self] (placemarks, error) in
                if let s = self,
                    let location = placemarks?.first?.location {
                    if !s.wazeLauncher.navigate(toLocation: location) {
                        s.promptToOpenAppStore()
                    }
                }
            }
        }
    }

    private func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func promptToOpenAppStore() {
        let title = "Waze"
        let message = "The Waze app is not installed. Would you like to install it now?"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [unowned self] (action) in
            self.wazeLauncher.openAppStore()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

}
