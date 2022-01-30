import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

import 'book.dart';

part 'bookshelf.g.dart';

@annotation.XmlRootElement(name: 'bookshelf')
@annotation.XmlSerializable()
class Bookshelf with BookshelfXmlSerializableMixin {
  @annotation.XmlElement(name: 'book')
  List<Book>? books;

  @annotation.XmlElement(name: 'price', includeIfNull: false)
  String? price;

  Bookshelf({
    this.books,
    this.price,
  });

  factory Bookshelf.fromXmlElement(XmlElement element) =>
      _$BookshelfFromXmlElement(element);

  @override
  String toString() {
    return 'Bookshelf{books: $books, price: $price}';
  }
}
