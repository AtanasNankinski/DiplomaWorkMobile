import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/admin_panel/game_service.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';

class AdminPanelNotifier extends Notifier<String> {
  final gameService = GameService();
  final snackBar = const SnackBar(
    content: Text('Game added successfully'),
  );

  @override
  String build() {
    return "";
  }
  
  Future<void> addGame(String gameTitle, String gameDescription, DateTime date, BuildContext context) async {
    final User? user = ref.watch(userProvider).value;
    if(user == null) {
      ref.read(errorProvider.notifier).createException(exception: "Unknown user error occurred.", errorTitle: "User Error");
      return;
    }
    if(!_validateData(gameTitle, gameDescription, date)){
      state = "There are empty fields or invalid date!";
      return;
    }
    String stringDate = date.toString();
    if(await gameService.addGame(gameTitle, gameDescription, stringDate, user.id!)) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      state = "";
    }
  }

  bool _validateData(String gameTitle, String gameDescription, DateTime date) {
    if(gameTitle.isNotEmpty && gameDescription.isNotEmpty){
      if(date.isAfter(DateTime.now())){
        return true;
      }
    }
    return false;
  }
}