class UserLevelUtils {
  static String getLevel(int points) {
    if (points >= 0 && points <= 49999) {
      return 'Classic';
    } else if (points >= 50000 && points <= 149999) {
      return 'Silver';
    } else if (points >= 150000 && points <= 299999) {
      return 'Gold';
    } else if (points >= 300000) {
      return 'Platinum';
    } else {
      return 'Badge';
    }
  }
}