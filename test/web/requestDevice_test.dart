import 'package:flutter_web_bluetooth/js_web_bluetooth.dart';
import 'package:flutter_web_bluetooth/web/js/JSUtils.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

import '../helper/JSUtilsTesting.dart';
import '../helper/NativeBluetoothDeviceTesting.dart';
import '../helper/NativeBluetoothTesting.dart';

class FakeRequestOptions extends Fake implements RequestOptions {}

void main() {
  JSUtilsInterface utils = JSUtilsTesting();
  testingSetJSUtils(utils);

  NativeBluetoothTesting nativeBluetooth =
      NativeBluetoothTesting(available: true);
  setNativeBluetooth(nativeBluetooth);

  Object navigator = {'bluetooth': Object()};
  testingSetNavigator(navigator);

  test('Should get device', () async {
    final available = await Bluetooth.getAvailability();
    expect(available, true, reason: 'Bluetooth should be available');

    nativeBluetooth.bluetoothDevice =
        NativeBluetoothDeviceTesting.createJSObject(
            id: 'TEST-ID', uuid: [0x00000, 0xbbbbb, 0xaaaaa]);

    final device = await Bluetooth.requestDevice(FakeRequestOptions());
    expect(device.id, 'TEST-ID', reason: 'Should return the correct device');
  });
}
