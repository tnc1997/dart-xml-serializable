import 'package:analyzer/dart/element/type.dart';

import 'fake_element_annotation.dart';
import 'fake_property_accessor_element.dart';

class FakePropertyAccessorElementElementAnnotation
    extends FakeElementAnnotation {
  FakePropertyAccessorElementElementAnnotation({
    required DartType returnType,
    super.value,
  }) : super(
          element: FakePropertyAccessorElement(
            returnType: returnType,
          ),
        );
}
