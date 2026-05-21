import 'package:flutter/material.dart';
import 'package:projetoterceiro/data/models/user_model.dart';
import 'package:projetoterceiro/data/repositories/user_repository.dart';

class UserStore {

  final UserRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<List<UserModel>> state = ValueNotifier([]);
  final ValueNotifier<UserModel?> currentUser = ValueNotifier(null);
  final ValueNotifier<String> errorMessage = ValueNotifier('');

  UserStore({required this.repository});

}