extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    String modifiedString = replaceAll('special-attack', 'sp atk')
        .replaceAll('special-defense', 'sp def');
    return '${modifiedString[0].toUpperCase()}${modifiedString.substring(1)}';
  }

  String toTitleCase() {
    return split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
