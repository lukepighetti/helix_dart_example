import 'dart:io';

void main() {
  final file = File('out.dart');
  final lines = <String>[];

  for (var i = 0; i < 500000; i++) {
    lines.addAll([
      'class Foo$i {',
      '  final String name = "foo$i";',
      if (i > 0) 'final Foo${i - 1} previous = Foo${i - 1}();',
      '}',
    ]);
  }

  for (final line in lines) {
    file.writeAsStringSync(line, mode: FileMode.append);
  }
}
