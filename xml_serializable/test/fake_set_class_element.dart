import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeSetClassElement extends FakeClassElement {
  FakeSetClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'Set',
        );
}
