import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

import 'fake_dart_core_library_element.dart';

class FakeIntClassElement extends Fake implements ClassElement {
  @override
  final library = FakeDartCoreLibraryElement();

  @override
  final metadata = [];

  @override
  final name = 'int';
}
