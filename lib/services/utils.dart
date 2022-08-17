class ApiUri {
  // This is our base uri
  static const String baseurl = "https://disease.sh/v3/covid-19/all";

  // Fetch world coivd data
  static const String worldDataApi = "https://disease.sh/v3/covid-19/countries";
  static const String countriesList = '${baseurl}countries';
}
