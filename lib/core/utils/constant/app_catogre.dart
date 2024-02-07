List<String> choicesSearchBy = [
  "Title",
  "Auther",
  "In Publisher",
  "SBN Number",
  "ICCN Number",
  "OCLC Number",
];

String? searchByChoicesValue(String key) {
  Map<String, String> choicesSearchBy2 = {
    "Title": "intitle",
    "Author": "inauthor",
    "In Publisher": "inpublisher",
    "SBN Number": "isbn",
    "ICCN Number": "lccn",
    "OCLC Number": "oclc",
  };
  String? value = choicesSearchBy2[key];
  return value;
}

List<String> choices = [
  "Mystery and Thrillers",
  "Biography and Memoirs",
  "Self Development",
  "Romance",
  "Fantasy",
  "History",
  "Philosophy",
  "Religion and Spirituality",
  "Art and Design",
  "Business and Finance",
  "Health and Wellness",
  "Science and Technology",
  "Politics and Government",
  "Sports and Recreation",
  "Children's Books",
];
