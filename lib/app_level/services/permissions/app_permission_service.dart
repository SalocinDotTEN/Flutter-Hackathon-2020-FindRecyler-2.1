import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:permission_handler/permission_handler.dart';

final _audioPermission = Permission.microphone;
final _cameraPermission = Permission.camera;

class PermissionService with ChangeNotifier {
  PermissionService();

  // ------------------------------ CAMERA PERMISSION ---------------------------------------------

  PermissionStatus get cameraStatus => _camera;
  bool get hasCameraPermission => _hasCameraPermission;

  Future<void> get cameraPermissionStatus async {
    _camera = await _cameraPermission.status;
    _hasCameraPermission = _statusAsBool(_camera);

    notifyListeners();
  }

  Future<void> get requestCameraPermission async {
    _camera = await _cameraPermission.request();
    _hasCameraPermission = _statusAsBool(_camera);

    notifyListeners();
  }

  // ------------------------------ AUDIO PERMISSION ---------------------------------------------

  PermissionStatus get audioStatus => _audio;
  bool get hasAudioPermission => _hasAudioPermission;

  Future<void> get audioPermissionStatus async {
    _audio = await _audioPermission.status;
    _hasAudioPermission = _statusAsBool(_audio);

    notifyListeners();
  }

  Future<void> get requestAudioPermission async {
    _audio = await _audioPermission.request();
    _hasAudioPermission = _statusAsBool(_audio);

    notifyListeners();
  }

  // ------------------------------ OPEN SETTINGS ---------------------------------------------

  Future<bool> get openSettings async {
    return await openAppSettings();
  }

  // ------------------------------ INTERNALS ---------------------------------------------

  PermissionStatus _audio;
  bool _hasAudioPermission = false;

  PermissionStatus _camera;
  bool _hasCameraPermission = false;

  bool _statusAsBool(PermissionStatus status) {
    var _status = false;

    switch (status) {
      case PermissionStatus.granted:
        _status = true;
        break;

      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        _status = false;
        break;
    }

    return _status;
  }

  // Permission.camera >>> PermissionStatus.granted
}
