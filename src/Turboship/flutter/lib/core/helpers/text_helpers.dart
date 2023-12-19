String capitalize(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

cleanTotal(total) {
  return total?.replaceAll(',', '').replaceAll('.', '');
}

String removeSecondToLastChar(String input) {
  if (input.length >= 2) {
    List<String> charList = input.split('');
    charList.removeAt(charList.length - 2);
    return charList.join('');
  } else {
    return input;
  }
}
