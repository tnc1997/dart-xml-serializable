import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_attribute_class_element.dart';
import 'fake_xml_attribute_dart_object.dart';

class FakeXmlAttributeConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlAttributeConstructorElementElementAnnotation({
    required XmlAttribute value,
  }) : super(
          enclosingElement3: FakeXmlAttributeClassElement(),
          value: FakeXmlAttributeDartObject(
            value: value,
          ),
        );
}

class FakeXmlAttributePropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlAttributePropertyAccessorElementElementAnnotation({
    required XmlAttribute value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlAttributeClassElement(),
          ),
          value: FakeXmlAttributeDartObject(
            value: value,
          ),
        );
}
