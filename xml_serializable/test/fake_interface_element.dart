import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'fake_element.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeInterfaceElement extends FakeElement implements InterfaceElement {
  @override
  final List<FieldElement> fields;

  @override
  final LibraryElement library;

  @override
  final String name;

  @override
  late InterfaceType thisType;

  FakeInterfaceElement({
    this.fields = const [],
    LibraryElement? library,
    super.metadata,
    this.name = 'HelloWorld',
    InterfaceType? thisType,
  }) : library = library ?? FakeLibraryElement() {
    this.thisType = thisType ??
        FakeInterfaceType(
          element: this,
        );
  }
}
