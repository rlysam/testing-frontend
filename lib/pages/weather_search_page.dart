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
  Widget buildCardWithData(Weather post) {
    //   TODO: gumagana to, yung isa hindi...
// var url = 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
    var map = post.toMap();
    final listKeys = map.values.toList(growable: true);
    final listValues = map.keys.toList(growable: true);

    return Column(
      children: [
        Container(
          color: Colors.amber,
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 200,
            minWidth: 200,
            minHeight: 200,
          ),
          child: Image.network(
            post.image_location,
            // post.url,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: map.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: Card(
                        child: ListTile(
                          title: Text(listKeys[index].toString()),
                          subtitle: Text(listValues[index].toString()),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        CityInputField()
      ],
    );
  }

  Widget buildDataMap(Weather post) {
    print("Laman ng data: " + post.toString());
    var values = post.toMap();
    // Map<String, dynamic> values = post.toMap();
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        String key = values.keys.elementAt(index);
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text("$key"),
              subtitle: new Text("${values[key].toString()}"),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
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
          hintText: "Enter post ID",
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
