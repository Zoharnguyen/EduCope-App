enum CourseRegisterStatus {
  PENDING,
  ACCEPT,
  REJECT,
}

class CourseRegisterStatusHelper {
  static CourseRegisterStatus? convertStringToEnum(String value) {
    return _$enumDecodeNullable(_$CourseRegisterStatusEnumMap, value);
  }

  static K? _$enumDecodeNullable<K, V>(
    Map<K, V> enumValues,
    dynamic source, {
    K? unknownValue,
  }) {
    if (source == null) {
      return null;
    }
    return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
  }

  static const _$CourseRegisterStatusEnumMap = {
    CourseRegisterStatus.PENDING: 'PENDING',
    CourseRegisterStatus.ACCEPT: 'ACCEPT',
    CourseRegisterStatus.REJECT: 'REJECT',
  };

  static K _$enumDecode<K, V>(
    Map<K, V> enumValues,
    Object? source, {
    K? unknownValue,
  }) {
    if (source == null) {
      throw ArgumentError(
        'A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}',
      );
    }

    return enumValues.entries.singleWhere(
      (e) => e.value == source,
      orElse: () {
        if (unknownValue == null) {
          throw ArgumentError(
            '`$source` is not one of the supported values: '
            '${enumValues.values.join(', ')}',
          );
        }
        return MapEntry(unknownValue, enumValues.values.first);
      },
    ).key;
  }
}
