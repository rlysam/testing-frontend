import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/post_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/cubit/posts_data_cubit.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/posts.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/posts_data.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Displaying Bulk of Posts"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocConsumer<PostsDataCubit, PostsDataState>(
          listener: (context, state) {
            // if (state is PostsDataError) {
            //   Scaffold.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text(state.message),
            //     ),
            //   );
            // }
          },
          builder: (context, state) {
            if (state is PostsDataInitial) {
              return buildInitialInput();
            } else if (state is PostsDataLoading) {
              return buildLoading();
            } else if (state is PostsDataLoaded) {
              return buildCardWithData(state.postsData);
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: Column(
        children: [
          Text('Type ka ng page number...'),
          CityInputField(),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

//   Widget buildCardWithData(Weather weather) {
  Widget buildCardWithData(PostsData postsData) {
    var map = postsData.toMap();
    // ! HELLO
    // ito yung...
    // {
    // "total_posts": 17,
    // "total_pages": 2,
    // "posts": []
    // }
    // TODO to List of Posts naman
    // List<Map> allPostsData = map.values .toList(growable: true);
    var posts = map.entries.map((entry) => "${entry.key} + ${entry.value}").toList();
    // List<Post> listPosts = posts.map((e) => "${e.key} + ${e.value}").toList());
    print(posts);

    // final listKeys = map.values.toList(growable: true);
    // final listValues = map.keys.toList(growable: true);

    return ListView(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: map.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: Card(
                        child: ListTile(),
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

//   Widget buildDataMap(Post post) {
//     print("Laman ng data: " + post.toString());
//     var values = post.toMap();
//     // Map<String, dynamic> values = post.toMap();
//     return new ListView.builder(
//       itemCount: values.length,
//       itemBuilder: (BuildContext context, int index) {
//         String key = values.keys.elementAt(index);
//         return new Column(
//           children: <Widget>[
//             new ListTile(
//               title: new Text("$key"),
//               subtitle: new Text("${values[key].toString()}"),
//             ),
//             new Divider(
//               height: 2.0,
//             ),
//           ],
//         );
//       },
//     );
//   }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitPageNumber(context, value),
        textInputAction: TextInputAction.search,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Enter Page Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitPageNumber(BuildContext context, String pahinaNumero) {
    final postsDataCubit = context.read<PostsDataCubit>();
    postsDataCubit.get10Posts(int.parse(pahinaNumero));
  }
}
