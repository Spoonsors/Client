class Recipe {
  String rcp_SEQ;
  String rcp_NM;
  String att_FILE_NO_MAIN;
  String att_FILE_NO_MK;
  String rcp_PAT2;
  List<dynamic> manual;
  List<dynamic> manual_IMG;
  double info_ENG;
  double info_CAR;
  double info_PRO;
  double info_FAT;
  double info_NA;
  String rcp_PARTS_DTLS;

  Recipe(
      {required this.rcp_SEQ,
      required this.rcp_NM,
      required this.att_FILE_NO_MAIN,
      required this.att_FILE_NO_MK,
      required this.rcp_PAT2,
      required this.manual,
      required this.manual_IMG,
      required this.info_ENG,
      required this.info_CAR,
      required this.info_PRO,
      required this.info_FAT,
      required this.info_NA,
      required this.rcp_PARTS_DTLS});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        rcp_SEQ: json["rcp_SEQ"],
        rcp_NM: json["rcp_NM"],
        att_FILE_NO_MAIN: json["att_FILE_NO_MAIN"],
        att_FILE_NO_MK: json["att_FILE_NO_MK"],
        rcp_PAT2: json["rcp_PAT2"],
        manual: json["manual"],
        manual_IMG: json["manual_IMG"],
        info_ENG: json["info_ENG"],
        info_CAR: json["info_CAR"],
        info_PRO: json["info_PRO"],
        info_FAT: json["info_FAT"],
        info_NA: json["info_NA"],
        rcp_PARTS_DTLS: json["rcp_PARTS_DTLS"],
      );

  Map<String, dynamic> toJson() => {
        "rcp_SEQ": rcp_SEQ,
        "rcp_NM": rcp_NM,
        "att_FILE_NO_MAIN": att_FILE_NO_MAIN,
        "att_FILE_NO_MK": att_FILE_NO_MK,
        "rcp_PAT2": rcp_PAT2,
        "manual": manual,
        "manual_IMG": manual_IMG,
        "info_ENG": info_ENG,
        "info_CAR": info_CAR,
        "info_PRO": info_PRO,
        "info_FAT": info_FAT,
        "info_NA": info_NA,
        "rcp_PARTS_DTLS": rcp_PARTS_DTLS,
      };
}
