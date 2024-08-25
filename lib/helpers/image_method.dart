import 'package:flutter/material.dart';

dynamic getImage({required String image}) {
  try {
    return Image.network(image, fit: BoxFit.cover);
  } catch (e) {
    return Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg');
  }
}
