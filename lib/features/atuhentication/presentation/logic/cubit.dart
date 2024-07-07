import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/core/helper/validation.dart';
import 'package:supabase_test/features/atuhentication/data/models/user_model.dart';
import 'package:supabase_test/features/atuhentication/presentation/logic/states.dart';

import '../../data/auth_repository/auth_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  final AuthRepository _repository;

  AuthenticationCubit(this._repository) : super(AuthenticationInitialState());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var unitNameController = TextEditingController();
  var provinceNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isYoungerThan8CharacterDone = false;
  bool isSmallCharacterDone = false;
  bool isPagCharacterDone = false;
  bool isSpecialCharacterDone = false;
  bool isNumberDone = false;
  bool isPasswordShow = true;

void passwordShow(){
  isPasswordShow = !isPasswordShow;
  emit(SuffixIconChangeState());
}
  bool isConfirmPasswordValid(String? value) {
    if (passwordController.text != confirmPasswordController.text) {
      return false;
    } else {
      return true;
    }
  }

  bool isNewPasswordValid() {
    if (isSmallCharacter(passwordController.text)) {
      emit(SmallCharacterState());
      return isSmallCharacterDone = true;
    } else {
      isSmallCharacterDone = false;
      emit(SmallCharacterState());
    }
    if (isPagCharacter(passwordController.text)) {
      emit(PagCharacterState());
      return isPagCharacterDone = true;
    } else {
      isPagCharacterDone = false;
      emit(PagCharacterState());
    }

    if (isNumber(passwordController.text)) {
      emit(NumberSuccessState());
      return isNumberDone = true;
    } else {
      emit(NumberSuccessState());
      isNumberDone = false;
    }
    if (isSpecialCharacter(passwordController.text)) {
      emit(SpecialCharacterState());
      return isSpecialCharacterDone = true;
    } else {
      emit(SpecialCharacterState());
      isSpecialCharacterDone = false;
    }
    if (isYoungerThan8Character(passwordController.text)) {
      emit(YoungerThan8CharacterState());
      return isYoungerThan8CharacterDone = true;
    } else {
      emit(YoungerThan8CharacterState());
      isYoungerThan8CharacterDone = false;
    }
    return isSmallCharacterDone &&
        isPagCharacterDone &&
        isNumberDone &&
        isSpecialCharacterDone &&
        isYoungerThan8CharacterDone;
  }

  Future<void> signIn() async {
    log('start signIn cubit');
    emit(AuthenticationLoadingState());
    final successOrFailure = await _repository.signIn(
      emailController.text,
      passwordController.text,
    );
    successOrFailure.fold((failure) {
      emit(AuthenticationErrorState(failure.message));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
    /* try {
      emit(LoadingState());
      await _repository.signIn(emailController.text, passwordController.text);
      emit(SuccessState());
    } on AuthException catch (e) {
      emit(ErrorState(e.message));
    }*/
    log('end signIn cubit');
  }

  Future<void> signUp() async {
    log('start signUp cubit');
    emit(AuthenticationLoadingState());
    final successOrFailure = await _repository.signUp(
      emailController.text,
      passwordController.text,
    );
    successOrFailure.fold((error) {
      emit(AuthenticationErrorState(error.message));
    }, (success) {
      saveUserInfo();
      emit(AuthenticationSuccessState());
    });
    log('end signUp cubit');
  }

  Future<void> resetPassword() async {
    log('start resetPassword cubit');
    emit(AuthenticationLoadingState());
    final successOrFailure = await _repository.resetPassword(
      emailController.text,
    );
    successOrFailure.fold((error) {
      emit(AuthenticationErrorState(error.message));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
    log('end resetPassword cubit');
  }

  Future<void> updatePassword() async {
    log('start updatePassword cubit');
    emit(AuthenticationLoadingState());
    final successOrFailure = await _repository.updatePassword(
      passwordController.text,
    );
    successOrFailure.fold((error) {
      emit(AuthenticationErrorState(error.message));
    }, (success) {
      emit(AuthenticationSuccessState());
    });
    log('end updatePassword cubit');
  }

  Future<void> saveUserInfo() async {
    log('start saveUserInfo cubit');
    await _repository.saveUserInfo(
      UserModel(
        nameController.text,
        emailController.text,
        provinceNameController.text,
        unitNameController.text,
      ),
    );
    log('End saveUserInfo cubit');
  }
}
