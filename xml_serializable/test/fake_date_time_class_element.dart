import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeDateTimeClassElement extends FakeClassElement {
  FakeDateTimeClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'DateTime',
        );
}
