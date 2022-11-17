import 'dart:async';

main() async {

    // 하나씩 실행해야 에러가 나지 않습니다. 
    var stream = Stream.fromIterable([1,2,3,4,5]);
    await for(final value in stream) {
        print(value);
    }
    await for(final value in stream) {
        print(value);
    }
    var first = stream.first;
    var first2 = stream.first;
    print(first.hashCode);
    print(first2.hashCode);
    first.then((value) => print("first: $value"));  // 가장 앞의 데이터 결과 : 1
    first2.then((value) => print("first2: $value"));  // 가장 앞의 데이터 결과 : 1
    stream.last.then((value) => print("last: $value"));  // 가장 마지막의 데이터의 결과 : 5
    stream.isEmpty.then((value) => print("isEmpty: $value"));  // 현재 스트림이 비어있는지 확인 : false
    // stream.length.then((value) => print("length: $value"));  // 전체 길이 : 5
}