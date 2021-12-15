import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/screens/homepage.dart';
import 'package:flutter/services.dart';
import 'package:iot_log/utils/get_log_data.dart';

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