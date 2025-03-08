import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_type.dart';
import 'fake_library_element.dart';

class FakeFieldElement extends Fake implements FieldElement {
  @override
  final Element enclosingElement3;

  @override
  final LibraryElement library;

  @override
  final List<ElementAnnotation> metadata;

  @override
  final String name;

  @override
  final DartType type;

  @override
  final bool isEnumConstant;

  FakeFieldElement({
    Element? enclosingElement3,
    LibraryElement? library,
    this.metadata = const [],
    this.name = 'value',
    DartType? type,
    this.isEnumConstant = false,
  })  : enclosingElement3 = enclosingElement3 ?? FakeClassElement(),
        library = library ?? FakeLibraryElement(),
        type = type ?? FakeDartType();
}
