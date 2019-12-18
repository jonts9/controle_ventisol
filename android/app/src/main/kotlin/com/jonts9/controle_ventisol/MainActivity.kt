package com.jonts9.controle_ventisol

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.hardware.ConsumerIrManager
import android.os.BatteryManager
import android.os.Build
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.widget.Toast
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "jonts9.com/controle_ventisol"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      // Note: this method is invoked on the main thread.
      if (call.method == "sendIr") {
        if (!call.hasArgument("carrierFrequency") || !call.hasArgument("pattern")){
          result.error("ARGUMENT_NOT_FOUND", "One or more arguments were not found", null)
        }
        var pattern = call.argument<ArrayList<Int>>("pattern") as ArrayList<Int>

        val carrierFrequency = call.argument<Int>("carrierFrequency") as Int

        val defpattern =  convert(pattern.toIntArray(), carrierFrequency)

        val resultIR = sendIr(carrierFrequency, defpattern as IntArray)

        if (resultIR != "ok") {
          result.error("UNAVAILABLE", "Não foi possível enviar o comando para o emissor infravermelho.", null)
        } else {
          result.success(resultIR)
        }
      } else {
        result.notImplemented()
      }
    }
  }

  private fun convert(irData: IntArray, frequency: Int): IntArray? { // 1. Determine which conversion-algorithm shall be used (see the comment above this method for more details)
    var convert: Byte = 0
    //Devices running on Android Lollipop (Android 5.0.1 (API 21)) and beyond, HTC devices
    if (VERSION.SDK_INT >= 21 || Build.MANUFACTURER.equals("HTC", ignoreCase = true)) {
      convert = 1
    } else { //Samsung devices running on anything lower than Android 5
      if (Build.MANUFACTURER.equals("SAMSUNG", ignoreCase = true)) {
        val lastIdx = VERSION.RELEASE.lastIndexOf(".")
        val VERSION_MR = Integer.valueOf(VERSION.RELEASE.substring(lastIdx + 1))
        convert = if (VERSION_MR < 3) { // Samsung devices with Android-version before Android 4.4.2
          //-> no calculations required
          0
        } else { // Later version of Android 4.4.3
          //-> use the special Samsung-formula
          2
        }
      }
    }
    // 2. Convert the patterns
    if (convert.toInt() != 0) {
      for (i in irData.indices) {
        when (convert.toInt()) {
          1 -> irData[i] = irData[i] * (100000 / frequency)
          2 -> irData[i] = Math.ceil(irData[i] * 26.27272727272727).toInt()
        }
      }
    }
    return irData
  }

  private fun sendIr(carrierFrequency: Int, ns: IntArray): String {
    val irManager: ConsumerIrManager =  getSystemService(CONSUMER_IR_SERVICE) as ConsumerIrManager
    if (irManager.hasIrEmitter()){
      val freqs: Array<ConsumerIrManager.CarrierFrequencyRange> = irManager.getCarrierFrequencies()
      print("pattern: $ns");
      irManager.transmit(carrierFrequency, ns)
      return "ok"
    }
    return "Emissor infravermelho ausente"
  }
}
