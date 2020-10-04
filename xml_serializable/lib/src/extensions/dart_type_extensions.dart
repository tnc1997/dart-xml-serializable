import 'package:analyzer/dart/element/type.dart';

extension DartTypeExtensions on DartType {
  bool get isDartCore =>
      isDartCoreBool ||
      isDartCoreDouble ||
      isDartCoreFunction ||
      isDartCoreInt ||
      isDartCoreIterable ||
      isDartCoreList ||
      isDartCoreMap ||
      isDartCoreNull ||
      isDartCoreNum ||
      isDartCoreObject ||
      isDartCoreSet ||
      isDartCoreString ||
      isDartCoreSymbol;
}
