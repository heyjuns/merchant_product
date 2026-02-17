extension NumExtensions on num {
  /// Add thousand separators using regex
  String get separator {
    final str = toInt().toString();
    // Insert comma every 3 digits from the right
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return str.replaceAllMapped(reg, (match) => ',');
  }

  /// Currency format with Rp prefix
  String get currency => 'Rp$separator';
}
