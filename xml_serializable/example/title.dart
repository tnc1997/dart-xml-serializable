import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'title.g.dart';

@annotation.XmlRootElement(name: 'title')
@annotation.XmlSerializable()
class Title with TitleXmlSerializableMixin {
  @annotation.XmlAttribute(name: 'lang')
  String? lang;

  @annotation.XmlText()
  String? text;

  Title({
    this.lang,
    this.text,
  });

  factory Title.fromXmlElement(XmlElement element) =>
      _$TitleFromXmlElement(element);

  @override
  String toString() {
    return 'Title{lang: $lang, text: $text}';
  }
}
