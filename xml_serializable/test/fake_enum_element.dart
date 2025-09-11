import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_interface_type.dart';
import 'fake_library_element.dart';
import 'fake_metadata.dart';

class FakeEnumElement extends Fake implements EnumElement {
  @override
  final List<FieldElement> fields;

  @override
  final LibraryElement library;

  @override
  final Metadata metadata;

  @override
  final String name;

  @override
  InterfaceType get thisType => _thisType ?? FakeInterfaceType(element: this);

  final InterfaceType? _thisType;

  FakeEnumElement({
    List<FieldElement>? fields,
    LibraryElement? library,
    Metadata? metadata,
    String? name,
    InterfaceType? thisType,
  })  : fields = fields ?? [],
        library = library ?? FakeLibraryElement(),
        metadata = metadata ?? FakeMetadata(),
        name = name ?? 'HelloWorld',
        _thisType = thisType;
}
