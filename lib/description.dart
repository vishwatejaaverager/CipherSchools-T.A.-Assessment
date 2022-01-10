import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/uttils/text.dart';

class Description extends StatelessWidget {
  final String? name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Container(
          child: ListView(children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.black,
                        child: modified_text(
                          text: ' ⭐ Rating : -' + vote!,
                          color: Colors.white,
                          size: 18,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name ?? "Not loaded", color: Colors.white, size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: 'launch on ' + launch_on!,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: modified_text(
                text: description!,
                color: Colors.white,
                size: 16,
              )),
            ),
          ]),
        ));
  }
}
