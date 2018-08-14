platform :ios, '11.0'

def shared_pods
    
    use_frameworks!
	pod 'SwiftLint'
    pod 'AlamofireImage'
    
    # UI components
    
    pod 'SKActivityViewable', :path => '/Users/Sergey/Work/Pods/ActivityViewable'
    pod 'SKAlertViewable', :path => '/Users/Sergey/Work/Pods/AlertViewable'
    pod 'AlertActionBuilder', :path => '/Users/Sergey/Work/Pods/AlertActionBuilder'
    pod 'SKAlertControllerBuilder', :path => '/Users/Sergey/Work/Pods/AlertControllerBuilder'
    pod 'SKAlertControllerShowing', :path => '/Users/Sergey/Work/Pods/AlertControllerShowing'
    pod 'SKTextInputsManager', :path => '/Users/Sergey/Work/Pods/TextInputsManager'
    pod 'SKTextInputs', :path => '/Users/Sergey/Work/Pods/TextInputs'
    pod 'SKPickerViewManager', :path => '/Users/Sergey/Work/Pods/PickerViewManager'
    pod 'SKXibLoadableView', :path => '/Users/Sergey/Work/Pods/XibLoadableView'
    pod 'SKAppSettingsShowing', :path => '/Users/Sergey/Work/Pods/AppSettingsShowing'
    pod 'SKImagePicking', :path => '/Users/sergey/Work/Pods/ImagePicking'
    pod 'SKImagePreviewing', :path => '/Users/Sergey/Work/Pods/Image-Previewing'
    
    # Capabilities permissions

    pod 'SKServicePermissions', :path => '/Users/Sergey/Work/Pods/ServicePermission'
    pod 'SKBluetoothPermissions', :path => '/Users/Sergey/Work/Pods/BluetoothPermissions'
    pod 'SKCameraPermissions', :path => '/Users/Sergey/Work/Pods/CameraPermissions'
    pod 'SKPhotosPermissions', :path => '/Users/Sergey/Work/Pods/PhotosPermissions'
    pod 'SKContactsPermissions', :path => '/Users/Sergey/Work/Pods/ContactsPermissions'
    pod 'SKMicrophonePermissions', :path => '/Users/Sergey/Work/Pods/MicrophonePermissions'
    pod 'SKLocationPermissions', :path => '/Users/Sergey/Work/Pods/LocationPermissions'

    # Services

    pod 'SKLocalDataStorage', :path => '/Users/Sergey/Work/Pods/LocalDataStorage'
    pod 'SKValidationService', :path => '/Users/Sergey/Work/Pods/ValidationService'

    # Data Sources
    
    pod 'SKDataSources', :path => '/Users/Sergey/Work/Pods/DataSources'
    
    # Networking
    
    pod 'SKNetworkingLib', :path => '/Users/Sergey/Work/Pods/Networking'
    
    # Custom Navigation
    
    pod 'SKCustomNavigation', :path => '/Users/Sergey/Work/Pods/CustomNavigation'

    # Animations

    pod 'SKAnimator', :path => '/Users/Sergey/Work/Pods/Animator'

end

target 'SKUtils' do
    shared_pods
end

target 'SKUtilsTests' do
    inherit! :complete
    pod 'SKValidationService', :path => '/Users/Sergey/Work/Pods/ValidationService'
end
