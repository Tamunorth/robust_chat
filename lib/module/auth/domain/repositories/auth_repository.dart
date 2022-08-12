import 'package:flutter/cupertino.dart';

abstract class AuthRepository {
  void signInWithPhoneNumber(
      {required BuildContext context, required String number});
}
