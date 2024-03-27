// ignore_for_file: public_member_api_docs, sort_constructors_first

class ResponseModel {
  // This model will be used to parse response received from openAI API call
  final String id;
  final String object;
  final String model;
  final String resultJson;

  // Constructor for the model
  ResponseModel({
    required this.id,
    required this.object,
    required this.model,
    required this.resultJson,
  });

  // This method will return this model's object from json passed into it
  static ResponseModel fromJson(json) => ResponseModel(
        id: json['id'],
        object: json['object'],
        model: json['model'],
        resultJson: json['choices'][0]['message']['content'],
      );
}
