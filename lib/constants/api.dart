abstract class Api {
  static const String _server = "https://uni.tsu.ge/";
  static const String _api = "${_server}api/";

  static const String session = "${_api}Auth/Login";
  static const String studenCard = "${_api}Card/StudentProfile";
}
