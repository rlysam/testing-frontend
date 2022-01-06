import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/post_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/data/post_posts_repository.dart';
import 'package:flutter_cubit_bloc_tutorial/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherCubit(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}

//multiple Bloc Provider
// https://github.com/felangel/bloc/issues/15#issuecomment-462058084

// class GlovalBlocProvider extends StatelessWidget {
//   final Widget child;
//   const GlovalBlocProvider({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider( //Switch Button will be provided sa whole landing
//       create: (context) => SwitchButtonPahireAm(),
//       child: BlocProvider( // MainContent will ALSO Be Provided to whole landing
//         create: (context) => WeatherCubit(FakeWeatherRepository()),
//         // child = WHOLE Main Page
//         child: child, 
//       ),
//     );
//   }
// }
