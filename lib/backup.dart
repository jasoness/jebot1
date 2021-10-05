import 'package:flutter/material.dart';

void main(){

  runApp(
      MaterialApp(
          home: Scaffold(
            body: Screen(),
          )
      )
  );

}



class Screen extends StatelessWidget
{

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Container(
          margin: EdgeInsets.all(8),
          child:Text('긴급도'),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child:Text('응급유형'),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child:Text('내용'),
        ),
        Container(
            margin: EdgeInsets.all(8),
            child:TextField(
              controller: myController,
            )
        ),
        ElevatedButton(
          onPressed: () {
            // Respond to button press
          },
          child: Text('제보하기'),
        )
      ],
    );

  }
}