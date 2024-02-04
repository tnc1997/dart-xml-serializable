import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeListClassElement extends FakeClassElement {
  FakeListClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'List',
        );
}
