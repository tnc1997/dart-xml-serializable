import '../example/xml_serializable_example.dart';

void main(List<String> arguments) {
  // This works as expected.
  final book = Book();
  book.toXmlElement();

  // This fails with an exception.
  // dynamic book = Book();
  // book.toXmlElement();
}
