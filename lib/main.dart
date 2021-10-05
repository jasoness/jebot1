import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '제보화면';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: RadioButtonWidget(),
        ),
      ),
    );
  }
}
//enum 열거형으로 변수 선언
enum emer { u,m,d}


/// This is the stateful widget that the main application instantiates.
class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonWidgetState extends State<RadioButtonWidget> {

  final _valueList = ['교통사고', '화재', '기타'];
  var _selectedValue = '교통사고';

  //emer 초기값 선언
  emer? _emer = emer.u;

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

// yaml dependency 추가, android : AndroidManifest.xml permission추가
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position.latitude);
    print( position.longitude);
    return position;
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          child:Text('긴급도'),
        ),
        ListTile(
          //ListTile - title에는 내용,
          //leading or trailing에 체크박스나 더보기와 같은 아이콘을 넣는다.
          title: const Text('상'),
          leading: Radio<emer>(
            value: emer.u,
            groupValue: _emer,
            onChanged: (emer? value) {
              setState(() {
                _emer = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('중'),
          leading: Radio<emer>(
            value: emer.m,
            groupValue: _emer,
            onChanged: (emer? value) {
              setState(() {
                _emer = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('하'),
          leading: Radio<emer>(
            value: emer.d,
            groupValue: _emer,
            onChanged: (emer? value) {
              setState(() {
                _emer = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child:Text('응급유형'),
        ),
        Container(
            margin: EdgeInsets.all(8),
            child:DropdownButton(
                value: _selectedValue,
                items: _valueList.map(
                  (value) {
                    return DropdownMenuItem (
                      value: value,
                      child: Text(value),
                    );
                        },
                  ).toList(),
                  onChanged: (value) {
                          setState(() {
                      _selectedValue = value.toString();
                    });
                },
                  )
        ),
        Container(
          margin: EdgeInsets.all(8),
          child:Text('내용'),
        ),
        Container(
            margin: EdgeInsets.all(8),
            child:TextField(
              controller: myController2,
            )
        ),
        ElevatedButton(
          onPressed: () {
            // Respond to button press
            getCurrentLocation();
          },
          child: Text('제보하기'),
        )
      ],
    );
  }
}

//gps 값 받아오기 참고 페이지
//https://yj95.tistory.com/224, https://javaexpert.tistory.com/977, https://pub.dev/packages/geolocator/example
