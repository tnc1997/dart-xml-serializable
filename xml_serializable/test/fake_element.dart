import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeElement extends Fake implements Element {
  @override
  final LibraryElement? library;

  @override
  final List<ElementAnnotation> metadata;

  @override
  final String? name;

  FakeElement({
    this.library,
    List<ElementAnnotation>? metadata,
    this.name,
  }) : metadata = metadata ?? [];
}
