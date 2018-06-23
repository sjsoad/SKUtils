platform :ios, '11.0'

def shared_pods
    
    use_frameworks!
	pod 'SwiftLint'
    pod 'AlamofireImage'
    
    # UI components
    
    pod 'SKActivityViewable'#, :path => '/Users/sergey/Work/Pods/ActivityViewable'
    pod 'SKAlertViewable'#, :path => '/Users/sergey/Work/Pods/AlertViewable'
    pod 'AlertActionBuilder'#, :path => '/Users/sergey/Work/Pods/AlertActionBuilder'
    pod 'SKAlertControllerBuilder'#, :path => '/Users/sergey/Work/Pods/AlertControllerBuilder'
    pod 'SKAlertControllerShowing'#, :path => '/Users/sergey/Work/Pods/AlertControllerShowing'
    pod 'SKTextInputsManager'#, :path => '/Users/sergey/Projects/TextInputsManager'
    pod 'SKTextInputs'#, :path => '/Users/sergey/Work/Pods/TextInputs'
    pod 'SKPickerViewManager'#, :path => '/Users/sergey/Work/Pods/PickerViewManager'
    pod 'SKXibLoadableView'#, :path => '/Users/sergey/Work/Pods/XibLoadableView'
    pod 'SKAppSettingsShowing'#, :path => '/Users/Sergey/Work/Pods/AppSettingsShowing'
    pod 'SKImagePicking'#, :path => '/Users/Sergey/Work/Pods/ImagePicking'
    pod 'SKImagePreviewing'#, :path => '/Users/Sergey/Projects/Image-Previewing'
    
    # Capabilities permissions

    pod 'SKServicePermissions'#, :path => '/Users/sergey/Work/Pods/ServicePermission'
    pod 'SKBluetoothPermissions'#, :path => '/Users/sergey/Work/Pods/BluetoothPermissions'
    pod 'SKCameraPermissions'#, :path => '/Users/sergey/Work/Pods/CameraPermissions'
    pod 'SKPhotosPermissions'#, :path => '/Users/sergey/Work/Pods/PhotosPermissions'
    pod 'SKContactsPermissions'#, :path => '/Users/sergey/Work/Pods/ContactsPermissions'
    pod 'SKMicrophonePermissions'#, :path => '/Users/sergey/Work/Pods/MicrophonePermissions'
    pod 'SKLocationPermissions'#, :path => '/Users/sergey/Work/Pods/LocationPermissions'

    # Services

    pod 'SKLocalDataStorage'#, :path => '/Users/sergey/Work/Pods/LocalDataStorage'
    pod 'SKValidationService'#, :path => '/Users/sergey/Work/Pods/ValidationService'

    # Data Sources
    
    pod 'SKDataSources'#, :path => '/Users/sergey/Work/Pods/DataSources'
    
    # Networking
    
    pod 'SKNetworkingLib'#, :path => '/Users/Sergey/Projects/Networking'
    
    # Custom Navigation
    
    pod 'SKCustomNavigation'#, :path => '/Users/Sergey/Projects/CustomNavigation'

end

target 'SKUtils' do
    shared_pods
end

target 'SKUtilsTests' do
    inherit! :complete
    pod 'SKValidationService'
end
