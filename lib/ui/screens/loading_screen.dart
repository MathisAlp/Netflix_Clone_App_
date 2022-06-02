import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_app/shared/constants.dart';
import 'package:netflix_app/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../repositories/data_repository.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: alpBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo2.png"),
          const SizedBox(
            height: 25,
          ),
          const SpinKitCircle(
            color: alpPrimaryColor,
            size: 50,
            duration: Duration(seconds: 10),
          )
        ],
      ),
    );
  }
}
