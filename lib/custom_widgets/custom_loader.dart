import 'package:iot_log/utils/barrel.dart';


class CustomLoader extends StatelessWidget
{
  final String loadingStateName;
  const CustomLoader({Key? key,
  this.loadingStateName="",
  }):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        // Indicator
        const CircularProgressIndicator(),

        SizedBox(height: 2.h,),

        // Loading Name
        Text(loadingStateName.toString(),
        style: TextStyle(
          fontSize: 4.w,
          color: Colors.white,
          fontWeight: FontWeight.w400
        ),
        ),
      ],
    );
  }
}