import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/screens/homepage.dart';

void main()
{
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
        return const MaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}