import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:iot_log/utils/barrel.dart';

// class to fetch and save API Data
class DataController extends ChangeNotifier
{
  List<LogDataModel> logData = [];
  bool isLoading = true;
  
  // fetching data
  void getData(
      BuildContext context,
      ) async
  {
    try{
      http.Response _res = await http.get(
        Uri.parse(RestConstants.getData),
        headers: {
          "Accept":"application/json",
          "Content-Type":"application/json",
        },
      );

      List<LogDataModel> _tempData = [];
      
      if(_res.statusCode==200)
        {
          var _body = convert.jsonDecode(_res.body)[0];
          
          // Getting Data
          _tempData.add(LogDataModel(logTitle: "Status", logValue: "Active"));
          _tempData.add(LogDataModel(logTitle: "Device ID", logValue: _body[KKey.deviceId].toString()));
          _tempData.add(LogDataModel(logTitle: "Timestamp", logValue: _body[KKey.timeStamp].toString()));
          _tempData.add(LogDataModel(logTitle: "PH", logValue: _body[KKey.ph].toString()));
          _tempData.add(LogDataModel(logTitle: "TDS", logValue: _body[KKey.tds].toString()));
          _tempData.add(LogDataModel(logTitle: "Temperature", logValue: _body[KKey.temp].toString()));
          _tempData.add(LogDataModel(logTitle: "EC", logValue: _body[KKey.electroConductivity].toString()));
          _tempData.add(LogDataModel(logTitle: "BOD", logValue: _body[KKey.bod].toString()));
          _tempData.add(LogDataModel(logTitle: "COD", logValue: _body[KKey.cod].toString()));

          // creating list with updated data
          logData = _tempData;
          print("Called Again");
        }
      
      
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something Went Wrong!"))
      );
    }

    isLoading = false;
    notifyListeners();
  }
}