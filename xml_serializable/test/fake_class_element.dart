import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

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
  final List<InterfaceType> allSupertypes;

  @override
  InterfaceType get thisType =>
      _thisType ??
      FakeInterfaceType(
        element: this,
      );

  final InterfaceType? _thisType;

  FakeClassElement({
    List<FieldElement>? fields,
    LibraryElement? library,
    List<ElementAnnotation>? metadata,
    String? name,
    List<InterfaceType>? allSupertypes,
    InterfaceType? thisType,
  })  : fields = fields ?? [],
        library = library ?? FakeLibraryElement(),
        metadata = metadata ?? [],
        name = name ?? 'HelloWorld',
        allSupertypes = allSupertypes ?? [],
        _thisType = thisType;
}
