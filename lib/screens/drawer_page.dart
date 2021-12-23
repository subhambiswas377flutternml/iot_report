import 'package:iot_log/utils/barrel.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DrawerPage extends StatelessWidget
{
  DrawerPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    List<DateTime> _timeStamps = Provider.of<DataController>(context).timeStamps;
    ItemScrollController _itemScrollController = Provider.of<DataController>(context).scrollController;
    return LayoutBuilder(builder: (context, constraint)
    {
      return Container(
        height: constraint.maxHeight,
        width: constraint.maxWidth,
        color: KColors.themeBgColor,
        child: ScrollablePositionedList.separated(
          itemScrollController: _itemScrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: constraint.maxHeight*0.07),
          reverse: true,
          itemCount: _timeStamps.length,
          shrinkWrap: true,
          itemBuilder: (_,index)
            {
              String _time = DateFormat("yyyy-MM-dd – kk:mm:ss").format(_timeStamps[index]);
              return Container(
                alignment: Alignment.center,
                width: constraint.maxWidth,
                height: constraint.maxHeight*0.05,
                margin: EdgeInsets.symmetric(horizontal: constraint.maxWidth*0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: KColors.tileColor,
                ),
                child: Text(_time,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.amberAccent,
                    fontSize: constraint.maxWidth*0.05,
                    fontWeight: FontWeight.w500,

                  ),
                ),
              );
            },
          separatorBuilder: (_,index)
          {
            return SizedBox(
              height: constraint.maxHeight*0.05,
              child: const Icon(Icons.arrow_upward,
                color: KColors.tileColor,
              ),
            );
          },
        )
      );
    });
  }
}