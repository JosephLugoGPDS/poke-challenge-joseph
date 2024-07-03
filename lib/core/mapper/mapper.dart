abstract class Mapper {
  static const String empty = '';
  static const int zero = 0;
  static const bool nullBool = false;
  static const double zeroDouble = 0.00;
  static DateTime noDateChosen = DateTime(0, 0, 0);
  static List listEmpty = [];
  static List<String> listStringEmpty = [];
  static List<Map<String, dynamic>> listEmptyMap = [];
  static List<T> listObjectEmpty<T>() => <T>[];
}
