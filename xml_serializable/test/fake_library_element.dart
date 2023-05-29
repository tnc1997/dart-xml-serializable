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
  final List<LibraryImportElement> libraryImports;

  @override
  final String name;

  @override
  final Iterable<Element> topLevelElements;

  FakeLibraryElement({
    String? identifier,
    bool? isDartCore,
    bool? isNonNullableByDefault,
    List<LibraryImportElement>? libraryImports,
    String? name,
    Iterable<Element>? topLevelElements,
  })  : identifier = identifier ?? '',
        isDartCore = isDartCore ?? false,
        libraryImports = libraryImports ?? [],
        isNonNullableByDefault = isNonNullableByDefault ?? true,
        name = name ?? '',
        topLevelElements = topLevelElements ?? [];
}
