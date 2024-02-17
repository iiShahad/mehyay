import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final emergencyRecordRepositoryProvider =
    Provider<EmergencyRecordRepository>((ref) {
  return EmergencyRecordRepository();
});

class EmergencyRecordRepository {
  String generatePrompt(String text) {
    final prompt = '''
Based on the provided text data about a patient encountered by paramedics in arabic, generate a structured JSON object with english keys and classical arabic values that includes the following information: patient identification and demographics, emergency details, medical history, vital signs, treatments administered. Ensure all relevant data is accurately captured in the corresponding sections of the JSON structure
important response rules :

- collapse response in one line , remove space and new lines

common rules:

- don't extra description
- fill only requested fields
- all values has to be the same language of the provided text
- values has to be in classical arabic

sample response

{
"patient": {
"id": “”,
"name": ",
"age": ,
"gender": "",
},
"incident_type": "",
"initial_assessment": ""
},
"vital_signs": {
"time_recorded": "",
"blood_pressure": "",
"heart_rate": ,
"respiratory_rate": ,
"oxygen_saturation": ,
"temperature":
},
"treatment_administered": {
"given_medications": [
{
"medication": "",
"dosage": "",
"time": ""
}
],
"notes": ""
},
}

text: $text
''';
    return prompt;
  }

  Future<void> generateContent(String text) async {
    final apiKey = dotenv.env['API_KEY'];
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey!);
    final content = [Content.text(generatePrompt(text))];
    final response = await model.generateContent(content);
    print("response");
    print(response.text);
  }
}
