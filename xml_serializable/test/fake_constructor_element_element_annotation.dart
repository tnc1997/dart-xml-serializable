import 'package:analyzer/dart/element/element.dart';

import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';

class FakeConstructorElementElementAnnotation extends FakeElementAnnotation {
  FakeConstructorElementElementAnnotation({
    required InterfaceElement enclosingElement,
    super.value,
  }) : super(
          element: FakeConstructorElement(
            enclosingElement: enclosingElement,
          ),
        );
}
