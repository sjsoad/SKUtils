//
//  ServicePermissionsViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class ServicePermissionsViewController: UIViewController, ServicePermissionsInterface {

    var presenter: ServicePermissionsOutput?

    // MARK: - IBActions -
    
    @IBAction func checkBluetoothPermissionsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCheckBluettothPermissionsEvent()
    }
    
    @IBAction func checkLocationPermissionsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCheckLocationPermissionsEvent()
    }
    
    @IBAction func checkMicrophonePermissionsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCheckMicrophonePermissionsEvent()
    }
    
    @IBAction func checkCameraPermissionsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCheckCameraPermissionsEvent()
    }
    
    @IBAction func checkPhotosPermissionsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCheckPhotosPermissionsEvent()
    }
    
    @IBAction func checkContactsPermissionsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCheckContactsPermissionsEvent()
    }
    
    // MARK: - ServicePermissionsInterface -
    
}
