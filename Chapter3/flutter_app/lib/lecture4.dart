import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'BuildContext Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(title: const Text('Demo')),
          body: MyStatelessWidget()
      ),
    );
  }
}

/*
1. title을 받아와서 Appbar title에 표시해보겠습니다.
2. BottomSheet가 정상적으로 표시되도록 BuildContext를 이용해 오류를 해결해보겠습니다.
*/

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          child: const Text('SHOW BOTTOM SHEET'),
          onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: (
            //     const Text('Close BottomSheet')
            //   ),
            //   action: SnackBarAction(
            //     label: 'ACTION',
            //     onPressed: () { },
            //   ),
            // ));
            Scaffold.of(context).showBottomSheet(
                  (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  height: 200,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('BottomSheet'),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
    );
  }
}