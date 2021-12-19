import 'package:iot_log/utils/barrel.dart';


class KeepData
{
  static final KeepData _keepData = KeepData._internal();
  factory KeepData()
  {
    return _keepData;
  }
  KeepData._internal();

  late SharedPreferences prefs;
  late int? timeValue;
}