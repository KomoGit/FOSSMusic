import 'package:flutter/material.dart';

bool checkLinkField(TextEditingController linkController) {
  if (linkController.text.isEmpty) {
    return false;
  }
  return true;
}

bool checkArtistNameField(TextEditingController artistController) {
  if (artistController.text.isEmpty) {
    return false;
  }
  return true;
}

bool checkAlbumField(TextEditingController albumController) {
  if (albumController.text.isEmpty) {
    return false;
  }
  return true;
}

bool checkSongNameField(TextEditingController nameController) {
  if (nameController.text.isEmpty) {
    return false;
  } else {
    return true;
  }
}
