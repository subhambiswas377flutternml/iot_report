import 'package:iot_log/utils/barrel.dart';


class CustomTitle extends StatelessWidget
{
  const CustomTitle({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(KText.appName,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width*0.044,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: KFont.themeFont,
          ),
        ),
      ],
    );
  }
}