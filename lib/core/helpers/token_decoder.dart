import 'dart:convert';

/// Decodes a base64-encoded string and returns the decoded JSON as a Map.
/// If the string is invalid, it returns an error message.
///
/// [base64String] is the base64-encoded string you want to decode.
///
/// Returns a Map containing the decoded JSON if successful, or a Map with an error message.
Map<String, dynamic> decodeBase64String(String base64String) {
  try {
    // Decode the base64 string
    final decodedBytes = base64Url.decode(base64String);

    // Decode the JSON
    final decodedJson =
        json.decode(utf8.decode(decodedBytes)) as Map<String, dynamic>;

    return decodedJson;
  } catch (e) {
    // Return an error message if decoding fails
    return {'error': 'Error decoding base64 string: $e'};
  }
}

/// Decodes a JWT and returns the payload as a Map.
/// If the token is invalid, it returns an error message.
///
/// [token] is the JWT string you want to decode.
///
/// Returns a Map containing the payload if successful, or a Map with an error message.
Map<String, dynamic> decodeJWT(String token) {
  try {
    // Split the JWT into its three parts
    final parts = token.split('.');

    if (parts.length != 3) {
      throw const FormatException('Invalid JWT');
    }

    // Decode the payload (the second part of the token)
    final payload = decodeBase64String(parts[1]);

    return payload;
  } catch (e) {
    // Return an error message if decoding fails
    return {'error': 'Error decoding JWT: $e'};
  }
}
