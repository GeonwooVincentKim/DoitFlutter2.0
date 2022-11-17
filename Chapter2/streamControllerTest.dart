import 'dart:async';

void main() async {
  // StreamController 정의
  final streamController = StreamController(
    onPause: () => print('controller - Paused'),
    onResume: () => print('controller - Resumed'),
    onCancel: () => print('controller - Cancelled'),
    onListen: () => print('controller - Listens'),
  );

  // listener 등록
  streamController.stream.listen(
      (event) => print('Event: $event'),
    onDone: () => print('Done'),
    onError: (error) => print(error),
  );

  // 이벤트 발생
  streamController.add(999);

  // 스트림 생성
  final stream = Stream<int>.periodic(
      const Duration(milliseconds: 200), (count) => count * count
  ).take(4);

  // 이벤트 발생 with stream
  await streamController.addStream(stream);

  print(streamController.isClosed);
  await streamController.close();
  print(streamController.isClosed);
}