abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterValidationState extends RegisterStates {
  final Map<String,dynamic> error;
  RegisterValidationState(this.error);
}

class RegisterErrorState extends RegisterStates{}

class PasswordVisibilityState extends RegisterStates {}

class RePasswordVisibilityState extends RegisterStates {}

class GenderDropDownCallBackState extends RegisterStates {}

class RegisterChangeGenderState extends RegisterStates {}
