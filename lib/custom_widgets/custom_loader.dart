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

        SizedBox(height: MediaQuery.of(context).size.height*0.01,),

        // Loading Name
        Text(loadingStateName.toString(),
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width*0.04,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: KFont.themeFont,
        ),
        ),
      ],
    );
  }
}