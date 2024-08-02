String getGreeting() {
  var hour = DateTime.now().hour;

  if (hour >= 0 && hour < 12) {
    return 'Bonjour,';
  } else if (hour >= 12 && hour < 17) {
    return 'Bonjour,';
  } else {
    return 'Bonsoir,';
  }
}