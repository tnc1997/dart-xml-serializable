import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_element_class_element.dart';
import 'fake_xml_element_dart_object.dart';

class FakeXmlElementConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlElementConstructorElementElementAnnotation({
    required XmlElement value,
  }) : super(
          enclosingElement3: FakeXmlElementClassElement(),
          value: FakeXmlElementDartObject(
            value: value,
          ),
        );
}

class FakeXmlElementPropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlElementPropertyAccessorElementElementAnnotation({
    required XmlElement value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlElementClassElement(),
          ),
          value: FakeXmlElementDartObject(
            value: value,
          ),
        );
}
