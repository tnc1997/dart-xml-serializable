import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeUriClassElement extends FakeClassElement {
  FakeUriClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'Uri',
        );
}
