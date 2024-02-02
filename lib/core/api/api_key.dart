class ApiKey {
  // * End Point
  static const String freeProgrammingBook =
      "volumes?Filtering=free-ebooks&Sorting=newest&q=action";
  static const String freeNewsProgrammingBook =
      "volumes?Filtering=free-ebooks&Sorting=newest&q=action";
  static String startIndex({required int pageNumber}) {
    return "&startIndex=${pageNumber * 10}";
  }

  static String srhBy(String srhKey, String searchBy, int pageNumber) {
    return 'volumes?q=$searchBy:$srhKey&startIndex=${pageNumber * 10}';
  }

  static String srhCategory(String srhKey, String category, int pageNumber) {
    return 'volumes?subject:=category&q=$srhKey&startIndex=${pageNumber * 10}';
  }

  static String srhUrlBuilder(String srhKey, int pageNumber) {
    return "volumes?q=$srhKey&startIndex=${pageNumber * 10}";
  }

  // * HTML
  static const String items = "items";
}
