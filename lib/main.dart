import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/screens/homepage.dart';
import 'package:flutter/services.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget
{
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Sizer(
      builder: (context, orientation, deviceType)
      {
        return MaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}