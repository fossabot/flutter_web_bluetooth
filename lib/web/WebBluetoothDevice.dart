part of js_web_bluetooth;

///
/// https://webbluetoothcg.github.io/web-bluetooth/#bluetoothdevice-interface
/// https://developer.mozilla.org/en-US/docs/Web/API/BluetoothDevice
class WebBluetoothDevice {
  final Object _jsObject;

  String? _id;

  String get id {
    var id = _id;
    if (id != null) {
      return id;
    }
    id = _JSUtil.getProperty(this._jsObject, 'id') as String;
    _id = id;
    return id;
  }

  String? _name;

  String? get name {
    var name = _name;
    if (name != null) {
      return name;
    }
    if (!_JSUtil.hasProperty(this._jsObject, 'name')) {
      return null;
    }
    name = _JSUtil.getProperty(this._jsObject, 'name') as String;
    _name = name;
    return name;
  }

  NativeBluetoothRemoteGATTServer? _gatt;

  NativeBluetoothRemoteGATTServer? get gatt {
    final gatt = _gatt;
    if (gatt != null) {
      return gatt;
    }
    if (!_JSUtil.hasProperty(this._jsObject, 'gatt')) {
      return null;
    }
    final newGatt = _JSUtil.getProperty(this._jsObject, 'gatt');
    if (newGatt != null) {
      try {
        _gatt = NativeBluetoothRemoteGATTServer.fromJSObject(newGatt, this);
      } catch (e) {
        if (e is UnsupportedError) {
          print(
              'flutter_web_bluetooth: Could not convert JSObject to BluetoothRemoteGattServer. Error: "${e.message}"');
        } else {
          throw e;
        }
      }
    }
    return _gatt;
  }

  void addEventListener(String type, void Function(dynamic) listener) {
    _JSUtil.callMethod(
        _jsObject, 'addEventListener', [type, _JSUtil.allowInterop(listener)]);
  }

  //
  // void removeEventListener(
  //     String type, void Function(dynamic) listener);

  WebBluetoothDevice.fromJSObject(this._jsObject) {
    if (!_JSUtil.hasProperty(_jsObject, 'id')) {
      throw UnsupportedError('JSObject does not have an id.');
    }
  }
}
