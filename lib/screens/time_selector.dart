import 'package:iot_log/utils/barrel.dart';


void showTimeSelector(BuildContext context)
{
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context)
      {
        return Container(
          height: 40.h,
          width: 100.w,
          decoration: const BoxDecoration(
            color: KColors.themeBgColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            )
          ),
          child: const _TimeSelector(),
        );
      }
  );
}

class _TimeSelector extends StatefulWidget
{
  const _TimeSelector({Key? key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState()
  {
    return _TimeSelectorState();
  }
}

// State Class
class _TimeSelectorState extends State<_TimeSelector>
{
  late double _value;
  final KeepData _keepData = KeepData();
  @override
  void initState()
  {
    super.initState();
    _value = _keepData.prefs.getInt(MKey.timerKey)!.toDouble();
  }

  @override
  Widget build(BuildContext context)
  {
    return LayoutBuilder(builder: (context, constraint)
    {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Slider
          Slider(
            min: 5,
            max: 50,
            activeColor: Colors.deepPurpleAccent,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),

          // Time Show
          Text("Seconds:${_value.toStringAsFixed(1)}",
          textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: KFont.themeFont,
              fontSize: constraint.maxWidth*0.05,
              fontWeight: FontWeight.w500,
              color: Colors.amberAccent,
            ),
          ),

          // Save Button
          Container(
            width: constraint.maxWidth,
            height: constraint.maxHeight*0.155,
            padding: EdgeInsets.symmetric(horizontal: constraint.maxWidth*0.2),
            child:ElevatedButton(
            child: const Text("Save"),
            onPressed: (){
              _keepData.prefs.setInt(MKey.timerKey, _value.toInt());
              Navigator.of(context).pop();
              Phoenix.rebirth(context);
            },
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: constraint.maxWidth*0.05),
              primary: Colors.deepPurpleAccent,
            ),
          ),),
        ],
      );
    });
  }
}