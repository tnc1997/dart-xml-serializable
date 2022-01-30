// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookshelf.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

Bookshelf _$BookshelfFromXmlElement(XmlElement element) {
  final books = element.findElements(
    'book',
  );
  final price = element.getElementText(
    'price',
  );

  return Bookshelf(
    books: books.map((element) => Book.fromXmlElement(element)).toList(),
    price: price,
  );
}

mixin BookshelfXmlSerializableMixin {
  void buildXmlChildren(
      XmlBuilder builder, {
        Map<String, String> namespaces = const {},
      }) {
    final books = (this as Bookshelf).books;
    final price = (this as Bookshelf).price;

    if (books != null) {
      for (final value in books) {
        builder.element(
          'book',
          isSelfClosing: true,
          nest: () {
            value.buildXmlChildren(
              builder,
              namespaces: namespaces,
            );
          },
        );
      }
    }
    if (price != null) {
      builder.element(
        'price',
        isSelfClosing: true,
        nest: () {
          builder.text(
            price,
          );
        },
      );
    }
  }

  void buildXmlElement(
      XmlBuilder builder, {
        Map<String, String> namespaces = const {},
      }) {
    builder.element(
      'bookshelf',
      namespaces: namespaces,
      nest: () {
        buildXmlChildren(
          builder,
          namespaces: namespaces,
        );
      },
    );
  }

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    return [];
  }

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    final books = (this as Bookshelf).books;
    final price = (this as Bookshelf).price;

    return [
      if (books != null)
        for (final value in books)
          XmlElement(
            XmlName(
              'book',
            ),
            value.toXmlAttributes(
              namespaces: namespaces,
            ),
            value.toXmlChildren(
              namespaces: namespaces,
            ),
            true,
          ),
      if (price != null)
        XmlElement(
          XmlName(
            'price',
          ),
          [],
          [
            XmlText(
              price,
            ),
          ],
          true,
        ),
    ];
  }

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) {
    return XmlElement(
      XmlName(
        'bookshelf',
      ),
      [
        ...namespaces.toXmlAttributes(),
        ...toXmlAttributes(
          namespaces: namespaces,
        ),
      ],
      toXmlChildren(
        namespaces: namespaces,
      ),
      true,
    );
  }
}
