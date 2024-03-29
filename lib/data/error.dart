class Error {
  final String errorMessage;
  final List<dynamic> htmlAttributions;
  final List<dynamic> results;
  final String status;

  String getErrorMessage() {
    return errorMessage;
  }

  Error(
      {required this.errorMessage,
      required this.htmlAttributions,
      required this.results,
      required this.status});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      errorMessage: json['error_message'],
      htmlAttributions: json['html_attributions'],
      results: json['results'],
      status: json['status'],
    );
  }
}
