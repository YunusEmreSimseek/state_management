import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ImageEnums { camp_alt, camp_alt2 }

extension ImageEnumsExtesion on ImageEnums {
  Image get toImage => Image.asset('assets/images/img_$name.png');
}
