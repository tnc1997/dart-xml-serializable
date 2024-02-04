import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_root_element_class_element.dart';
import 'fake_xml_root_element_dart_object.dart';

class FakeXmlRootElementConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlRootElementConstructorElementElementAnnotation({
    required XmlRootElement value,
  }) : super(
          enclosingElement: FakeXmlRootElementClassElement(),
          value: FakeXmlRootElementDartObject(
            value: value,
          ),
        );
}

class FakeXmlRootElementPropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlRootElementPropertyAccessorElementElementAnnotation({
    required XmlRootElement value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlRootElementClassElement(),
          ),
          value: FakeXmlRootElementDartObject(
            value: value,
          ),
        );
}
