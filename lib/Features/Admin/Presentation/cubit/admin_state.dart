
abstract class AdminState {}

class AdminInitial extends AdminState {}

class GetDashboardLoading extends AdminState {}
class GetDashboardSuccess extends AdminState {}
class GetDashboardFailure extends AdminState {
  final String errorMsg;
  GetDashboardFailure(this.errorMsg);
}

class GetPendingFactoriesLoading extends AdminState {}
class GetPendingFactoriesSuccess extends AdminState {}
class GetPendingFactoriesFailure extends AdminState {
  final String errorMsg;
  GetPendingFactoriesFailure(this.errorMsg);
}

class ReviewFactoryLoading extends AdminState {}
class ReviewFactorySuccess extends AdminState {
  final String msg;
  ReviewFactorySuccess(this.msg);
}
class ReviewFactoryFailure extends AdminState {
  final String errorMsg;
  ReviewFactoryFailure(this.errorMsg);
}