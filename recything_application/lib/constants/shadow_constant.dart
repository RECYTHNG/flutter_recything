import 'package:flutter/material.dart';

class ShadowConstant {
  static List<BoxShadow> shadowXs = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.05),
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.06),
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.10),
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.06),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.10),
      offset: const Offset(0, 4),
      blurRadius: 8,
      spreadRadius: -2,
    ),
  ];

  static List<BoxShadow> shadowLg = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.03),
      offset: const Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.08),
      offset: const Offset(0, 12),
      blurRadius: 16,
      spreadRadius: -4,
    ),
  ];

  static List<BoxShadow> shadowXl = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.03),
      offset: const Offset(0, 8),
      blurRadius: 8,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.08),
      offset: const Offset(0, 20),
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];

  static List<BoxShadow> shadow2Xl = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.18),
      offset: const Offset(0, 24),
      blurRadius: 48,
      spreadRadius: -12,
    ),
  ];

  static List<BoxShadow> shadow3Xl = [
    BoxShadow(
      color: const Color(0xff101828).withOpacity(0.25),
      offset: const Offset(0, 32),
      blurRadius: 64,
      spreadRadius: -12,
    ),
  ];
}
