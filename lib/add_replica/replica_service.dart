import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';
import 'package:diploma_work_mobile/misc/util_services/interceptor.dart';

class ReplicaService {
  Future<List<Replica>> getReplicas(int userId) async {
    try {
      final formData = FormData.fromMap({
        'user_id':userId,
      });
      final List<Replica> replicaList = [];
      final request = await DioInstance().dio.post(ApiConfig.getReplicas, data: formData);

      if(request.statusCode != null) {
        if(request.statusCode! >= 200 && request.statusCode! < 300){
          final response = request.data['replicas'];
          for(var replica in response) {
            replicaList.add(Replica.fromJson(replica));
          }
          return replicaList;
        }
      }
      throw "Server Response Error";
    } on DioError {
      throw "Server Error";
    } catch(e) {
      throw "Unknown Error";
    }
  }
}