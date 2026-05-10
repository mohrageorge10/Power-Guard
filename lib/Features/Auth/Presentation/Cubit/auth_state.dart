abstract class AuthState {}

class AuthInitial extends AuthState {}

// ================= Login States =================
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String role;
  LoginSuccess({required this.role});
}

class LoginFailure extends AuthState {
  final String errorMsg;
  LoginFailure({required this.errorMsg});
}

// ================= Register States =================
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String errorMsg;
  RegisterFailure({required this.errorMsg});
}

// ================= Forget Password States =================
class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {
  final String msg;
  ForgetPasswordSuccess({required this.msg});
}

class ForgetPasswordFailure extends AuthState {
  final String errorMsg;
  ForgetPasswordFailure({required this.errorMsg});
}

// ================= Verify OTP States =================
class VerifyOtpLoading extends AuthState {}

class VerifyOtpSuccess extends AuthState {
  final String msg;
  final String resetToken;

  VerifyOtpSuccess({required this.msg, required this.resetToken});
}

class VerifyOtpFailure extends AuthState {
  final String errorMsg;
  VerifyOtpFailure({required this.errorMsg});
}

// ================= Reset Password States =================
class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {
  final String msg;
  ResetPasswordSuccess({required this.msg});
}

class ResetPasswordFailure extends AuthState {
  final String errorMsg;
  ResetPasswordFailure({required this.errorMsg});
}

// ================= Logout States =================
class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutFailure extends AuthState {
  final String errorMsg;
  LogoutFailure({required this.errorMsg});
}

// ================= Role Selected States =================
class RoleSelected extends AuthState {}
