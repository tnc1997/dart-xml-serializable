import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeElementAnnotation extends Fake implements ElementAnnotation {
  @override
  final Element? element;

  final DartObject? _value;

  FakeElementAnnotation({
    this.element,
    DartObject? value,
  }) : _value = value;

  @override
  DartObject? computeConstantValue() => _value;
}
