# SKUtils  

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


# Runes Example  

Functor  
    <^> (pronounced "map")  
Applicative Functor  
    <*> (pronounced "apply")  
    <* (pronounced "left sequence")  
    *> (pronounced "right sequence")  
    pure (pronounced "pure")  
Alternative  
    <|> (pronounced "alternate")  
    empty (pronounced "empty")  
Monad  
    >>- (pronounced "flatMap") (left associative)  
    -<< (pronounced "flatMap") (right associative)  
    >-> (pronounced "Monadic compose") (left associative)  
    <-< (pronounced "Monadic compose") (right associative)  

func customPrint(value: Any) {  
    print(value)  
}  

print("*********")  

customPrint -<< [1, 2, 3, 4, 5]  
customPrint -<< nil  
customPrint -<< "not nil"  

print("*********")  

[1, 2, 3, 4, 5] >>- customPrint  
nil >>- customPrint  
"not nil" >>- customPrint  

print("*********")  

print("not nil" <|> "another value") // Optional("not nil")  
print(nil <|> "another value") // Optional("another value")  

print("*********")  

print(["array"] + pure("some string")) // ["array", "some string"]  

print("*********")  

customPrint <*> [1, 2, 3, 4, 5] // prints array  
customPrint <*> "value" // prints value  
customPrint <*> nil // not printing  

print("*********")  

customPrint <^> [1, 2, 3, 4, 5] // print each value  
customPrint <^> "value" // value  
customPrint <^> nil // not printing  

print("*********")  

customPrint <*> (nil <|> "not nil") // not nil  
