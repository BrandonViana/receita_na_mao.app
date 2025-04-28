import 'dart:ui';

class AppColors {
  AppColors._();

  static const Color babyBlue1 = Color(0xFF89CFF0);
  static const Color babyBlue2 = Color(0xFF0396c7);
  static const Color blueBorder = Color(0xFF04B3FB);
  static const List<Color> babyblueGradient = [
    Color(0xFF04B3FB),
    Color(0xFF1FB8FA),
    Color(0xFF36BCF9),
  ];
  static const Color white = Color(0xFFFFFFFF);
  static const Color navyBlue = Color(0xFF001969);
  static const Color grey = Color(0xFF444444);
  static const Color black = Color(0xFF000000);
  static const Color darkBlue = Color(0xFF00008B);
  static const Color orange = Color(0xFFFF9800);

  static const List<Color> orangeGradient = [
    Color(
      0xFFFFA726,
    ), // um laranja mais equilibrado, menos claro que o 0xFFFFB74D
    Color(0xFFFF9800), // mantém o original do meio
    Color(0xFFFB8C00), // um tom levemente mais escuro, mas ainda similar
  ];

  static const List<Color> buttomGradient = [
    Color(0xFFFDFDFD),
    Color(0xFFFDFDFC),
  ];

  static const List<Color> greyGradient = [
    Color(0xFF929A9E),
    Color(0xFF848A8B),
  ];
}
