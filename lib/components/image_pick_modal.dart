import 'package:flutter/material.dart';

Widget imagePickModal({required VoidCallback onPressedImage, required VoidCallback onPressedGallery}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: TextButton.icon(
          onPressed: onPressedImage,
          label: const Text("Gallery"),
          icon: const Icon(Icons.image),
        ),
      ),
      Expanded(
        child: TextButton.icon(
          onPressed: onPressedGallery,
          label: const Text("Camera"),
          icon: const Icon(Icons.photo_camera),
        ),
      ),
    ],
  );
}