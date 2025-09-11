import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeMetadata extends Fake implements Metadata {
  @override
  final List<ElementAnnotation> annotations;

  FakeMetadata({
    List<ElementAnnotation>? annotations,
  }) : annotations = annotations ?? [];
}
