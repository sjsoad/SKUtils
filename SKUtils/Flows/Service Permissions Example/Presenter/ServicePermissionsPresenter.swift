//
//  ServicePermissionsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
import AlertActionBuilder
import SKAlertControllerShowing
import SKAppSettingsShowing
// #1 add needed keys with description to info.plist
// #2 import modules
// NSBluetoothPeripheralUsageDescription
import SKBluetoothPermissions
// NSLocationAlwaysAndWhenInUseUsageDescription, NSLocationWhenInUseUsageDescription
import SKLocationPermissions
// NSMicrophoneUsageDescription
import SKMicrophonePermissions
// NSCameraUsageDescription
import SKCameraPermissions
// NSPhotoLibraryUsageDescription
import SKPhotosPermissions
// NSContactsUsageDescription
import SKContactsPermissions

protocol ServicePermissionsInterface: class, AppSettingsShowingInterface {
    
}

protocol ServicePermissionsOutput {
 
    func viewTriggeredCheckBluettothPermissionsEvent()
    func viewTriggeredCheckLocationPermissionsEvent()
    func viewTriggeredCheckMicrophonePermissionsEvent()
    func viewTriggeredCheckCameraPermissionsEvent()
    func viewTriggeredCheckPhotosPermissionsEvent()
    func viewTriggeredCheckContactsPermissionsEvent()
    
}

class ServicePermissionsPresenter: NSObject, AppSettingsShowing {
    
    private weak var view: ServicePermissionsInterface?
    
    // #3 create permissions object
    private let bluetoothPermissions: BluetoothPermissions = DefaultBluetoothPermissions()
    // can set auth type .requestAlwaysAuthorization or requestWhenInUseAuthorization
    private let locationPermissions: LocationPermissions = DefaultLocationPermissions()
    private let microphonePermissions: MicrophonePermissions = DefaultMicrophonePermissions()
    private let cameraPermissions: CameraPermissions = DefaultCameraPermissions()
    private let photosPermissions: PhotoLibraryPermissions = DefaultPhotoLibraryPermissions()
    private let contactsPermissions: ContactsPermissions = DefaultContactsPermissions()
    
    init(with view: ServicePermissionsInterface) {
        self.view = view
    }
    
    // MARK: - AppSettingsShowing -
    
    var appSettingsShowingInterface: AppSettingsShowingInterface? {
        return view
    }
    
    // MARK: - Private -
    
    private func showAuthorizedAlert() {
        let cancelAction = AlertActionConfig(title: "Ok", style: .cancel)
        view?.showAlertController(with: "Permissions Granted", message: nil, actionsConfiguration: [cancelAction], preferredStyle: .alert,
                                  completion: nil, popoveConfigurationHandler: nil)
    }
    
    // MARK: - Permissions -
    
    private func checkBluetoothPermissions() {
        // #4 check state
        let state = bluetoothPermissions.permissionsState()
        // #5 request if needed
        if state.authStatus == .notDetermined {
            bluetoothPermissions.requestPermissions { [weak self] (_) in
                self?.checkBluetoothPermissions()
            }
        } else if state.authStatus == .denied {
            // #6 ask user to change permissions state in Settings
            let stringsProvider = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Bluetooth permissions denied")
            showAppSettingsAlert(with: stringsProvider)
        } else if state.authStatus == .authorized {
            // #7 do what you need
            showAuthorizedAlert()
        }
    }
    
    private func checkLocationPermissions() {
        let state = locationPermissions.permissionsState()
        if state == .notDetermined {
            locationPermissions.requestPermissions { [weak self] (_) in
                self?.checkLocationPermissions()
            }
        } else if state == .denied {
            let stringsProvider = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Location permissions denied")
            showAppSettingsAlert(with: stringsProvider)
        } else if state == .authorizedAlways || state == .authorizedWhenInUse {
            showAuthorizedAlert()
        }
    }
    
    private func checkMicrophonePermissions() {
        let state = microphonePermissions.permissionsState()
        if state == .undetermined {
            microphonePermissions.requestPermissions { [weak self] (_) in
                self?.checkMicrophonePermissions()
            }
        } else if state == .denied {
            let stringsProvider = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Microphone permissions denied")
            showAppSettingsAlert(with: stringsProvider)
        } else if state == .granted {
            showAuthorizedAlert()
        }
    }
    
    private func checkCameraPermissions() {
        let state = cameraPermissions.permissionsState()
        if state == .notDetermined {
            cameraPermissions.requestPermissions { [weak self] (_) in
                self?.checkCameraPermissions()
            }
        } else if state == .denied {
            let stringsProvider = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Camera permissions denied")
            showAppSettingsAlert(with: stringsProvider)
        } else if state == .authorized {
            showAuthorizedAlert()
        }
    }

    private func checkPhotosPermissions() {
        let state = photosPermissions.permissionsState()
        if state == .notDetermined {
            photosPermissions.requestPermissions { [weak self] (_) in
                self?.checkPhotosPermissions()
            }
        } else if state == .denied {
            let stringsProvider = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Photo Library permissions denied")
            showAppSettingsAlert(with: stringsProvider)
        } else if state == .authorized {
            showAuthorizedAlert()
        }
    }
    
    private func checkContactsPermissions() {
        let state = contactsPermissions.permissionsState()
        if state == .notDetermined {
            contactsPermissions.requestPermissions { [weak self] (_) in
                self?.checkContactsPermissions()
            }
        } else if state == .denied {
            let stringsProvider = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Contacts permissions denied")
            showAppSettingsAlert(with: stringsProvider)
        } else if state == .authorized {
            showAuthorizedAlert()
        }
    }
    
}

// MARK: - ServicePermissionsOutput -

extension ServicePermissionsPresenter: ServicePermissionsOutput {

    func viewTriggeredCheckBluettothPermissionsEvent() {
        checkBluetoothPermissions()
    }

    func viewTriggeredCheckLocationPermissionsEvent() {
        checkLocationPermissions()
    }
    
    func viewTriggeredCheckMicrophonePermissionsEvent() {
        checkMicrophonePermissions()
    }
    
    func viewTriggeredCheckCameraPermissionsEvent() {
        checkCameraPermissions()
    }
    
    func viewTriggeredCheckPhotosPermissionsEvent() {
        checkPhotosPermissions()
    }
    
    func viewTriggeredCheckContactsPermissionsEvent() {
        checkContactsPermissions()
    }
    
}
