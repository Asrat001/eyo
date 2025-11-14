class OnboardingData {
  String? language;
  String? bibleVersion;
  List<String> goals;

  OnboardingData({this.language, this.bibleVersion,  this.goals=const []});

  OnboardingData copyWith({String? language, List<String>? goals, String? bibleVersion}) {
    return OnboardingData(
      language: language ?? this.language,
      goals: goals ?? this.goals,
      bibleVersion: bibleVersion ?? this.bibleVersion,
    );
  }
}
