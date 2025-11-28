import 'package:flutter/material.dart';
import 'package:phonicsapp/models/phonics_character.dart';


class PhonicsGroup{
  final String id;
  final List<PhonicsCharacter> characters;
  final String? practiceLink;
  final String bgImage;
  final Color color;

  PhonicsGroup({
    required this.id,
    required this.characters,
    this.practiceLink,
    required this.bgImage,
    required this.color
  });
}