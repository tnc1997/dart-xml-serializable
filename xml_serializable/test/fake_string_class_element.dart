import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/mockito.dart';

import 'fake_dart_core_library_element.dart';

class FakeStringClassElement extends Fake implements ClassElement {
  @override
  final library = FakeDartCoreLibraryElement();

  @override
  final metadata = [];

  @override
  final name = 'String';
}
