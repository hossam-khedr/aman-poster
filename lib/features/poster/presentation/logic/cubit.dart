import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_test/features/poster/data/models/poster_model.dart';
import 'package:supabase_test/features/poster/presentation/logic/states.dart';

import '../../../../core/constants/app_strings.dart';
import '../../data/repo/poster_repo.dart';

class PosterCubit extends Cubit<PosterStates> {
  final PosterRepo posterRepo;

  PosterCubit({required this.posterRepo}) : super(InitState());
  String clintTypeGroupValue = AppStrings.owner;
  String licenseTypeInitialValue = 'ملاكي';
  var text1Controller = TextEditingController();
  var text2Controller = TextEditingController();
  var text3Controller = TextEditingController();
  var licenseNumberController = TextEditingController();
  var clintNameController = TextEditingController();
  var clintMobileController = TextEditingController();
  var posterNumberController = TextEditingController();
  var items = [
    'ملاكي',
    'دراحه ناريه',
    'نقل',
    'حكومه',
    'توك توك',
  ];

  // final StreamController<ClintTypeChangeState> _controller = StreamController<ClintTypeChangeState>();

  /* void dispose() {
    _controller.close();
  }*/

  /* void updateState(ClintTypeChangeState newState) {
    if (!_controller.isClosed) {
      _controller.add(newState);
    }
  }*/
  void changeClintType(String? value) {
    clintTypeGroupValue = value!;
    // updateState(ClintTypeChangeState());
    emit(ClintTypeChangeState());
  }

//bool isClosed = false;
  void changeLicenseType(String? value) {
    licenseTypeInitialValue = value!;
    emit(LicenseTypeChangeState());
  }

  Future<void> addPoster() async {
    log('start add poster poster cubit');
    try {
      emit(PosterLoadingState());
      await posterRepo.addPoster(
        PosterModel(
            clintName: clintNameController.text,
            clintMobile: clintMobileController.text,
            surrealNumberPoster: posterNumberController.text,
            licenseCharacter1: text1Controller.text,
            licenseCharacter2: text2Controller.text,
            licenseCharacter3: text3Controller.text,
            licenseNumber: licenseNumberController.text,
            licenseType: licenseTypeInitialValue,
            clintType: clintTypeGroupValue),
      );
      emit(PosterSuccessState());
    } catch (e) {
      emit(PosterErrorState(e.toString()));
    }
    log('end add poster poster cubit');
  }

  Future<List<PosterModel>> getPosters() async {
    List<PosterModel> posters = [];
    log('start getPosters poster cubit');
    try {
      emit(PosterLoadingState());
       posters = await posterRepo.getPosters();
      emit(GetPostersSuccessState(posters));
    } catch (error) {
      emit(PosterErrorState(error.toString()));
    }
    log('end getPosters poster cubit');
    return posters;
  }
}
