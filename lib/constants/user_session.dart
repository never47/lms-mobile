class UserSession {
  static String? _sessionId;
  static String? _name;

  void setUser(String? sessionId, String? name) {
    _sessionId = sessionId;
    _name = name;
  }

  Map<String, String> get sessionId {
    return {'.AspNetCore.Identity.Application': _sessionId!};
  }

  String get userName {
    return _name!;
  }
}
