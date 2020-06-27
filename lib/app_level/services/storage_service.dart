import 'dart:io' show File;
import 'package:findrecycler/app_level/models/storage_result.dart';
import 'package:path/path.dart' show extension;

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/foundation.dart';

class CloudStorageService {
  CloudStorageService();

  Future<CloudStorageResult> uploadImage({
    @required File fileToUpload,
    String title = '',
  }) async {
    final _fileExt = extension(fileToUpload.path);
    final _fileName =
        title + DateTime.now().millisecondsSinceEpoch.toString() + _fileExt;

    final _uploadedPath = '$_bucketName/$_fileName';
    final _ref = _storageRef.child(_uploadedPath);

    // CLOUD STORAGE UPLOAD...
    final _uploadTask = _ref.putFile(fileToUpload);

    final _storageTaskSnapshot = await _uploadTask.onComplete;
    final _url = await _storageTaskSnapshot.ref.getDownloadURL();

    if (_uploadTask.isComplete) {
      return CloudStorageResult(
        imageUrl: _url,
        fileName: _fileName,
      );
    }

    // On any other result....
    return null;
  }

  Future<dynamic> deleteImage(String fileToDelete) async {
    final _ref = _storageRef.child('$_bucketName/$fileToDelete');

    try {
      await _ref.delete();
    } catch (exc) {
      return exc.toString();
    }

    return null;
  }

  // ------------------------------ INTERNALS ---------------------------------------------

  final _storageRef = FirebaseStorage.instance.ref();
  final _bucketName = 'items';
}
