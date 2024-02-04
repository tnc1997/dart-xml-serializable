import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeStringClassElement extends FakeClassElement {
  FakeStringClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'String',
        );
}
