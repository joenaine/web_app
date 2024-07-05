import 'package:flutter/material.dart';

String extractSentenceAfterWord(String input, String targetWord) {
  // Split the input string into sentences
  List<String> sentences = input.split('.');

  // Find the index of the target word in the sentences
  int targetIndex = sentences.indexWhere(
      (sentence) => sentence.toLowerCase().contains(targetWord.toLowerCase()));

  // If the target word is found and there is a sentence after it
  if (targetIndex != -1 && targetIndex < sentences.length - 1) {
    // Extract the sentence after the target word
    String extractedSentence = sentences[targetIndex + 1].trim();

    // Add the period at the end of the sentence
    extractedSentence += '.';

    return extractedSentence;
  } else {
    // If the target word is not found or there is no sentence after it
    return 'Sentence not found after the specified word.';
  }
}

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
