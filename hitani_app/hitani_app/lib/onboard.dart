import 'package:flutter/material.dart';
import 'package:hitani_app/home.dart';
import 'package:hitani_app/nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller;


  @override
  void initState() { 
    super.initState();
    _controller = PageController();
  }

    Widget page3(){
    return Container(
      color: Colors.lightGreen[400],
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        children: [
          
          SizedBox(width: 160, height: 160,
          child: Image.asset('assets/images/hitani.png')),
          
          SizedBox(
            height: 400,
            child: ShaderMask(
              child: Image.asset('assets/images/farmer.png'),
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black, Colors.transparent
                  ]
                ).createShader(Rect.fromLTRB(0, 200, rect.width, rect.height - 40));
              },
            ),
          ),
          SizedBox(height: 16),
          Text('Pilih produk kebutuhan pertanian Anda dengan Kualitas Terjamin dan Harga Terjangkau.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
  
          Positioned(
            right: 24.0,
            bottom: 45,
            child: Container(
              width: 120,
              child: RaisedButton(
                onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
                },
                elevation: 0,
                color: Colors.lightGreen[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text('Get start', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),),
              )
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              page3()
            ],
          ),

        ],
      ),
    );
  }
}