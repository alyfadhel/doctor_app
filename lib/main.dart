import 'package:doctor_master/constants.dart';
import 'package:doctor_master/layout/cubit/cubit.dart';
import 'package:doctor_master/layout/cubit/observer.dart';
import 'package:doctor_master/shared/remote/dio_helper.dart';
import 'package:doctor_master/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> DoctorCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'doctor app',
        theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light
            ),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
