import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'xml_annotation_example.g.dart';

void main() {
  final document = XmlDocument.parse(
    '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="English">XML Pocket Reference</title>
        <author>Simon St. Laurent</author>
        <author>Michael James Fitzgerald</author>
        <price></price>
      </book>
      <book>
        <title lang="English">HTML and XHTML Pocket Reference</title>
        <author>Jennifer Niederst Robbins</author>
        <price></price>
      </book>
    </bookshelf>''',
  );

  final bookshelf = Bookshelf.fromXmlElement(document.rootElement);
  print(bookshelf);

  final element = bookshelf.toXmlElement();
  print(element);
}

@annotation.XmlRootElement(name: 'book')
@annotation.XmlSerializable()
class Book {
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

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlRootElement(name: 'bookshelf')
@annotation.XmlSerializable()
class Bookshelf {
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

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookshelfToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookshelfToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookshelfToXmlElement(
        this,
        namespaces: namespaces,
      );
}

@annotation.XmlEnum()
enum Language {
  @annotation.XmlValue('Mandarin')
  mandarin,
  @annotation.XmlValue('Spanish')
  spanish,
  @annotation.XmlValue('English')
  english,
  @annotation.XmlValue('Hindi')
  hindi,
  @annotation.XmlValue('Bengali')
  bengali,
}

@annotation.XmlRootElement(name: 'title')
@annotation.XmlSerializable()
class Title {
  @annotation.XmlAttribute(name: 'lang')
  Language? language;

  @annotation.XmlText()
  String? text;

  Title({
    this.language,
    this.text,
  });

  factory Title.fromXmlElement(XmlElement element) =>
      _$TitleFromXmlElement(element);

  @override
  String toString() {
    return 'Title{language: $language, text: $text}';
  }

  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleBuildXmlChildren(
        this,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleBuildXmlElement(
        this,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$TitleToXmlAttributes(
        this,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$TitleToXmlChildren(
        this,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$TitleToXmlElement(
        this,
        namespaces: namespaces,
      );
}
