import 'package:fast_app_base/model/poster_model.dart';
import 'package:fast_app_base/screen/main/tab/home/concert_information/w_festival_poster.dart';
import 'package:fast_app_base/screen/main/tab/home/concert_information/w_festival_timetable.dart';
import 'package:fast_app_base/screen/main/tab/home/w_fyf_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/community_board/w_community_post.dart';
import 'package:flutter/material.dart';

class FestivalInformationFragment extends StatelessWidget {
  
  const FestivalInformationFragment({
    Key? key, required this.poster
  }) : super(key: key);

  final PosterModel poster;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 50,
            ), // 상단바 부분만큼 띄워줌(stack이여서),
            child: Column(
              children: [
                FestivalPoster(poster: poster),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 500,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 34, 34, 34),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              const CommunityPost(boardname: "festivalboard")),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "festivalboard",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              "이동",
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const FestivalTimetable(),
              ],
            ),
          ),
          const FyfAppBar("페스티벌 상세 페이지"),
        ],
      ),
    );
  }
}