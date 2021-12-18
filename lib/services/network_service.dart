import 'dart:convert';

import 'package:http/http.dart';
import 'package:india_today/services/api_service.dart';
import 'package:india_today/utils/url.dart';

class NetworkService {
  static Future fetchAllAgents(Map<String, dynamic> request) async {
    final Response? response = await ApiService.makeRequest(
        Url.FETCH_ALL_AGENTS, RequestType.post, request, null);

    String? jsonString = response?.body;
    if (jsonString == null) return null;

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }

  static Future fetchAllLocations(Map<String, dynamic> request) async {
    final Response? response = await ApiService.makeRequest(
        Url.FETCH_ALL_LOCATIONS, RequestType.post, request, null);

    String? jsonString = response?.body;
    if (jsonString == null) return null;

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }

  static Future fetchAllPanchangs(Map<String, dynamic> request) async {
    final Response? response = await ApiService.makeRequest(
        Url.FETCH_ALL_PANCHANG, RequestType.post, request, null);

    String? jsonString = response?.body;
    if (jsonString == null) return null;

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap;
  }
}
