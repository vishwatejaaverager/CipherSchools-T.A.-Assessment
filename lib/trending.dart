import 'package:flutter/material.dart';
import 'package:flutter_application_4/description.dart';
import 'package:flutter_application_4/uttils/text.dart';

class TrendingMovies extends StatelessWidget {
  late List trending;

  TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500/' +
                                            trending[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500/' +
                                            trending[index]['poster_path'],
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launch_on: trending[index]['release_date']
                                        .toString(),
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/' +
                                        trending[index]['poster_path']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: modified_text(
                                text: trending[index]['title'] ?? "",
                                color: Colors.amber,
                                size: 16),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
