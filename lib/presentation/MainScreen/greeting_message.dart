String greetingMessage() {
  var timeNow = DateTime.now().hour;
  if (timeNow <= 12) {
    return 'Good morning, username';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Good afternoon, username';
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return 'Good evening, username';
  } else {
    return 'Good night, username';
  }
}