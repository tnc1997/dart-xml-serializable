import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeDurationClassElement extends FakeClassElement {
  FakeDurationClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'Duration',
        );
}
