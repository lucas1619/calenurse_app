// Enum for Shift in English
enum ShiftEnum {
  day,
  evening,
  night,
  free,
}

// Create a function to translate English enum values to Spanish
String translateShiftToSpanish(ShiftEnum shift) {
  switch (shift) {
    case ShiftEnum.day:
      return 'Día';
    case ShiftEnum.evening:
      return 'Tarde';
    case ShiftEnum.night:
      return 'Noche';
    case ShiftEnum.free:
      return 'Libre';
    default:
      return ''; // Handle other cases if necessary
  }
}

extension ShiftEnumExtension on String {
  ShiftEnum toShiftEnum() {
    switch (this) {
      case 'day':
        return ShiftEnum.day;
      case 'evening':
        return ShiftEnum.evening;
      case 'night':
        return ShiftEnum.night;
      case 'free':
        return ShiftEnum.free;
      default:
        throw Exception('Invalid shift type');
    }
  }
}
