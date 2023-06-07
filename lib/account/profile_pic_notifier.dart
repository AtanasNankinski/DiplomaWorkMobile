import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:diploma_work_mobile/account/profile_pic_model.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/account/account_service.dart';
import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/misc/util_services/shared_preferences_service.dart';

class ProfilePickNotifier extends AsyncNotifier<ProfilePicModel>{
  final accountService = AccountService();
  final List<String> colors = [
    "yellow",
    "orange",
    "red",
    "blue",
    "green",
  ];

  @override
  FutureOr<ProfilePicModel> build() async {
    try {
      int userId = ref.watch(userProvider).value!.id!;
      String profilePic = await accountService.getProfilePic(userId);
      if(profilePic != ""){
        return ProfilePicModel(image: profilePic, color: "");
      }
      final color = SharedPreferencesService().getAvatarColor();
      return ProfilePicModel(image: "", color: color);
    } catch(e) {
      return ProfilePicModel.empty();
    }
  }

  Future<void> initialProfilePic(int userId) async {
    final random = Random();
    final index = random.nextInt(colors.length);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await accountService.initialProfilePic(colors[index], userId);
    });
  }

  Future<void> changeAvatarFromGallery(int userId, BuildContext context) async {
    state = const AsyncValue.loading();
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null){
      return;
    }
    final imageFile = XFile(image.path);
    state = await AsyncValue.guard(() async {
      return await accountService.uploadAccountPic(imageFile, userId);
    });
    state.whenOrNull(error: (error, stackTrace) {
      if(error is PlatformException){
        Navigator.pop(context);
      }else {
        ref.read(errorProvider.notifier).createException(exception: error.toString(), errorTitle: "Unknown Error");
      }
    });
  }

  Future<void> changeAvatarFromCamera(int userId, BuildContext context) async {
    state = const AsyncValue.loading();
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null){
      return;
    }
    final imageFile = XFile(image.path);
    state = await AsyncValue.guard(() async {
      return await accountService.uploadAccountPic(imageFile, userId);
    });
    state.whenOrNull(error: (error, stackTrace) {
      if(error is PlatformException){
        Navigator.pop(context);
      }else {
        ref.read(errorProvider.notifier).createException(exception: error.toString(), errorTitle: "Unknown Error");
      }
    });
  }
}