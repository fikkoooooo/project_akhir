import 'package:latihan_responsi_fikko/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<Map<String, dynamic>> loadArticles() {
    return BaseNetwork.get("articles/?format=json");
  }
  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("blogs/?format=json");
  }
  Future<Map<String, dynamic>> loadReports() {
    return BaseNetwork.get("reports/?format=json");
  }

  Future<Map<String, dynamic>> loadDetailArticles(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("articles/?format=json/$id");
  }
  Future<Map<String, dynamic>> loadDetailBlogs(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("blogs/?format=json/$id");
  }
  Future<Map<String, dynamic>> loadDetailReports(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("reports/?format=json/$id");
  }
}