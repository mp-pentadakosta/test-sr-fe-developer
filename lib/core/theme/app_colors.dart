import 'package:flutter/material.dart';

enum ElevationType {
  level0('level0'),
  level1('level1'),
  level2('level2'),
  level3('level3'),
  level4('level4'),
  level5('level5'),
  level6('level6'),
  level7('level7'),
  level8('level8'),
  level9('level9'),
  level10('level10'),
  level11('level11'),
  level12('level12'),
  level13('level13'),
  level14('level14'),
  level15('level15'),
  ;

  final String value;

  const ElevationType(this.value);
}

class AppColors {
  static const Color primary = Color(0xFF4EC8D4);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF4EC8D4);
  static const Color onPrimaryContainer = Color(0xFF003438);
  static const Color secondary = Color(0xFF4EC8D4);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF4EC8D4);
  static const Color onSecondaryContainer = Color(0xFF003438);
  static const Color tertiary = Color(0xFF4EC8D4);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF4EC8D4);
  static const Color onTertiaryContainer = Color(0xFF003438);
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFD6D6);
  static const Color onErrorContainer = Color(0xFF410002);
  static const Color background = Color(0xFFF5F5F5);
  static const Color onBackground = Color(0xFF1A1C18);
  static const Color surface = Color(0xFFFDFDF5);
  static const Color onSurface = Color(0xFF1A1C18);
  static const Color surfaceVariant = Color(0xFFE0E4D6);
  static const Color onSurfaceVariant = Color(0xFF44483E);
  static const Color outline = Color(0xFF74797D);
  static const Color outlineVariant = Color(0xFFC4C8BA);
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);
  static const Color inverseSurface = Color(0xFF2F3130);
  static const Color inverseOnSurface = Color(0xFFF1F1EA);
  static const Color inversePrimary = Color(0xFF4EC8D4);

  static const Map<String, Color> _elevation = {
    'level0': Colors.transparent,
    'level1': Color(0xFFFFFFFF), // Putih
    'level2': Color(0xFFF0FCFC), // Biru sangat terang (Hampir putih)
    'level3': Color(0xFFDAF6F7), // Biru lebih terang
    'level4': Color(0xFFBFEFF1), // Biru pastel terang
    'level5': Color(0xFFA3E7EB), // Biru pastel
    'level6': Color(0xFF87DFE5), // Biru lebih soft
    'level7': Color(0xFF6DD8DF), // Biru medium terang
    'level8':
        Color(0xFF54D1DA), // Warna utama `0xFF4EC8D4` sedikit lebih terang
    'level9': Color(0xFF4EC8D4), // Warna utama
    'level10': Color(0xFF47B6C0), // Biru medium gelap
    'level11': Color(0xFF3FA3AD), // Biru lebih tua
    'level12': Color(0xFF398F99), // Biru lebih gelap
    'level13': Color(0xFF327C86), // Biru lebih dalam
    'level14': Color(0xFF2C6973), // Biru keabu-abuan
    'level15': Color(0xFF25575F), // Biru tua mendekati hitam
  };

  static Color elevationLevel(ElevationType level) {
    return _elevation[level.value] ?? Colors.transparent;
  }

  static const Color surfaceDisabled = Color(0xFF1A1C18);
  static const Color onSurfaceDisabled = Color(0x3D1A1C18);
  static const Color backdrop = Color(0x992D3228);
  static const Color star = Color(0xFFf1c40f);
  static const Color orange = Color(0xFFF4642C);

  static const Color success =
      Color(0xFF2ECC71); // Warna hijau yang sesuai dengan primary
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFA8E6CF);
  static const Color onSuccessContainer = Color(0xFF003818);
}
