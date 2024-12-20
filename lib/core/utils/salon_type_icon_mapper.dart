class SalonTypeIconMapper {
  /// Maps salon type IDs to corresponding icon paths.
  static const Map<int, String> _iconMap = {
    1: 'assets/icons/icon_women.svg', // Women
    2: 'assets/icons/icon_men.svg', // Men
    3: 'assets/icons/icon_kids.svg', // Kids
    4: 'assets/icons/icon_both.svg', // Both
  };

  /// Fetch the icon path based on the type ID.
  static String getIconPath(int typeId) {
    return _iconMap[typeId] ?? 'assets/icons/icon_default.svg';
  }
}
