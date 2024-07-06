import 'package:supabase_test/features/atuhentication/data/models/user_model.dart';

abstract class DataSource{
  Future<dynamic> signIn(String email,String password);
  Future<dynamic> signUp(String email,String password);
  Future<dynamic> saveUserInfo(UserModel userModel);
  Future<dynamic> resetPassword(String email);
  Future<dynamic> updatePassword(String newPassword);
}