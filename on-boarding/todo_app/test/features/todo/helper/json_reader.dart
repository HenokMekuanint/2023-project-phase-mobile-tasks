import 'dart:io';

String readJson(String name) {
  print("hello");
  var dir = Directory.current.path;

  if (dir.endsWith('test')) {
    dir = dir.replaceAll('test', '');
  }
  print("here is the path"+dir);
  return File('$dir/test/$name').readAsStringSync();
}
