import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webangle/utils/routes.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark,systemNavigationBarIconBrightness: Brightness.dark));
  runApp(Webangel());
}
class Webangel extends StatefulWidget {
  const Webangel({Key? key}) : super(key: key);

  @override
  State<Webangel> createState() => _WebangelState();
}

class _WebangelState extends State<Webangel> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The HR India',
      getPages: getPages,
      initialRoute: Routes.splash,
    );
  }
}
