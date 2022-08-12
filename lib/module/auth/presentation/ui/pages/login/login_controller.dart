import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robust_chat/lib.dart';

final loginPageCtrl = Provider((ref) {
  return LoginController(ref.watch(authRepoProvider));
});

class LoginController {
  final AuthImpRepository authImpRepository;

  bool loading = false;

  LoginController(this.authImpRepository);

  void setLoading(bool value) {
    loading = value;
  }

  void signInWithPhone(BuildContext context, String number) {
    authImpRepository.signInWithPhoneNumber(context: context, number: number);
  }
}
