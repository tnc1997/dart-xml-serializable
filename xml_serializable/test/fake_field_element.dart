import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'fake_dart_type.dart';
import 'fake_element.dart';
import 'fake_library_element.dart';

class FakeFieldElement extends FakeElement implements FieldElement {
  @override
  final Element enclosingElement;

  @override
  final LibraryElement library;

  @override
  final String name;

  @override
  final DartType type;

  @override
  final bool isEnumConstant;

  FakeFieldElement({
    Element? enclosingElement,
    LibraryElement? library,
    super.metadata,
    this.name = 'value',
    DartType? type,
    this.isEnumConstant = false,
  })  : enclosingElement = enclosingElement ?? FakeElement(),
        library = library ?? FakeLibraryElement(),
        type = type ?? FakeDartType();
}
