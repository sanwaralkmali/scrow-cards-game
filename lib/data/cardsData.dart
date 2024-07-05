class Card {
  final int rank; // 1 to 10 or a special card identifier
  final bool isSpecial;
  final String imagePath; // Asset path to the card image

  Card({required this.rank, required this.isSpecial, required this.imagePath});
}
