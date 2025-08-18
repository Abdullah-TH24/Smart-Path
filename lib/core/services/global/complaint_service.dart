import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartpath/api/api_service.dart';
import 'package:smartpath/core/utils/app_links.dart';
import 'package:smartpath/models/global/complaint_model.dart';

class ComplaintService {
  Future sendComplaint(Map<String, dynamic> data) async {
    final response = await Api().post(
      url: AppLinks.sendComplaint,
      body: data,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened while sending your complaint..!');
    }
  }

  Future getComplaints() async {
    final response = await Api().get(
      url: AppLinks.getUserComplaints,
      withToken: true,
    );
    if (response['status'] == true) {
      final List data = response['data'] ?? [];
      return data.map((e) => ComplaintModel.fromJson(e)).toList();
    } else {
      throw Exception('Error happened while getting your complaints!');
    }
  }

  Future<void> updateComplaint(Map<String, dynamic> complaintData) async {
    final response = await Api().post(
      url: AppLinks.editComplaint,
      body: complaintData,
      withToken: true,
    );
    if (response['status'] == true) {
      return;
    } else {
      throw Exception('Error happened when updating the complaint!');
    }
  }

  Future<void> deleteComplaint(num id) async {
    final response = await Api().delete(url: '${AppLinks.deleteComplaint}$id');

    if (response['status'] != true) {
      throw Exception('Error happened when deleting the complaint!');
    }
  }
}
