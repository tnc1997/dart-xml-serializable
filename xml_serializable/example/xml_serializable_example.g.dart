// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xml_serializable_example.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$BookBuildXmlChildren(
  Book instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  final title = instance.title;
  final authors = instance.authors;
  final price = instance.price;

  builder.element(
    'title',
    isSelfClosing: true,
    nest: () {
      if (title != null) {
        title.buildXmlChildren(
          builder,
          namespaces: namespaces,
        );
      }
    },
  );
  if (authors != null) {
    for (final value in authors) {
      builder.element(
        'author',
        isSelfClosing: true,
        nest: () {
          builder.text(
            value,
          );
        },
      );
    }
  }
  builder.element(
    'price',
    isSelfClosing: false,
    nest: () {
      if (price != null) {
        builder.text(
          price,
        );
      }
    },
  );
}

void _$BookBuildXmlElement(
  Book instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'book',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Book _$BookFromXmlElement(XmlElement element) {
  final title = element.getElement(
    'title',
  );
  final authors = element.findElementsText(
    'author',
  );
  final price = element.getElementText(
    'price',
  );

  return Book(
    title: title != null ? Title.fromXmlElement(title) : null,
    authors: authors.toList(),
    price: price,
  );
}

List<XmlAttribute> _$BookToXmlAttributes(
  Book instance, {
  Map<String, String?> namespaces = const {},
}) {
  return [];
}

List<XmlNode> _$BookToXmlChildren(
  Book instance, {
  Map<String, String?> namespaces = const {},
}) {
  final title = instance.title;
  final authors = instance.authors;
  final price = instance.price;

  return [
    XmlElement(
      XmlName(
        'title',
      ),
      [
        if (title != null)
          ...title.toXmlAttributes(
            namespaces: namespaces,
          ),
      ],
      [
        if (title != null)
          ...title.toXmlChildren(
            namespaces: namespaces,
          ),
      ],
      true,
    ),
    if (authors != null)
      for (final value in authors)
        XmlElement(
          XmlName(
            'author',
          ),
          [],
          [
            XmlText(
              value,
            ),
          ],
          true,
        ),
    XmlElement(
      XmlName(
        'price',
      ),
      [],
      [
        if (price != null)
          XmlText(
            price,
          ),
      ],
      false,
    ),
  ];
}

XmlElement _$BookToXmlElement(
  Book instance, {
  Map<String, String?> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'book',
    ),
    [
      ...namespaces.toXmlAttributes(),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
    true,
  );
}

mixin _$BookXmlSerializableMixin {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookBuildXmlChildren(
        this as Book,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookBuildXmlElement(
        this as Book,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookToXmlAttributes(
        this as Book,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookToXmlChildren(
        this as Book,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookToXmlElement(
        this as Book,
        namespaces: namespaces,
      );
}

void _$BookshelfBuildXmlChildren(
  Bookshelf instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  final books = instance.books;
  final price = instance.price;

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

void _$BookshelfBuildXmlElement(
  Bookshelf instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'bookshelf',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

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

List<XmlAttribute> _$BookshelfToXmlAttributes(
  Bookshelf instance, {
  Map<String, String?> namespaces = const {},
}) {
  return [];
}

List<XmlNode> _$BookshelfToXmlChildren(
  Bookshelf instance, {
  Map<String, String?> namespaces = const {},
}) {
  final books = instance.books;
  final price = instance.price;

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

XmlElement _$BookshelfToXmlElement(
  Bookshelf instance, {
  Map<String, String?> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'bookshelf',
    ),
    [
      ...namespaces.toXmlAttributes(),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
    true,
  );
}

mixin _$BookshelfXmlSerializableMixin {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfBuildXmlChildren(
        this as Bookshelf,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$BookshelfBuildXmlElement(
        this as Bookshelf,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookshelfToXmlAttributes(
        this as Bookshelf,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookshelfToXmlChildren(
        this as Bookshelf,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$BookshelfToXmlElement(
        this as Bookshelf,
        namespaces: namespaces,
      );
}

void _$TitleBuildXmlChildren(
  Title instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  final lang = instance.lang;
  final text = instance.text;

  if (lang != null) {
    builder.attribute(
      'lang',
      lang,
    );
  }
  if (text != null) {
    builder.text(
      text,
    );
  }
}

void _$TitleBuildXmlElement(
  Title instance,
  XmlBuilder builder, {
  Map<String, String> namespaces = const {},
}) {
  builder.element(
    'title',
    namespaces: namespaces,
    nest: () {
      instance.buildXmlChildren(
        builder,
        namespaces: namespaces,
      );
    },
  );
}

Title _$TitleFromXmlElement(XmlElement element) {
  final lang = element.getAttribute(
    'lang',
  );
  final text = element.getText();

  return Title(
    lang: lang,
    text: text,
  );
}

List<XmlAttribute> _$TitleToXmlAttributes(
  Title instance, {
  Map<String, String?> namespaces = const {},
}) {
  final lang = instance.lang;

  return [
    if (lang != null)
      XmlAttribute(
        XmlName(
          'lang',
        ),
        lang,
      ),
  ];
}

List<XmlNode> _$TitleToXmlChildren(
  Title instance, {
  Map<String, String?> namespaces = const {},
}) {
  final text = instance.text;

  return [
    if (text != null)
      XmlText(
        text,
      ),
  ];
}

XmlElement _$TitleToXmlElement(
  Title instance, {
  Map<String, String?> namespaces = const {},
}) {
  return XmlElement(
    XmlName(
      'title',
    ),
    [
      ...namespaces.toXmlAttributes(),
      ...instance.toXmlAttributes(
        namespaces: namespaces,
      ),
    ],
    instance.toXmlChildren(
      namespaces: namespaces,
    ),
    true,
  );
}

mixin _$TitleXmlSerializableMixin {
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleBuildXmlChildren(
        this as Title,
        builder,
        namespaces: namespaces,
      );

  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) =>
      _$TitleBuildXmlElement(
        this as Title,
        builder,
        namespaces: namespaces,
      );

  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) =>
      _$TitleToXmlAttributes(
        this as Title,
        namespaces: namespaces,
      );

  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) =>
      _$TitleToXmlChildren(
        this as Title,
        namespaces: namespaces,
      );

  XmlElement toXmlElement({
    Map<String, String?> namespaces = const {},
  }) =>
      _$TitleToXmlElement(
        this as Title,
        namespaces: namespaces,
      );
}
