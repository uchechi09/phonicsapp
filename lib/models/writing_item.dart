
enum WritingType { character, word }
class WritingItem {
  final String character;
  final String sound;
  final WritingType type;

  WritingItem({required this.character, required this.sound,  this.type = WritingType.character});
}