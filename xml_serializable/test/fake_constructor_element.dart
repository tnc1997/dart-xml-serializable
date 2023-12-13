import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

import 'fake_library_element.dart';

class FakeConstructorElement extends Fake implements ConstructorElement {
  @override
  final InterfaceElement enclosingElement;

  @override
  final LibraryElement library;

  FakeConstructorElement({
    required this.enclosingElement,
    LibraryElement? library,
  }) : library = library ?? FakeLibraryElement();
}
