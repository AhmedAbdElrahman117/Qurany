class AzkarModel {
  final String zekr;
  final String count;

  const AzkarModel({required this.zekr, required this.count});

  factory AzkarModel.fromMap(Map zekr) {
    return AzkarModel(zekr: zekr['zekr'], count: zekr['count'].toString());
  }
}
