enum AppCategories {
  fictionAndNovels(title: "Fiction and Novels", image: ""),
  scienceFiction(title: "Science Fiction", image: ""),
  mysteryAndThrillers(title: "Mystery and Thrillers", image: ""),
  romance(title: "Romance", image: ""),
  fantasy(title: "Fantasy", image: ""),
  biographyAndMemoirs(title: "Biography and Memoirs", image: ""),
  selfHelpAndPersonalDevelopment(
      title: "Self-Help and Personal Development", image: ""),
  history(title: "History", image: ""),
  philosophy(title: "Philosophy", image: ""),
  religionAndSpirituality(title: "Religion and Spirituality", image: ""),
  artAndDesign(title: "Art and Design", image: ""),
  businessAndFinance(title: "Business and Finance", image: ""),
  travelAndAdventure(title: "Travel and Adventure", image: ""),
  healthAndWellness(title: "Health and Wellness", image: ""),
  scienceAndTechnology(title: "Science and Technology", image: ""),
  politicsAndGovernment(title: "Politics and Government", image: ""),
  sportsAndRecreation(title: "Sports and Recreation", image: ""),
  childrensBooks(title: "Children's Books", image: ""),
  youngAdult(title: "Young Adult", image: "");

  final String title;
  final String image;

  const AppCategories({required this.title, required this.image});
}
