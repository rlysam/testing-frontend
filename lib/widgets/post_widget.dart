// Note: Responsive text FLUTTER:
// https://www.youtube.com/watch?v=0O_qDZ48F7o

// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/posts.dart';
import 'package:flutter_cubit_bloc_tutorial/widgets/constants.dart';
import 'package:flutter_cubit_bloc_tutorial/widgets/global_widgets.dart';
import 'package:provider/provider.dart';

// var url =
//     'https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60';

class PostWidget extends StatelessWidget {
  // TODO implement transforming Post Widget base on data
  final Post data;

  const PostWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Provider(
        //  TODO: Not yet tested if proper syntax
        create: (context) => data,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 16,
          child: InkWell(
            onTap: () => print('Pindot card ka HUH'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PictureAndBanner(url: data.image_location),
                //!Details
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 10.0, 6.0, 0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PostTitle(),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => print('Tapped the More Icons'),
                            child: const Icon(Icons.more_horiz),
                          ),
                        )
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        SizedBox(height: 10),
                        SecondRowBuilder(),
                        PosterRankRow(),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: kFontColorBlack),
                            SizedBox(width: 5),
                            Text('7-Eleven'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LocationDestinnationRowBuilder(),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    print('\n\nSino kakausapin mo gagu');
                                  },
                                  child: Icon(Icons.mode_comment_outlined)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //ButtonBAr
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationDestinnationRowBuilder extends StatelessWidget {
  const LocationDestinnationRowBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post data = Provider.of<Post>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocationDestinationBuilder(),
        Row(
          children: [
            Icon(Icons.calendar_today, size: 16, color: kFontColorBlack),
            SizedBox(width: 5),
            Text(data.date),
          ],
        ),
      ],
    );
  }
}

// TODO: gawin Widget nito 01/06/2022
class LocationDestinationBuilder extends StatelessWidget {
  const LocationDestinationBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post data = Provider.of<Post>(context);
    bool isPahiram = data.rent_due.isNotEmpty; //note: pahiram lang ang may rent_due
    return Row(
      children: [
        Icon(Icons.local_shipping, size: 16, color: kFontColorBlack),
        SizedBox(width: 5),
// TODO: gawin Widget nito 01/06/2022
        Text(data.delivery_time),
      ],
    );
  }
}

// TODO: gawin Widget nito 01/06/2022
class SecondRowBuilder extends StatelessWidget {
  const SecondRowBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post data = Provider.of<Post>(context);
    bool isPahiram =
        data.rent_due.isNotEmpty; //note: pahiram lang ang may rent_due
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text('PhP 20.00/day'));
  }
}

class PosterRankRow extends StatelessWidget {
  const PosterRankRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ranks = ['Basic', 'Intermediate', 'Savior'];
    Post data = Provider.of<Post>(context);
    bool isPahiram =
        data.rent_due.isNotEmpty; //note: pahiram lang ang may rent_due
    String rank = int.parse(data.points) < 50
        ? ranks.elementAt(0)
        : (int.parse(data.points) > 50 && int.parse(data.points) < 100)
            ? ranks.elementAt(1)
            : ranks.elementAt(2);

    return Row(
      children: [
        Icon(Icons.person, size: 16, color: kFontColorBlack),
        SizedBox(width: 5),
        Text(data.first_name + " " + data.last_name),
        SizedBox(width: 5),
        Icon(Icons.fiber_manual_record, size: 16, color: Colors.blue),
        SizedBox(width: 5),
        Text(rank, style: CommonStyleText.txtStyle(color: kPrimaryPink)),
      ],
    );
  }
}

class PostTitle extends StatelessWidget {
  const PostTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post data = Provider.of<Post>(context);
    bool isPahiram =
        data.rent_due.isNotEmpty; //note: pahiram lang ang may rent_due
    String title = isPahiram ? data.item : data.title;
    return Text(
      title,
      style: CommonStyleText.txtStyle(size: 16, weigth: bold),
    );
  }
}

class PictureAndBanner extends StatelessWidget {
  const PictureAndBanner({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    Post data = Provider.of<Post>(context);
    return Stack(
      // !Picture
      alignment: Alignment.topRight,
      children: [
        Container(
            // width: 339,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data.image_location),
                    fit: BoxFit.fitWidth))),
        Banner()
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post data = Provider.of<Post>(context);
    bool isPahiram =
        data.rent_due.isNotEmpty; //note: pahiram lang ang may rent_due
    Color bannerColor = (((!isPahiram) && data.type == 'delivery')
            ? kBanner1
            : ((!isPahiram) && data.type == 'request')
                ? kBanner2
                : ((isPahiram) && data.type == 'rent')
                    ? kBanner3
                    : kBanner4
        // ((isPahiram) && data.type=='request' ) ? Kbanner4
        );
    return Container(
      decoration: null,
      color: bannerColor,
      padding: const EdgeInsets.all(5.0),
      child: Text(
        data.type.toUpperCase(),
        style: CommonStyleText.txtStyle(
            weigth: bold, color: kFontColorWhite, size: 14),
      ),
    );
  }
}
