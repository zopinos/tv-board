class Destinations {
  static const home = '/home';
  static const homeAddShow = '/home/add-show';
  static String homeEditShow(String id, String title, String channel) =>
      '/home/edit-show/$id/$title/$channel';
  static const analytics = '/analytics';
}
