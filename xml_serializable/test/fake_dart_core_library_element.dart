import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

class FakeDartCoreLibraryElement extends Fake implements LibraryElement {
  @override
  final identifier = 'dart:core';

  @override
  final isDartCore = true;

  @override
  final name = 'dart.core';
}
