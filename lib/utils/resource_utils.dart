import 'package:flutter/material.dart';
import 'package:thanosrestaurant/data/material_entity.dart';
import 'package:thanosrestaurant/data/menu_entity.dart';

class ResourceUtils {

  List<MenuEntity> getMenuList() {
    List<MenuEntity> dataSet = List();
    dataSet.add(MenuEntity("Titan Pumpkin", "assets/graphic/m1.png", Color.fromRGBO(255, 183, 78, 1.0)));
    dataSet.add(MenuEntity("Raspberry Smoothie", "assets/graphic/m2.png", Color.fromRGBO(76, 203, 254, 1.0)));
    dataSet.add(MenuEntity("Unknown Salad", "assets/graphic/m3.png", Color.fromRGBO(160, 125, 251, 1.0)));
    return dataSet;
  }


  List<MaterialEntity> getHotMaterialList() {
    List<MaterialEntity> dataSet = List();
    dataSet.add(MaterialEntity("assets/graphic/f1.png", "Titan Star Banana", "", 5.0, type: ViewType.RATING));
    dataSet.add(MaterialEntity("assets/graphic/f2.png", "Titan Pumpkin", "", 4.7, type: ViewType.RATING));
    dataSet.add(MaterialEntity("assets/graphic/f3.png", "Magical Ghost Fruit", "", 4.5, type: ViewType.RATING));
    return dataSet;
  }

  List<MaterialEntity> getMaterialInvolved() {
    List<MaterialEntity> dataSet = List();
    dataSet.add(MaterialEntity("assets/graphic/f2.png", "Titan Pumpkin", "Thanos planted by himself", 4.7, type: ViewType.INFO));
    dataSet.add(MaterialEntity("assets/graphic/f3.png", "Magical Ghost Fruit", "Developed using Infinity stones", 4.5, type: ViewType.INFO));
    return dataSet;
  }

  List<String> getRecentVisitors() {
    List<String> dataSet = List();
    dataSet.add("assets/graphic/u1.png");
    dataSet.add("assets/graphic/u2.png");
    dataSet.add("assets/graphic/u3.png");
    dataSet.add("assets/graphic/u4.png");
    dataSet.add("assets/graphic/u5.png");
    return dataSet;
  }

}