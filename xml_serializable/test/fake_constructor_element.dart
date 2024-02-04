import 'package:analyzer/dart/element/element.dart';

import 'fake_element.dart';
import 'fake_library_element.dart';

class FakeConstructorElement extends FakeElement implements ConstructorElement {
  @override
  final InterfaceElement enclosingElement;

  @override
  final LibraryElement library;

  @override
  final String name;

  FakeConstructorElement({
    required this.enclosingElement,
    LibraryElement? library,
    this.name = 'HelloWorld',
  }) : library = library ?? FakeLibraryElement();
}
