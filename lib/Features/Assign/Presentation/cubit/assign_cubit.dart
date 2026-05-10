import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:power_guard/Core/Networking/Errors/exceptions.dart';
import 'package:power_guard/Features/Assign/Data/Repo/assign_repository.dart';
import 'package:power_guard/Features/Assign/Presentation/cubit/assign_state.dart';

class AssignCubit extends Cubit<AssignState> {
  final AssignRepository assignRepo;

  AssignCubit(this.assignRepo) : super(AssignInitial());

  // Controllers for the UI TextFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
  // Form key for validation
  final GlobalKey<FormState> factoryFormKey = GlobalKey<FormState>();

  Future<void> registerFactory() async {
    try {
      emit(RegisterFactoryLoading());
      
      await assignRepo.registerFactory(
        name: nameController.text,
        location: locationController.text,
        description: descriptionController.text,
      );

      emit(RegisterFactorySuccess(msg: "Factory registered successfully. Pending approval!"));
    } on ServerException catch (e) {
      emit(RegisterFactoryFailure(errorMsg: e.errorModel.errorMsg));
    } catch (e) {
      emit(RegisterFactoryFailure(errorMsg: e.toString()));
    }
  }
  
  @override
  Future<void> close() {
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}