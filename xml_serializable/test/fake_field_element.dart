import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_type.dart';
import 'fake_library_element.dart';
import 'fake_metadata.dart';

class FakeFieldElement extends Fake implements FieldElement {
  @override
  final InstanceElement enclosingElement;

  @override
  final LibraryElement library;

  @override
  final Metadata metadata;

  @override
  final String name;

  @override
  final DartType type;

  @override
  final bool isEnumConstant;

  FakeFieldElement({
    InstanceElement? enclosingElement,
    LibraryElement? library,
    Metadata? metadata,
    this.name = 'value',
    DartType? type,
    this.isEnumConstant = false,
  })  : enclosingElement = enclosingElement ?? FakeClassElement(),
        library = library ?? FakeLibraryElement(),
        metadata = metadata ?? FakeMetadata(),
        type = type ?? FakeDartType();
}
