class Util {
  static String formatAccountNo(String raw) {
    if (raw.length != 9)
      return raw;
    else
      return raw.substring(0, 3) +
          "-" +
          raw.substring(3, 4) +
          "-" +
          raw.substring(4, 8) +
          "-" +
          raw.substring(8);
  }
}
