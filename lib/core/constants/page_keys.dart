import 'package:flutter/foundation.dart';

class SignUpPageKeys {
  final photoFileInput = const Key('photoFileInput');
  final firstNameInput = const Key('firstNameInput');
  final lastNameInput = const Key('lastNameInput');
  final countryPhoneInput = const Key('countryPhoneInput');
  final phoneNumberInput = const Key('phoneNumberInput');
  final emailInput = const Key('emailInput');
  final passwordInput = const Key('passwordInput');
  final passwordVisibilityToggle = const Key('passwordVisibilityToggle');
  final signUpButton = const Key('signUpButton');
  final alreadyHaveAnAccountSignInButton = const Key('alreadyHaveAnAccountSignInButton');
}

class PhotoFileInputKeys {
  final takePhoto = const Key('takePhoto');
  final chooseFromGallery = const Key('chooseFromGallery');
  final takeVideo = const Key('takeVideo');
  final chooseFromVideo = const Key('chooseFromVideo');
}

class EmailVerificationPageKeys {
  final verifyButton = const Key('verifyButton');
  final verifyLaterButton = const Key('verifyLaterButton');
  final resendCodeButton = const Key('resendCodeButton');
  final codeInput = const Key('codeInput');
}

class LoginPageKeys {
  final emailInput = const Key('emailInput');
  final passwordInput = const Key('passwordInput');
  final passwordVisibilityToggle = const Key('passwordVisibilityToggle');
  final loginButton = const Key('loginButton');
  final forgotPasswordButton = const Key('forgotPasswordButton');
  final createAccountButton = const Key('createAccountButton');
  final acceptTermsAndConditionsButton = const Key('acceptTermsAndConditionsButton');
  final acceptPrivacyPolicyButton = const Key('acceptPrivacyPolicyButton');
  final googleButton = const Key('googleButton');
  final appleButton = const Key('appleButton');
  final dontHaveAnAccountSignUpButton = const Key('dontHaveAnAccountSignUpButton');
}

class PageKeys {
  final signUpPage = SignUpPageKeys();
  final photoFileInput = PhotoFileInputKeys();
  final emailVerificationPage = EmailVerificationPageKeys();
  final loginPage = LoginPageKeys();
}


final pageKeys = PageKeys();