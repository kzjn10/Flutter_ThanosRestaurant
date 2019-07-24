import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thanosrestaurant/data/material_entity.dart';
import 'package:thanosrestaurant/style/colors.dart';
import 'package:thanosrestaurant/style/theme_style.dart';

class MaterialItemView extends StatelessWidget {

  final MaterialEntity itemData;
  final Function(MaterialEntity itemData) onItemInteraction;

  MaterialItemView(this.itemData, {this.onItemInteraction}) :assert(itemData != null);


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = buildPrimaryThemeData(context);

    return Material(
      color: Colors.white,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(itemData.thumb, fit: BoxFit.cover, width: 80, height: 80,)
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${itemData?.name}", style: themeData.primaryTextTheme.display3),
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: itemData.type == ViewType.INFO ?
                      Text("${itemData?.description}", style: themeData.primaryTextTheme.subtitle)
                          : Container(
                        child: FlutterRatingBar(
                          itemSize: 27,
                          itemPadding: EdgeInsets.only(right: 2),
                          initialRating: itemData?.rating ?? 0,
                          fillColor: kColorStar,
                          borderColor: kColorStar.withOpacity(.5),
                          allowHalfRating: true,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          debugPrint("On material item tap");
          if (onItemInteraction != null) {
            onItemInteraction(itemData);
          }
        },
      ),
    );
  }
}
