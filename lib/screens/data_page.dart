import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/custom_widgets/custom_title.dart';
import 'package:iot_log/custom_widgets/log_tile.dart';
import 'package:iot_log/custom_widgets/custom_loader.dart';
import 'package:iot_log/utils/get_log_data.dart';
import 'dart:async';
import 'package:iot_log/screens/drawer_page.dart';

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
  final KeepData _keepData = KeepData();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState()
  {
    super.initState();
    timer = Timer.periodic(Duration(seconds: _keepData.timeValue!),
      (timer) async{
      await Provider.of<DataController>(context, listen: false).getData(context);
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
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerPage(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            // AppBar
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height*0.088,
              backgroundColor: Colors.deepPurpleAccent,
              title: const CustomTitle(),
              centerTitle: true,
              floating: true,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              actions: [
                // Time Settings
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: (){
                    showTimeSelector(context);
                  },
                ),
              ],
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