class ApiConfig {
  static String androidTestEndpoint = "http://10.0.2.2:8000/";
  static String physicalTestEndpoint = "http://192.168.100.1:8000/";

  static String connectionTest = "api/connection_test";
  static String login = "api/login";
  static String register = "api/register";
  static String logout = "api/logout";
  static String updateUsername = "api/update_name";
  static String initialAccountPic = "api/inital_account_picture";
  static String uploadProfilePic = "api/upload_picture";
  static String getProfilePic = "api/get_profile_pic";
  static String getReplicas = "api/get_replicas";
  static String addReplica = "api/add_replica";
  static String deleteReplica = "api/delete_replica";
  static String editReplica = "api/edit_replica";
  static String addGame = "api/create_game";
  static String getGames = "api/get_games";
  static String getValidGames = "api/get_valid_games";
  static String getPastGames = "api/get_past_games";
  static String createPlayer = "api/create_player";
  static String getPlayers = "api/get_players";

  //Test or not currently used routes
  static String testProfilePic = "api/test_file";
}