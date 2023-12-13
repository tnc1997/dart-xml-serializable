import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeFieldElement extends Fake implements FieldElement {
  @override
  final Element enclosingElement;

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
    Element? enclosingElement,
    LibraryElement? library,
    List<ElementAnnotation>? metadata,
    String? name,
    DartType? type,
    bool? isEnumConstant,
  })  : enclosingElement = enclosingElement ?? FakeClassElement(),
        library = library ?? FakeLibraryElement(),
        metadata = metadata ?? [],
        name = name ?? 'value',
        type = type ?? FakeInterfaceType(),
        isEnumConstant = isEnumConstant ?? false;
}
