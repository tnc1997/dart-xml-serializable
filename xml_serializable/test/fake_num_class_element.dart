import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeNumClassElement extends FakeClassElement {
  FakeNumClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'num',
        );
}
