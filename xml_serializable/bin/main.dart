import '../example/xml_serializable_example.dart' show Book;

void main(List<String> arguments) {
  // This works as expected.
  final book1 = Book();
  book1.toXmlElement();

  // This works as expected.
  dynamic book2 = Book();
  book2.toXmlElement();
}
