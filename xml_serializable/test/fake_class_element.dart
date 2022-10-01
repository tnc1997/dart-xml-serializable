import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/generated/source.dart';
import 'package:test/fake.dart';

import 'fake_field_element.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeClassElement extends Fake implements ClassElement {
  @override
  final List<FieldElement> fields;

  @override
  final LibraryElement library;

  @override
  final List<ElementAnnotation> metadata;

  @override
  final String name;

  @override
  ElementKind get kind => ElementKind.CLASS;

  @override
  Source get librarySource => library.librarySource;

  @override
  InterfaceType get thisType => _thisType ?? FakeInterfaceType(element: this);

  @override
  FieldElement? getField(String name) {
    if (name == 'value') {
      return FakeFieldElement(name: name);
    }
    return null;
  }

  final InterfaceType? _thisType;

  FakeClassElement({
    List<FieldElement>? fields,
    LibraryElement? library,
    List<ElementAnnotation>? metadata,
    String? name,
    InterfaceType? thisType,
  })  : fields = fields ?? [],
        library = library ?? FakeLibraryElement(),
        metadata = metadata ?? [],
        name = name ?? 'HelloWorld',
        _thisType = thisType;
}
