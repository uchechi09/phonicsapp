import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  SupabaseClient supabase = Supabase.instance.client;

  Future<User?> signIn({required String email, required String password}) async {
    try {
      AuthResponse response = await supabase.auth.signInWithPassword(email: email, password: password);

      return response.user;
    } on AuthApiException catch (e){
      if(e.code == "email_not_confirmed"){
        throw "Please confirm your email";
      }else{
        throw "An error occured";
      }
    } catch (e) {
      print(e);

      throw Exception("An error occurred while signing in");
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try{
      await supabase.auth.signUp(email: email, password: password);
      
    }catch(e){
      print(e);

      throw Exception("An error occured while creating user account");
    }
  }
}
