import 'package:analyzer/dart/element/element.dart';

import 'fake_interface_element.dart';

class FakeClassElement extends FakeInterfaceElement implements ClassElement {
  FakeClassElement({
    super.fields,
    super.library,
    super.metadata,
    super.name,
    super.thisType,
  });
}
