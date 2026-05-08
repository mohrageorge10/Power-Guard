import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Constants/app_strings.dart';
import 'package:power_guard/Core/Local_Storage/cache_helper.dart';
import 'package:power_guard/Core/Networking/API/api_keys.dart';
import 'package:power_guard/Core/Networking/Errors/exceptions.dart';
import 'package:power_guard/Features/Auth/Data/Repo/auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepository authRepo;
  String? tempResetToken;
  String? selectedRole;

  // ================= Login Form =================
  GlobalKey<FormState> loginFormKey = GlobalKey();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  // ================= Register Form =================
  GlobalKey<FormState> registerFormKey = GlobalKey();
  TextEditingController registerUserName = TextEditingController();
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  TextEditingController registerConfirmPassword = TextEditingController();
  TextEditingController registerPhoneNumber = TextEditingController();
  TextEditingController registerFactoryId = TextEditingController();

  // ================= Password Recovery Controllers =================
  GlobalKey<FormState> passwordRecoveryFormKey = GlobalKey();
  TextEditingController resetEmail = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  // ================= Login Method =================
  Future<void> login() async {
    try {
      emit(LoginLoading());
      await authRepo.login(
        email: loginEmail.text,
        password: loginPassword.text,
      );
      emit(LoginSuccess());
    } on ServerException catch (e) {
      emit(LoginFailure(errorMsg: e.errorModel.errorMsg));
    } catch (e) {
      emit(LoginFailure(errorMsg: e.toString()));
    }
  }

  // ================= Register Method =================
  Future<void> register() async {
    try {
      emit(RegisterLoading());
      await authRepo.register(
        userName: registerUserName.text,
        email: registerEmail.text,
        password: registerPassword.text,
        confirmPassword: registerConfirmPassword.text,
        phoneNumber: registerPhoneNumber.text,
      );
      emit(RegisterSuccess());
    } on ServerException catch (e) {
      emit(RegisterFailure(errorMsg: e.errorModel.errorMsg));
    } catch (e) {
      emit(RegisterFailure(errorMsg: e.toString()));
    }
  }

  // ================= Forget Password Method =================
  Future<void> forgetPassword() async {
    try {
      emit(ForgetPasswordLoading());
      final msg = await authRepo.forgetPassword(email: resetEmail.text);
      emit(ForgetPasswordSuccess(msg: msg));
    } on ServerException catch (e) {
      emit(ForgetPasswordFailure(errorMsg: e.errorModel.errorMsg));
    } catch (e) {
      emit(ForgetPasswordFailure(errorMsg: e.toString()));
    }
  }

  // ================= Verify OTP Method =================
  Future<void> verifyOtp() async {
    try {
      emit(VerifyOtpLoading());
      final response = await authRepo.verifyOtp(
        email: resetEmail.text,
        otp: otpCode.text,
      );

      tempResetToken = response;

      emit(VerifyOtpSuccess(msg: AppStrings.otpVerified));
    } on ServerException catch (e) {
      emit(VerifyOtpFailure(errorMsg: e.errorModel.errorMsg));
    }
  }

  // ================= Reset Password Method =================
  Future<void> resetPassword() async {
    try {
      emit(ResetPasswordLoading());
      final msg = await authRepo.resetPassword(
        email: resetEmail.text,
        resetToken: tempResetToken ?? "",
        newPassword: newPasswordController.text,
      );
      emit(ResetPasswordSuccess(msg: msg));
    } on ServerException catch (e) {
      emit(ResetPasswordFailure(errorMsg: e.errorModel.errorMsg));
    } catch (e) {
      emit(ResetPasswordFailure(errorMsg: e.toString()));
    }
  }

  // ================= Logout Method =================
  Future<void> logout() async {
    try {
      emit(LogoutLoading());
      String token = CacheHelper.getData(key: ApiKey.token) ?? "";
      await authRepo.logout(token: token);
      emit(LogoutSuccess());
    } on ServerException catch (e) {
      emit(LogoutFailure(errorMsg: e.errorModel.errorMsg));
    } catch (e) {
      emit(LogoutFailure(errorMsg: e.toString()));
    }
  }

  // ================= Select Role Method =================
  void selectRole(String role) {
    selectedRole = role;
    emit(RoleSelected());
  }
}
