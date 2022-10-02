import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

import 'fake_library_element.dart';

class FakeConstructorElement extends Fake implements ConstructorElement {
  @override
  final InterfaceElement enclosingElement3;

  @override
  final LibraryElement library;

  FakeConstructorElement({
    required this.enclosingElement3,
    LibraryElement? library,
  }) : library = library ?? FakeLibraryElement();
}
