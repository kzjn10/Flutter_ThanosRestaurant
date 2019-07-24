import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thanosrestaurant/data/material_entity.dart';
import 'package:thanosrestaurant/data/menu_entity.dart';
import 'package:thanosrestaurant/style/colors.dart';
import 'package:thanosrestaurant/utils/resource_utils.dart';
import 'package:thanosrestaurant/widgets/material_item_view.dart';

import 'detail_page.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Material(
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: kColorBackground,
            leading: IconButton(icon: Icon(Icons.menu), onPressed: () {
              debugPrint("Press hamberger menu");
            }),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add, size: 28), onPressed: () {
                debugPrint("Press add menu");
              }),
              IconButton(icon: Icon(FontAwesomeIcons.bell, size: 20,), onPressed: () {
                debugPrint("Press notification menu");
              }),
            ],
            elevation: 0,
          ),
          body: Container(
            color: kColorBackground,
            child: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  //TODO: Build profile
                  _buildProfile(context, _themeData),

                  //TODO: Build Star dishes
                  _buildStarDishes(context, _themeData)

                  //TODO: Build Hot vegetables


                ],
              ),
            ),
          ),
        )
    );
  }

  Widget _buildProfile(BuildContext context, ThemeData themeData) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: <Widget>[
          //TODO: Build profile name
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("assets/graphic/avatar.png", fit: BoxFit.cover, width: 90, height: 90,)
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Thanos Restaurant", style: themeData.primaryTextTheme.title),
                    Text("I am inevitale", style: themeData.primaryTextTheme.subtitle)
                  ],
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20),),
          //TODO: Build more info
          Row(
            children: <Widget>[
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("392k", style: themeData.primaryTextTheme.headline,),
                  Text("Followers", style: themeData.primaryTextTheme.subhead,)
                ],
              ),),
              Expanded(child: Column(
                children: <Widget>[
                  Text("328", style: themeData.primaryTextTheme.headline,),
                  Text("Flowing", style: themeData.primaryTextTheme.subhead,)
                ],
              ),),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("256", style: themeData.primaryTextTheme.headline,),
                  Text("Dishes", style: themeData.primaryTextTheme.subhead,)
                ],
              ),),
            ],
          )


        ],
      ),
    );
  }

  Widget _buildStarDishes(BuildContext context, ThemeData themeData) {
    List<MenuEntity> menuItems = ResourceUtils().getMenuList();
    List<MaterialEntity> hotVegetables = ResourceUtils().getHotMaterialList();
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      margin: EdgeInsets.only(top: 20),
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
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 20),
            child: Row(
              children: <Widget>[
                Text("Star Dishes", style: themeData.primaryTextTheme.caption,),
                Expanded(child: Container(),),
                RichText(text: TextSpan(text: "1", style: themeData.primaryTextTheme.caption, children: <TextSpan>[
                  TextSpan(text: "/", style: themeData.primaryTextTheme.display1),
                  TextSpan(text: "6", style: themeData.primaryTextTheme.display1)
                ]),)
              ],
            ),
          ),

          //TODO: Build category
          Container(
            height: width / 3 * 1.65,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuItems.length,
                itemBuilder: (BuildContext ctx, int index) {
                  var item = menuItems[index];
                  return Card(
                    margin: EdgeInsets.only(left: index == 0 ? 30 : 0, right: index == menuItems.length - 1 ? 30 : 20),
                    color: item.color,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      width: width / 3.1,
                      child: Stack(
                        children: <Widget>[
                          Positioned(child: Image.asset(item.background, fit: BoxFit.cover, width: width / 3,), bottom: -2, right: -2,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                            child: Text(item.name, style: themeData.primaryTextTheme.display2,),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),

          //TODO: Hot vegetables
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35, bottom: 20),
            child: Row(
              children: <Widget>[
                Text("Hot Vegetables", style: themeData.primaryTextTheme.caption,),
                Expanded(child: Container(),),
                Material(
                    elevation: 10,
                    shadowColor: kColorButtonText.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 2),
                          child: Text("BUY", style: themeData.primaryTextTheme.button,)),
                      onTap: () {
                        debugPrint("On buy button tap");
                      },
                    )
                ),
              ],
            ),
          ),

          Container(
            child: Column(
                children: hotVegetables.map((item) =>
                    MaterialItemView(item, onItemInteraction: (item) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
                    },)).toList()
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

}
