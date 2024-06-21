String modifyImageUrl(String url, String newSize) {
  // Split the URL at the '=' sign to separate the base URL and the size parameter
  List<String> parts = url.split('=');
  // Replace the size parameter with the new size
  parts[1] = '$newSize-c';
  // Join the parts back together to form the new URL
  return parts.join('=');
}
