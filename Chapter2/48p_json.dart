import 'dart:convert';

void main() {
  var jsonString = '''
  [
    {"name": "boss"},
    {"name": "cain"}
  ]
 ''';

  var names = jsonDecode(jsonString);

  print(names is List);

  var firstName = names[0];

  print(firstName is Map);

  print(firstName['name']);
}