import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'fake_element.dart';
import 'fake_library_element.dart';

class FakePropertyAccessorElement extends FakeElement
    implements PropertyAccessorElement {
  @override
  final DartType returnType;

  @override
  final LibraryElement library;

  @override
  final String name;

  FakePropertyAccessorElement({
    required this.returnType,
    LibraryElement? library,
    this.name = 'value',
  }) : library = library ?? FakeLibraryElement();
}
