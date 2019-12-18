import 'package:controle_ventisol/ir_command.dart';
import 'package:flutter/services.dart';

class IrService {

  static const _carrierFrequency = 38400;

  static const _platform = const MethodChannel('jonts9.com/controle_ventisol');

  static Future<void> sendIr(IrCommand irCommand) async {
    try {

      final String result = await _platform.invokeMethod('sendIr',{"carrierFrequency":_carrierFrequency, "pattern":irCommand.pattern});
    } on PlatformException catch (e) {
    }
  }
}