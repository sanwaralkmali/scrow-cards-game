class CardG {
  final int rank;
  final bool isSpecial;
  final String imagePath;
  bool isFaceUp = true;
  final String backPath = 'assets/cards/back.png';

  CardG({required this.rank, required this.isSpecial, required this.imagePath});
}
