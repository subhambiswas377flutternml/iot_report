import 'package:iot_log/utils/barrel.dart';


class LogTile extends StatelessWidget
{
  final LogDataModel logDataModel;

  const LogTile({Key? key,
  required this.logDataModel,
  }):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 18.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 2.5.h,
      ),

      decoration: BoxDecoration(
        color: KColors.tileColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Log Name
          Text(logDataModel.logTitle.toString(),
          overflow: TextOverflow.fade,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: KFont.themeFont,
          color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 5.w,
          ),
          ),

          // Log Value
          Text(logDataModel.logValue.toString(),
            overflow: TextOverflow.fade,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: KFont.themeFont,
              color: Colors.amber,
              fontWeight: FontWeight.w400,
              fontSize: 5.w,
            ),
          ),
        ],
      ),
    );
  }
}