abstract class AssignState {}

class AssignInitial extends AssignState {}

class RegisterFactoryLoading extends AssignState {}

class RegisterFactorySuccess extends AssignState {
  final String msg;
  RegisterFactorySuccess({required this.msg});
}

class RegisterFactoryFailure extends AssignState {
  final String errorMsg;
  RegisterFactoryFailure({required this.errorMsg});
}