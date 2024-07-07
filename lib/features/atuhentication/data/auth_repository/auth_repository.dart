import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/features/atuhentication/data/data_source.dart';
import 'package:supabase_test/features/atuhentication/data/models/user_model.dart';

class AuthRepository {
  final DataSource dataSource;

  AuthRepository({required this.dataSource});

  Future<Either<AuthException, void>> signIn(
      String email, String password) async {
    try {
      log('Start auth repo signIn');
       await dataSource.signIn(email, password);
      log('End auth repo signIn');
      return Right(null);
    } on AuthException catch (error) {
      return Left(error);
    }
  }

  Future<Either<AuthException, void>> signUp(
      String email, String password) async {
    try {
      log('Start auth repo signUp');
      await dataSource.signUp(email, password);
      log('End auth repo signUp');
      return Right(null);
    } on AuthException catch (error) {
      return Left(error);
    }
  }

  Future<Either<AuthException, void>> resetPassword(String email) async {
    try {
      log('Start resetPassword repo signUp');
      await dataSource.resetPassword(email);
      log('End resetPassword repo signUp');
      return Right(null);
    } on AuthException catch (error) {
      return Left(error);
    }
  }

  Future<Either<AuthException, void>> updatePassword(String newPassword) async {
    try {
      log('Start updatePassword repo signUp');
      await dataSource.updatePassword(newPassword);
      log('End updatePassword repo signUp');
      return Right(null);
    } on AuthException catch (error) {
      return Left(error);
    }
  }

  Future<void> saveUserInfo(UserModel userModel) async {
    log('Start saveUserInfo repo ');
    await dataSource.saveUserInfo(userModel);
    log('End saveUserInfo signUp');
  }
}
