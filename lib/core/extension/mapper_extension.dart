import 'package:app/core/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Mapper.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullMapList on List<Map<String, dynamic>>? {
  List<Map<String, dynamic>> orMapListEmpty() {
    if (this == null) {
      return Mapper.listEmptyMap;
    } else {
      return this!;
    }
  }
}

extension NonNullStringList on List<String>? {
  List<String> orListStringEmpty() {
    if (this == null) {
      return Mapper.listStringEmpty;
    } else {
      return this!;
    }
  }
}

extension NonNullList<T> on List<T>? {
  List<T> orListEmpty() {
    if (this == null) {
      return <T>[];
    } else {
      return this!;
    }
  }
}

// extension on Integer
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Mapper.zero;
    } else {
      return this!;
    }
  }
}

// extension on Double
extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return Mapper.zeroDouble;
    } else {
      return this!;
    }
  }
}

// extension on DateTime
extension NonNullDateTime on DateTime? {
  DateTime orZeroDateTime() {
    if (this == null) {
      return Mapper.noDateChosen;
    } else {
      return this!;
    }
  }
}

// extension on Bool
extension NonNullBool on bool? {
  bool orNullBool() {
    if (this == null) {
      return Mapper.nullBool;
    } else {
      return this!;
    }
  }
}

// Utils
extension DynamicListToStringList on dynamic {
  List<String> dynamicToListString() {
    if (this == null) {
      return [];
    } else {
      return List<String>.from(this!);
    }
  }
}
