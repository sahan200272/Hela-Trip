import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelaColors {
  // Brand
  static const jungle = Color(0xFF549464);
  static const jungleTint = Color(0xFFE4EFD8);
  static const jungleSoft = Color(0xFF2F6B3D);

  // Editorial light surfaces
  static const bg = Color(0xFFFAF7F2);
  static const surf = Color(0xFFFFFFFF);
  static const surf2 = Color(0xFFF2EDE5);

  // Text
  static const text = Color(0xFF191510);
  static const text2 = Color(0xFF6B6359);
  static const text3 = Color(0xFF9C948A);

  // Hairline
  static final hair = const Color(0xFF191510).withValues(alpha: 0.10);

  // Region tints (for photo placeholder gradients)
  static const regionHill = Color(0xFF7FA672);
  static const regionSouth = Color(0xFF5F9EBD);
  static const regionCultural = Color(0xFFC58B2A);
  static const regionEast = Color(0xFF79C2B6);
  static const regionNorth = Color(0xFFB58CA8);

  static const photoFallback = Color(0xFFDCD3C5);
}

class HelaRadii {
  static const chip = 999.0;
  static const card = 10.0;
  static const hero = 12.0;
  static const pill = 999.0;
  static const image = 4.0;
}

class HelaSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 20.0;
  static const xxl = 28.0;
}

class HelaText {
  static TextStyle hero(BuildContext context) => GoogleFonts.instrumentSerif(
    fontSize: 52,
    height: 1.0,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.02 * 52,
    fontStyle: FontStyle.italic,
    color: HelaColors.text,
  );

  static TextStyle title(BuildContext context) => GoogleFonts.instrumentSerif(
    fontSize: 28,
    height: 1.05,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.01 * 28,
    color: HelaColors.text,
  );

  static TextStyle h2(BuildContext context) => GoogleFonts.instrumentSerif(
    fontSize: 22,
    height: 1.1,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.005 * 22,
    color: HelaColors.text,
  );

  static TextStyle h2Sized(double size) => GoogleFonts.instrumentSerif(
    fontSize: size,
    height: 1.1,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.005 * size,
    color: HelaColors.text,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 15,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.005 * 15,
    color: HelaColors.text,
  );

  static TextStyle label = GoogleFonts.inter(
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w500,
    color: HelaColors.text,
  );

  static TextStyle mono = GoogleFonts.jetBrainsMono(
    fontSize: 11,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: HelaColors.text3,
  );

  static TextStyle eyebrow = GoogleFonts.instrumentSerif(
    fontSize: 13,
    fontStyle: FontStyle.italic,
    color: HelaColors.text2,
  );
}

const usdToLkr = 300;

String formatPrice(int usd, String currency) {
  if (currency == 'LKR') {
    final lkr = (usd * usdToLkr / 100).round() * 100;
    return 'Rs ${_thousands(lkr)}';
  }
  return '\$${_thousands(usd)}';
}

String _thousands(int v) {
  final s = v.toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  return buf.toString();
}
