import 'package:iot_log/utils/barrel.dart';
import 'package:iot_log/custom_widgets/custom_title.dart';
import 'package:iot_log/custom_widgets/log_tile.dart';

class HomePage extends StatelessWidget
{
  const HomePage({Key? key}):super(key: key);
  final int n = 5;

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
              expandedHeight: 10.h,
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
            SliverList(
              delegate: SliverChildBuilderDelegate((context,index){
                if(index==n){return SizedBox(height: 4.h,);}
                return const LogTile();
              },

              childCount: n+1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}