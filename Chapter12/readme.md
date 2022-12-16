* native_example1,2,3 
  - 도서 소스
* native_demo1 
  - methodChannel 시연 소스
* native_pigeon 
  - pigeon 시연 소스
  - pigeon 파일로 소스 제너레이션
  ```
  $ flutter.bat pub run pigeon --input pigeon/device_schema.dart \
    --dart_out lib/deviceInfoService.dart \
    --java_out .\android\app\src\main\java\io\flutter\plugins\DeviceInfoService.java \
    --java_package "io.flutter.plugins"
  ```
* 참조한 문서
  - flutter 공식 문서
    - https://docs.flutter.dev/development/platform-integration/platform-channels?tab=type-mappings-kotlin-tab
  - pigeon 공식 문서
    - https://pub.dev/packages/pigeon/example