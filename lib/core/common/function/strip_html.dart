String stripHtml(String s) {
  if (s.isEmpty) {
    return s;
  }
  var regex = RegExp(r'<[^>]*>');
  return s.replaceAll(regex, '');
}