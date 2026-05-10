import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Features/Admin/Data/Models/admin_dashboard_model.dart';
import 'package:power_guard/Features/Admin/Data/Models/factory_model.dart';
import 'package:power_guard/Features/Admin/Data/Repo/admin_repository.dart';

import 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepository adminRepo;

  AdminCubit(this.adminRepo) : super(AdminInitial());

  AdminDashboardModel? dashboardModel;
  List<FactoryModel> pendingFactories = [];

  Future<void> getDashboardData() async {
    emit(GetDashboardLoading());
    try {
      dashboardModel = await adminRepo.getDashboardDetails();
      emit(GetDashboardSuccess());
    } catch (e) {
      emit(GetDashboardFailure(e.toString()));
    }
  }

  Future<void> getPendingFactories() async {
    emit(GetPendingFactoriesLoading());
    try {
      pendingFactories = await adminRepo.getPendingFactories();
      emit(GetPendingFactoriesSuccess());
    } catch (e) {
      emit(GetPendingFactoriesFailure(e.toString()));
    }
  }

 Future<void> reviewFactory({required int factoryId, required bool isApproved}) async {
    emit(ReviewFactoryLoading());
    try {
      final msg = await adminRepo.reviewFactory(
        factoryId: factoryId, 
        isApproved: isApproved,
        remarks: isApproved ? "Accepted by Admin" : "Rejected by Admin", 
      );
      
      pendingFactories.removeWhere((element) => element.id == factoryId);
      emit(ReviewFactorySuccess(msg));
      getDashboardData(); 
    } catch (e) {
      emit(ReviewFactoryFailure(e.toString()));
    }
  }
}
