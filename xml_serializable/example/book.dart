import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

import 'title.dart';

part 'book.g.dart';

@annotation.XmlRootElement(name: 'book')
@annotation.XmlSerializable()
class Book with BookXmlSerializableMixin {
  @annotation.XmlElement(name: 'title')
  Title? title;

  @annotation.XmlElement(name: 'author')
  List<String>? authors;

  @annotation.XmlElement(name: 'price', isSelfClosing: false)
  String? price;

  Book({
    this.title,
    this.authors,
    this.price,
  });

  factory Book.fromXmlElement(XmlElement element) =>
      _$BookFromXmlElement(element);

  @override
  String toString() {
    return 'Book{title: $title, authors: $authors, price: $price}';
  }
}
