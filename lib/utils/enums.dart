enum ButtonType { initial, pressed }

enum ScreenSize { large, medium, small }

enum AnimateType { slideLeft, slideUp }

enum AppTextFieldType {
  regular,
  phone,
  search,
  multiline,
}

enum PostType { text, image, video, audio }

enum IncidentType { missingPerson, stolenCar, wanted, ambulance, robbery, vandalism, fireOrExplosion, crime, carAccident }

///TO ENABLE RESPONSE TEAM ACCEPT OR DECLINE REQUEST
enum IncidentStatus { pending, resolved, declined, accepted, movedToLocation }

enum ViewState { initial, loading, loaded, error }

enum AuthState { signedIn, signedOut, notCompleted }

///[active] user has successfully completed profile
///[signedOut] user has logged/SIGNED out from account
///[doesNotExist] user is yet to complete profile or user just created a new account
///[deactivated] user has been blocked  for suspicious activities
enum UserStatus { active, signedOut, doesNotExist, deactivated }
