import 'package:xml_annotation/xml_annotation.dart';

@XmlSerializable()
class TestClass {
  @XmlElement()
  String? fooBar;

  TestClass({this.fooBar});
}
