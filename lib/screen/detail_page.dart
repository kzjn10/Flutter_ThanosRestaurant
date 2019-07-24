import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:thanosrestaurant/data/material_entity.dart';
import 'package:thanosrestaurant/style/colors.dart';
import 'package:thanosrestaurant/utils/resource_utils.dart';
import 'package:thanosrestaurant/widgets/material_item_view.dart';


class DetailPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Material(
        color: kColorBackground,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: kColorBackground,
            elevation: 0,
            leading: Container(
              child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                Navigator.pop(context);
              }),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {
                debugPrint("Press favorite menu");
              }),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(children: <Widget>[
                  _buildProfile(context, _themeData),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 280,),
                        _buildMaterialInvolved(context, _themeData),
                      ],
                    ),
                  )
                ],),
              ],
            ),
          ),
        )
    );
  }

  Widget _buildProfile(BuildContext context, ThemeData themeData) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var actual = width * .18;

    debugPrint("W: $actual W1: $width H1: $height ");
    return Container(
        child: Stack(
          children: <Widget>[
            Image.asset("assets/graphic/c1.png", width: MediaQuery
                .of(context)
                .size
                .width, fit: BoxFit.fill,),
            Positioned(
              top: height * 41 / 896,
              left: width * 75 / 414,
              right: 0,
              child: Container(
                child: Row(children: <Widget>[
                  CircularPercentIndicator(
                    radius: 22.0,
                    lineWidth: 3.0,
                    percent: .68,
                    backgroundColor: kColorProgressBackground,
                    progressColor: kColorButtonText,
                  ),
                  SizedBox(width: 7,),
                  RichText(text: TextSpan(text: "68", style: themeData.primaryTextTheme.display4, children: <TextSpan>[
                    TextSpan(text: "%", style: themeData.primaryTextTheme.overline)
                  ]),)
                ],),
              ),
            )

          ],
        )
    );
  }

  Widget _buildMaterialInvolved(BuildContext context, ThemeData themeData) {
    List<MaterialEntity> involvedDataSet = ResourceUtils().getMaterialInvolved();
    List<String> recentVisitors = ResourceUtils().getRecentVisitors();

    return Container(
      margin: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            offset: Offset(1.0, 6.0),
            blurRadius: 40.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          //TODO: Build title
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 10),
            child: Row(
              children: <Widget>[
                Text("Material Involved", style: themeData.primaryTextTheme.caption,),
                Expanded(child: Container(),),
                Material(
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: Text(":", textAlign: TextAlign.center, style: themeData.primaryTextTheme.caption,))), onTap: () {
                    debugPrint("Pressed overflow menu");
                  },),
                )
              ],
            ),
          ),

          Container(
            child: Column(
                children: involvedDataSet.map((item) => MaterialItemView(item)).toList()
            ),
          ),

          //TODO: Hot vegetables
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 20),
            child: Row(
              children: <Widget>[
                Text("Recent Visitors", style: themeData.primaryTextTheme.caption,),
                Expanded(child: Container(),),
                Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                          child: Text("More", style: themeData.primaryTextTheme.button,)),
                      onTap: () {
                        debugPrint("On more button tap");
                      },
                    )
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentVisitors.length - 1,
                itemBuilder: (BuildContext ctx, int index) {
                  var item = recentVisitors[index];
                  return Card(
                    margin: EdgeInsets.only(left: index == 0 ? 30 : 0, right: index == recentVisitors.length - 1 ? 30 : 20, top: 10, bottom: 10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Image.asset(item, width: 70, height: 70, fit: BoxFit.fill,),
                  );
                }
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

}
