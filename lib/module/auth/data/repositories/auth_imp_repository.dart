import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robust_chat/lib.dart';
import 'package:robust_chat/utils/app_utils.dart';

import '../../domain/repositories/auth_repository.dart';

final authRepoProvider = Provider((ref) {
  return AuthImpRepository(
      auth: FirebaseAuth.instance, fireStore: FirebaseFirestore.instance);
});

class AuthImpRepository implements AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;

  AuthImpRepository({
    required this.auth,
    required this.fireStore,
  });

  @override
  void signInWithPhoneNumber(
      {required BuildContext context, required String number}) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: ((String verificationId, int? resendToken) async {}),
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }
}

/// A data class.
class DataClass {
  final String? name;
  final int? age;

  const DataClass({
    this.name,
    this.age,
  });
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataClass &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  DataClass.initial({this.name, this.age});

  DataClass copyWith({
    String? name,
    int? age,
  }) {
    return DataClass(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}
