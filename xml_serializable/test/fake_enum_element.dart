import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeEnumElement extends Fake implements EnumElement {
  @override
  final List<FieldElement> fields;

  @override
  final LibraryElement library;

  @override
  final List<ElementAnnotation> metadata;

  @override
  final String name;

  @override
  InterfaceType get thisType => _thisType ?? FakeInterfaceType(element2: this);

  final InterfaceType? _thisType;

  FakeEnumElement({
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
