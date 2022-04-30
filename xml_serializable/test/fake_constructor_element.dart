import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/mockito.dart';

class FakeConstructorElement extends Fake implements ConstructorElement {
  @override
  final ClassElement enclosingElement;

  @override
  final LibraryElement library;

  FakeConstructorElement(this.enclosingElement, this.library);
}
