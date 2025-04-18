import 'package:flutter/material.dart';

Color getRankColor(String? rank) {
  switch (rank?.toLowerCase()) {
    case 'newbie':
      return Colors.grey;
    case 'pupil':
      return Colors.green;
    case 'specialist':
      return Colors.cyan;
    case 'expert':
      return Colors.blue;
    case 'candidate master':
      return Colors.purple;
    case 'master':
    case 'international master':
      return Colors.orange;
    case 'grandmaster':
    case 'international grandmaster':
    case 'legendary grandmaster':
      return Colors.red;
    default:
      return Colors.black;
  }
}
