import 'package:analyzer/dart/element/element.dart';
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
