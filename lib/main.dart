import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/screens/homepage.dart';
import 'package:flutter/services.dart';
import 'package:iot_log/utils/get_log_data.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  KeepData _keepData = KeepData();
  _keepData.prefs = _prefs;

  // checking value
  if(_keepData.prefs.getInt(MKey.timerKey)==null)
    {
      _keepData.prefs.setInt(MKey.timerKey, 10);
      _keepData.timeValue = 10;
    }
  else{_keepData.timeValue = _keepData.prefs.getInt(MKey.timerKey);}

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(Phoenix(child: const MyApp()));
}


class MyApp extends StatelessWidget
{
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MultiProvider(
      providers: [
        // Data Provider
        ChangeNotifierProvider<DataController>(create:(_)=>DataController()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType)
        {
          return const MaterialApp(
            home: HomePage(),
          );
        },
      ),
    );
  }
}