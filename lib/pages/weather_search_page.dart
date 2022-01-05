import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/weather_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildCardWithData(state.weather);
            } else {
              // (state is WeatherError)
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

//   Widget buildCardWithData(Weather weather) {
  Widget buildCardWithData(Weather album) {
    //   TODO: gumagana to, yung isa hindi... 
// var url = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
print(album.thumbnailUrl); //String
print(album.thumbnailUrl.runtimeType);
print(album.url);
print(album.url.runtimeType); //String
    return Column(
      children: [
        Container(
            color: Colors.amber,
            
            constraints: BoxConstraints(maxHeight: 400, maxWidth: 400, minWidth: 44, minHeight:44,),
          child: Image.network(
            album.url,
            fit: BoxFit.cover,
          ),
        ),
        Card(
          child: ListTile(
            leading: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 300,
                    maxWidth: 300,
                    minWidth: 44,
                    minHeight: 44),
                child: Image.network(
                  album.thumbnailUrl,
                  fit: BoxFit.cover,
                )),
            title: Text("post ID: " +
                album.id.toString() +
                " | " +
                album.albumId.toString()), //id
            subtitle: Text(album.title + " | " + album.url), //title
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          ),
        ),
        CityInputField()
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Enter ALBUM Post ID",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String number) {
    final weatherCubit = context.read<WeatherCubit>();
    weatherCubit.getWeather(int.parse(number));
  }
}
