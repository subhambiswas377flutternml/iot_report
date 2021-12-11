import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:iot_log/utils/barrel.dart';

// class to fetch and save API Data
class DataController
{
  List<LogDataModel> logData = [];
  
  // fetching data
  Future<void> getData(
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
      
      if(_res.statusCode==200)
        {
          var _body = convert.jsonDecode(_res.body)[0];
          
          // Getting Data
          logData.add(LogDataModel(logTitle: "Status", logValue: "Active"));
          logData.add(LogDataModel(logTitle: "Device ID", logValue: _body[KKey.deviceId].toString()));
          logData.add(LogDataModel(logTitle: "Timestamp", logValue: _body[KKey.timeStamp].toString()));
          logData.add(LogDataModel(logTitle: "PH", logValue: _body[KKey.ph].toString()));
          logData.add(LogDataModel(logTitle: "TDS", logValue: _body[KKey.tds].toString()));
          logData.add(LogDataModel(logTitle: "Temperature", logValue: _body[KKey.temp].toString()));
          logData.add(LogDataModel(logTitle: "EC", logValue: _body[KKey.electroConductivity].toString()));
          logData.add(LogDataModel(logTitle: "BOD", logValue: _body[KKey.bod].toString()));
          logData.add(LogDataModel(logTitle: "COD", logValue: _body[KKey.cod].toString()));
        }
      
      
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something Went Wrong!"))
      );
    }
  }
}