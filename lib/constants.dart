import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:login_page_firebase/Starting(Login-Sign)/Login.dart';

class theme{
 Color maincolor=  Color(0xffED1C39) ;
 Color grid = Color(0xffF3F3F3) ;
   Color here=  Color(0xff52DACC) ;
 Color here1=  Color(0xffD6FFF5) ;
}
BoxDecoration decor = BoxDecoration(
 color: CupertinoColors.white,
 borderRadius: BorderRadius.all(Radius.circular(20)) ,
 boxShadow: [
  BoxShadow(
   color: themecolor.here1,
   blurRadius: 10 ,
   offset: Offset(
    5 ,5
   )
  )
]
) ;