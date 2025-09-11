import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeLibraryElement extends Fake implements LibraryElement {
  @override
  final List<ClassElement> classes;

  @override
  final String identifier;

  @override
  final bool isDartCore;

  @override
  final String name;

  FakeLibraryElement({
    List<ClassElement>? classes,
    String? identifier,
    bool? isDartCore,
    String? name,
  })  : classes = classes ?? [],
        identifier = identifier ?? '',
        isDartCore = isDartCore ?? false,
        name = name ?? '';
}
