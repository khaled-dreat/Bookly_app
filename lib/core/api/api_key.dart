class ApiKey {
  // * End Point
  static const String freeProgrammingBook =
      "volumes?Filtering=free-ebooks&Sorting=newest&q=action";
  static const String freeNewsProgrammingBook =
      "volumes?Filtering=free-ebooks&Sorting=newest&q=action";
  static String startIndex({required int pageNumber}) {
    return "&startIndex=${pageNumber * 10}";
  }

  // * HTML
  static const String items = "items";
}
