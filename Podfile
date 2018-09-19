platform :ios, '11.0'

def shared_pods
    
    use_frameworks!
	pod 'SwiftLint'
    
    # UI components
    
    pod 'SKActivityViewable'
    pod 'SKAlertViewable'
    pod 'AlertActionBuilder'
    pod 'SKAlertControllerBuilder'
    pod 'SKAlertControllerShowing'
    pod 'SKTextInputsManager'
    pod 'SKTextInputs'
    pod 'SKPickerViewManager'
    pod 'SKAppSettingsShowing'
    pod 'SKImagePicking'
    pod 'SKImagePreviewing'

    # Capabilities permissions

    pod 'SKBluetoothPermissions'
    pod 'SKCameraPermissions'
    pod 'SKPhotosPermissions'
    pod 'SKContactsPermissions'
    pod 'SKMicrophonePermissions'
    pod 'SKLocationPermissions'

    # Services

    pod 'SKLocalDataStorage'
    pod 'SKValidationService'

    # Data Sources
    
    pod 'SKDataSources'
    
    # Networking
    
    pod 'SKNetworkingLib'
    
    # Custom Navigation
    
    pod 'SKCustomNavigation'

    # Animations

    pod 'SKAnimator'

end

target 'SKUtils' do
    shared_pods
end

target 'SKUtilsTests' do
    inherit! :complete
    pod 'SKValidationService'
end
