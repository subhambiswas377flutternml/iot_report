import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/custom_widgets/custom_title.dart';
import 'package:iot_log/custom_widgets/log_tile.dart';
import 'package:iot_log/utils/get_log_data.dart';
import 'package:iot_log/custom_widgets/custom_loader.dart';

class HomePage extends StatelessWidget
{
  HomePage({Key? key}):super(key: key);
  final DataController _dataController = DataController();

  @override
  Widget build(BuildContext context)
  {
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
            FutureBuilder(
              future: _dataController.getData(context),
              builder: (context, snapshot)
              {
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return const SliverToBoxAdapter(
                    child: Center(child: CustomLoader(
                      loadingStateName: "Loading....",
                    )),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context,index){
                    if(index==_dataController.logData.length){return SizedBox(height: 4.h,);}
                    return LogTile(
                      logDataModel: _dataController.logData[index],
                    );
                  },
                    childCount: _dataController.logData.length+1,
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