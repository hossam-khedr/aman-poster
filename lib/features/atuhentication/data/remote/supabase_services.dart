import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test/core/constants/constants.dart';
import 'package:supabase_test/features/atuhentication/data/data_source.dart';
import 'package:supabase_test/features/atuhentication/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/chach/chach.dart';
class SupaBaseServices implements DataSource{
  final supaBase = Supabase.instance.client;
  @override
  Future signIn(String email, String password) async{
    log('Start signIn SupaBaseServices');
  final response =   await supaBase.auth.signInWithPassword(password: password,email: email);
  if(response.user?.id != null){
   await CacheHelper.setData(Constants.userId, response.user!.id);
    log('User id is Saving in storage');
  }
    log('End signIn SupaBaseServices');

  }

  @override
  Future signUp(String email, String password)async {
    log('Start sign Up SupaBaseServices');
    await supaBase.auth.signUp(password: password,email: email);
    log('End sign Up SupaBaseServices');
  }

  @override
  Future saveUserInfo(UserModel userModel)async {
    log('Start save user info SupaBaseServices');
    await supaBase.from('users').insert(userModel.toJson());
    log('End save user info SupaBaseServices');

  }

  @override
  Future resetPassword(String email)async {
    log('Start resetPassword SupaBaseServices');
    await supaBase.auth.resetPasswordForEmail(email);
    log('End resetPassword SupaBaseServices');
  }

  @override
  Future updatePassword(String newPassword)async {
    log('Start updatePassword SupaBaseServices');
    await supaBase.auth.updateUser(UserAttributes(password: newPassword));
    log('End updatePassword SupaBaseServices');
  }

}
