import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class imam extends StatefulWidget {
  const imam({Key? key}) : super(key: key);

  @override
  _imamState createState() => _imamState();
}

class _imamState extends State<imam> {

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffe House"),
        actions: [
          PopupMenuButton(
            onSelected: (val){
              switch(val){

                case'home':

                  break;

                case'rating':

                  break;

                case'MacCoffe':
                  break;

                case'kfc':
                  _launchInBrowser("https://www.coffeehousecafe.com/");
                  break;

                case'rubelPoint':
                  _makePhoneCall("01628907505");
                  break;
              }
            },

            itemBuilder:
          (BuildContext context)
          {
            return[
              PopupMenuItem(
                  child: Text("Home"),
                value: 'home',
              ),
              PopupMenuItem(
                  child: Text("Rating"),
                value: 'rating',
              ),
              PopupMenuItem(
                  child: Text("MacCoffe"),
                value: 'MacCoffe',
              ),
              PopupMenuItem(
                  child: Text("Kfc"),
                value: 'kfc',
              ),
              PopupMenuItem(
                  child: Text("RubelPoint"),
                value:'rubelPoint',
              ),
              PopupMenuItem(
                  child: Text("Madaripur"),
                value: 'madaripur',
              ),
            ];
          }
          )
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
              items:[
                Card(
                  elevation: 5,
                   child: Center(child: Text("Mithun Mandal",
                   style:TextStyle(
                     color: Colors.redAccent,
                     fontSize: 22,
                     fontWeight: FontWeight.bold
                   ),
                   ),),
      ),
                Card(
                  elevation: 5,
                  child: Center(child: Text("Mithun Mandal",
                    style:TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),),
                ),
                Card(
                  elevation: 5,
                  child: Center(child: Text("Mithun Mandal",
                    style:TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),),
                ),
                Card(
                  elevation: 5,
                  child: Center(child: Text("Mithun Mandal",
                    style:TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),),
                ),
      ],
            options: CarouselOptions(
    height:250,
    aspectRatio: 16/9,
    viewportFraction: 0.8,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
    )
    ) ,
              ]
      )
    );
  }
}
