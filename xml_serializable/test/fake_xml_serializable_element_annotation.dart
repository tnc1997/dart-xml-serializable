import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_serializable_class_element.dart';
import 'fake_xml_serializable_dart_object.dart';

class FakeXmlSerializableConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlSerializableConstructorElementElementAnnotation({
    required XmlSerializable value,
  }) : super(
          enclosingElement: FakeXmlSerializableClassElement(),
          value: FakeXmlSerializableDartObject(
            value: value,
          ),
        );
}

class FakeXmlSerializablePropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlSerializablePropertyAccessorElementElementAnnotation({
    required XmlSerializable value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlSerializableClassElement(),
          ),
          value: FakeXmlSerializableDartObject(
            value: value,
          ),
        );
}
