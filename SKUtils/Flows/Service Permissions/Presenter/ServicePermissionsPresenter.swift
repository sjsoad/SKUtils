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
    private let bluetoothPermissions = BluetoothPermissions()
    private let locationPermissions = LocationPermissions()
    private let microphonePermissions = MicrophonePermissions()
    private let cameraPermissions = CameraPermissions()
    private let photosPermissions = PhotoLibraryPermissions()
    private let contactsPermissions = ContactsPermissions()
    
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
                                  completion: nil)
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
            showAppSettingsAlert()
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
            showAppSettingsAlert()
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
            showAppSettingsAlert()
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
            showAppSettingsAlert()
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
            showAppSettingsAlert()
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
            showAppSettingsAlert()
        } else if state == .authorized {
            showAuthorizedAlert()
        }
    }
    
}

// MARK: - ServicePermissionsPresenterOutput -

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
