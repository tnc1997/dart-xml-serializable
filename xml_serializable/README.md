# XML Serializable

[![Pub Version](https://img.shields.io/pub/v/xml_serializable)](https://pub.dev/packages/xml_serializable)

Provides [build] builders for handling XML.

The builders generate code when they find members annotated with classes defined in [xml_annotation].

## Usage

Given a library `xml_serializable_example.dart` with a `Book`, `Bookshelf` and `Title` class annotated with `@XmlSerializable()`:

```dart
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

enum WoodType {
  @annotation.XmlValue('balsa-wood')
  balsaWood,
  ebony,
  @annotation.XmlValue('california-redwood')
  californiaRedwood,
  amber,
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
  @annotation.XmlAttribute(name: 'wood-type')
  WoodType? woodType;

  @annotation.XmlElement(name: 'book')
  List<Book>? books;

  @annotation.XmlElement(name: 'price', includeIfNull: false)
  String? price;

  Bookshelf({
    this.books,
    this.woodType,
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

@annotation.XmlRootElement(name: 'title')
@annotation.XmlSerializable()
class Title {
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
```

Building creates the corresponding part `xml_serializable_example.g.dart`:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xml_serializable_example.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$BookBuildXmlChildren(Book instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final title = instance.title;
  final titleSerialized = title;
  builder.element('title', nest: () {
    if (titleSerialized != null) {
      titleSerialized.buildXmlChildren(builder, namespaces: namespaces);
    }
  });
  final authors = instance.authors;
  final authorsSerialized = authors;
  if (authorsSerialized != null) {
    for (final value in authorsSerialized) {
      builder.element('author', nest: () {
        builder.text(value);
      });
    }
  }
  final price = instance.price;
  final priceSerialized = price;
  builder.element('price', isSelfClosing: false, nest: () {
    if (priceSerialized != null) {
      builder.text(priceSerialized);
    }
  });
}

void _$BookBuildXmlElement(Book instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('book', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Book _$BookFromXmlElement(XmlElement element) {
  final title = element.getElement('title');
  final authors = element
      .getElements('author')
      ?.map((e) => e.getText())
      .whereType<String>();
  final price = element.getElement('price')?.getText();
  return Book(
      title: title != null ? Title.fromXmlElement(title) : null,
      authors: authors?.toList(),
      price: price);
}

List<XmlAttribute> _$BookToXmlAttributes(Book instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$BookToXmlChildren(Book instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final title = instance.title;
  final titleSerialized = title;
  final titleConstructed = XmlElement(
      XmlName('title'),
      titleSerialized?.toXmlAttributes(namespaces: namespaces) ?? [],
      titleSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
  children.add(titleConstructed);
  final authors = instance.authors;
  final authorsSerialized = authors;
  final authorsConstructed = authorsSerialized
      ?.map((e) => XmlElement(XmlName('author'), [], [XmlText(e)]));
  if (authorsConstructed != null) {
    children.addAll(authorsConstructed);
  }
  final price = instance.price;
  final priceSerialized = price;
  final priceConstructed = XmlElement(XmlName('price'), [],
      priceSerialized != null ? [XmlText(priceSerialized)] : [], false);
  children.add(priceConstructed);
  return children;
}

XmlElement _$BookToXmlElement(Book instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('book'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$BookshelfBuildXmlChildren(Bookshelf instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final woodType = instance.woodType;
  final woodTypeSerialized = _$WoodTypeEnumMap[woodType];
  if (woodTypeSerialized != null) {
    builder.attribute('wood-type', woodTypeSerialized);
  }
  final books = instance.books;
  final booksSerialized = books;
  if (booksSerialized != null) {
    for (final value in booksSerialized) {
      builder.element('book', nest: () {
        value.buildXmlChildren(builder, namespaces: namespaces);
      });
    }
  }
  final price = instance.price;
  final priceSerialized = price;
  if (priceSerialized != null) {
    builder.element('price', nest: () {
      builder.text(priceSerialized);
    });
  }
}

void _$BookshelfBuildXmlElement(Bookshelf instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('bookshelf', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Bookshelf _$BookshelfFromXmlElement(XmlElement element) {
  final woodType = element.getAttribute('wood-type');
  final books = element.getElements('book');
  final price = element.getElement('price')?.getText();
  return Bookshelf(
      woodType: annotation.$enumDecodeNullable(_$WoodTypeEnumMap, woodType),
      books: books?.map((e) => Book.fromXmlElement(e)).toList(),
      price: price);
}

List<XmlAttribute> _$BookshelfToXmlAttributes(Bookshelf instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final woodType = instance.woodType;
  final woodTypeSerialized = _$WoodTypeEnumMap[woodType];
  final woodTypeConstructed = woodTypeSerialized != null
      ? XmlAttribute(XmlName('wood-type'), woodTypeSerialized)
      : null;
  if (woodTypeConstructed != null) {
    attributes.add(woodTypeConstructed);
  }
  return attributes;
}

List<XmlNode> _$BookshelfToXmlChildren(Bookshelf instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final books = instance.books;
  final booksSerialized = books;
  final booksConstructed = booksSerialized?.map((e) => XmlElement(
      XmlName('book'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  if (booksConstructed != null) {
    children.addAll(booksConstructed);
  }
  final price = instance.price;
  final priceSerialized = price;
  final priceConstructed = priceSerialized != null
      ? XmlElement(XmlName('price'), [], [XmlText(priceSerialized)])
      : null;
  if (priceConstructed != null) {
    children.add(priceConstructed);
  }
  return children;
}

XmlElement _$BookshelfToXmlElement(Bookshelf instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('bookshelf'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

const _$WoodTypeEnumMap = {
  WoodType.balsaWood: 'balsa-wood',
  WoodType.ebony: 'ebony',
  WoodType.californiaRedwood: 'california-redwood',
  WoodType.amber: 'amber',
};

void _$TitleBuildXmlChildren(Title instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final lang = instance.lang;
  final langSerialized = lang;
  if (langSerialized != null) {
    builder.attribute('lang', langSerialized);
  }
  final text = instance.text;
  final textSerialized = text;
  if (textSerialized != null) {
    builder.text(textSerialized);
  }
}

void _$TitleBuildXmlElement(Title instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('title', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Title _$TitleFromXmlElement(XmlElement element) {
  final lang = element.getAttribute('lang');
  final text = element.getText();
  return Title(lang: lang, text: text);
}

List<XmlAttribute> _$TitleToXmlAttributes(Title instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final lang = instance.lang;
  final langSerialized = lang;
  final langConstructed = langSerialized != null
      ? XmlAttribute(XmlName('lang'), langSerialized)
      : null;
  if (langConstructed != null) {
    attributes.add(langConstructed);
  }
  return attributes;
}

List<XmlNode> _$TitleToXmlChildren(Title instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final text = instance.text;
  final textSerialized = text;
  final textConstructed =
  textSerialized != null ? XmlText(textSerialized) : null;
  if (textConstructed != null) {
    children.add(textConstructed);
  }
  return children;
}

XmlElement _$TitleToXmlElement(Title instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('title'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[build]: https://github.com/dart-lang/build
[tracker]: https://github.com/tnc1997/dart-xml-serializable/issues
[xml_annotation]: https://pub.dev/packages/xml_annotation
