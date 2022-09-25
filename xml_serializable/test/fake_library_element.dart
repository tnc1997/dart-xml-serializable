import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:test/fake.dart';

class FakeLibraryElement extends Fake implements LibraryElement {
  @override
  final String identifier;

  @override
  final bool isDartCore;

  @override
  final bool isNonNullableByDefault;

  @override
  final String name;

  @override
  Source get librarySource => FakeLibrarySource(identifier);

  FakeLibraryElement({
    String? identifier,
    bool? isDartCore,
    bool? isNonNullableByDefault,
    String? name,
  })  : identifier = identifier ?? '',
        isDartCore = isDartCore ?? false,
        isNonNullableByDefault = isNonNullableByDefault ?? true,
        name = name ?? '';
}

class FakeLibrarySource extends Fake implements Source {
  FakeLibrarySource(this._uri);

  final String _uri;

  @override
  Uri get uri => Uri.parse(_uri);
}
