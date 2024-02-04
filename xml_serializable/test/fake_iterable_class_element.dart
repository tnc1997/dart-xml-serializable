import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeIterableClassElement extends FakeClassElement {
  FakeIterableClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'Iterable',
        );
}
