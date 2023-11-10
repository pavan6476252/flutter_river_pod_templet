import 'package:flutter/material.dart'; 
import 'package:flutter_riverpod_base/src/utils/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,),
      routerConfig: router,
    );

    //  return MaterialApp(
    //    home: HomeView(),
    //  );
  }
}
