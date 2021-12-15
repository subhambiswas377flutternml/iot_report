import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/custom_widgets/custom_title.dart';
import 'package:iot_log/custom_widgets/log_tile.dart';
import 'package:iot_log/custom_widgets/custom_loader.dart';
import 'package:iot_log/utils/get_log_data.dart';
import 'dart:async';

class DataPage extends StatefulWidget
{
  const DataPage({Key? key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState()
  {
    return _DataPageState();
  }
}


// State class
class _DataPageState extends State<DataPage>
{

  late Timer timer;

  @override
  void initState()
  {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 10),
      (timer) {
      Provider.of<DataController>(context, listen: false).getData(context);
      });
  }

  @override
  void dispose()
  {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context)
  {
    bool _isLoading = Provider.of<DataController>(context).isLoading;
    List<LogDataModel> _logData = Provider.of<DataController>(context).logData;

    return Scaffold(
      backgroundColor: KColors.themeBgColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            // AppBar
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height*0.1,
              backgroundColor: Colors.deepPurpleAccent,
              flexibleSpace: const CustomTitle(),
              floating: true,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
            ),

            // padding
            SliverPadding(
                padding: EdgeInsets.only(top: 4.h),
            ),

            // Data List
            Builder(
              builder: (_)
              {
                if(_isLoading)
                {
                  return const SliverToBoxAdapter(
                    child: Center(child: CustomLoader(
                      loadingStateName: "Loading....",
                    )),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context,index){
                    if(index==_logData.length){return SizedBox(height: 4.h,);}
                    return LogTile(
                      logDataModel: _logData[index],
                    );
                  },
                    childCount: _logData.length+1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}