import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeConstructorElement extends Fake implements ConstructorElement {
  @override
  final ClassElement enclosingElement;

  @override
  final LibraryElement library;

  FakeConstructorElement(this.enclosingElement, this.library);
}
