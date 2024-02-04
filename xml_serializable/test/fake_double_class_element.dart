import 'fake_class_element.dart';
import 'fake_dart_core_library_element.dart';

class FakeDoubleClassElement extends FakeClassElement {
  FakeDoubleClassElement()
      : super(
          library: FakeDartCoreLibraryElement(),
          name: 'double',
        );
}
