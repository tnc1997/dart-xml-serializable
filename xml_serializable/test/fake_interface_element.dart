import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_interface_type.dart';
import 'fake_library_element.dart';
import 'fake_metadata.dart';

class FakeInterfaceElement extends Fake implements InterfaceElement {
  @override
  final List<FieldElement> fields;

  @override
  final LibraryElement library;

  @override
  final Metadata metadata;

  @override
  final String name;

  @override
  late InterfaceType thisType;

  FakeInterfaceElement({
    this.fields = const [],
    LibraryElement? library,
    Metadata? metadata,
    this.name = 'HelloWorld',
    InterfaceType? thisType,
  })  : library = library ?? FakeLibraryElement(),
        metadata = metadata ?? FakeMetadata() {
    this.thisType = thisType ??
        FakeInterfaceType(
          element: this,
        );
  }
}
