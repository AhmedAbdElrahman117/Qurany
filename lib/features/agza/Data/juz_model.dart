class JuzModel {
  final int surahNumber;
  final int from;
  final int to;

  JuzModel({required this.surahNumber, required this.from, required this.to});

  factory JuzModel.fromMap(Map<int, List<int>> surahs, int i) {
    return JuzModel(
      surahNumber: surahs.keys.elementAt(i),
      from: surahs.values.elementAt(i).elementAt(0),
      to: surahs.values.elementAt(i).elementAt(1),
    );
  }
}
