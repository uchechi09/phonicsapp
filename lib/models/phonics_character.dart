import 'package:phonicsapp/models/sounding_item.dart';
import 'package:phonicsapp/models/writing_item.dart';

class PhonicsCharacter {
  final String character;
  final String story;
  final String actionText;
  final String actionImage;
  final List<SoundingItem> soundingItems;
  final int correctSoundingItemIndex;
  final List<WritingItem> listOfWriting;
  final String songText;
  final String songAudio;
  final List<PhonicsCharacter> blending;

  PhonicsCharacter({
    required this.character,
    required this.story,
    required this.actionText,
    required this.actionImage,
    required this.soundingItems,
    required this.correctSoundingItemIndex,
    required this.listOfWriting,
    required this.songText,
    required this.songAudio,
    this.blending = const [],
  });
}
