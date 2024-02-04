import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_value_class_element.dart';
import 'fake_xml_value_dart_object.dart';

class FakeXmlValueConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlValueConstructorElementElementAnnotation({
    required XmlValue value,
  }) : super(
          enclosingElement: FakeXmlValueClassElement(),
          value: FakeXmlValueDartObject(
            value: value,
          ),
        );
}

class FakeXmlValuePropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlValuePropertyAccessorElementElementAnnotation({
    required XmlValue value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlValueClassElement(),
          ),
          value: FakeXmlValueDartObject(
            value: value,
          ),
        );
}
