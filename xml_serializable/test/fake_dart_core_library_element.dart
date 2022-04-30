import 'package:analyzer/dart/element/element.dart';
import 'package:mockito/mockito.dart';

class FakeDartCoreLibraryElement extends Fake implements LibraryElement {
  @override
  final isDartCore = true;

  @override
  final name = 'dart.core';
}
