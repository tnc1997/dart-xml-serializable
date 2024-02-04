import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeBoolClassElement extends FakeClassElement {
  FakeBoolClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'bool',
        );
}
