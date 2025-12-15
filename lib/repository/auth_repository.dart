import 'package:phonicsapp/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  SupabaseClient supabase = Supabase.instance.client;

  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
// fetch user details from database
      Map<String, dynamic> user = await supabase
          .from('users')
          .select()
          .eq('uid', response.user!.id)
          .single();

      var appUser = AppUser.fromJson(user);

      return appUser;
    } on AuthApiException catch (e) {
      if (e.code == "email_not_confirmed") {
        throw "Please confirm your email";
      } else {
        throw "An error occured";
      }
    } catch (e) {
      print(e);

      throw Exception("An error occurred while signing in");
    }
  }

  Future<AppUser> signUp({
    required String email,
    required String password,
  }) async {
    try {
      var response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      var user = AppUser(uid: response.user!.id, email: email);

      await supabase.from('users').insert(user.toJson());

      return user;
    } catch (e) {
      print(e);

      throw Exception("An error occured while creating user account");
    }
  }

  Future<AppUser> updateUserProfile({required AppUser user}) async {
    try {
      await supabase.from('users').update(user.toJson()).eq('uid', user.uid);

      return user;
    } catch (e) {
      print(e);
      throw Exception("An error occurred while updating user details");
    }
  }
}
