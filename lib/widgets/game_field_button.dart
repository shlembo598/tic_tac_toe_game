import 'package:flutter/material.dart';

class GameFieldButton{
  final id;
  String text;
  Color background;
  bool enabled;

  GameFieldButton({this.id, this.text= "", this.background = Colors.grey, this.enabled = true});
}