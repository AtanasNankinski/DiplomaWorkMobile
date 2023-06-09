import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/misc/error/error_util.dart';
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
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          final response = request.data['replicas'];
          for(var replica in response) {
            String name = replica['replica_name'];
            String type = replica['replica_type'];
            double power = replica['replica_power'].toDouble();
            replicaList.add(Replica(replicaName: name, replicaType: type, replicaPower: power));
          }
          return replicaList;
        }
      }
      throw "Server Response Error";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<Replica> addReplica(String replicaName, String replicaType, double replicaPower, int userId) async {
    try {
      final formData = FormData.fromMap({
        "replica_name":replicaName,
        "replica_type":replicaType,
        "replica_power":replicaPower,
        "user_id":userId
      });
      final request = await DioInstance().dio.post(ApiConfig.addReplica, data: formData);

      if(request.statusCode != null) {
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          final response = request.data;
          String name = response['replica_name'];
          String type = response['replica_type'];
          double power = double.parse(response['replica_power']);
          final replica = Replica(replicaName: name, replicaType: type, replicaPower: power);
          if(replica != Replica.empty()) {
            return replica;
          }
        }
      }
      throw "Server Response Error";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<void> deleteReplica(String replicaName, int userId) async {
    try {
      final formData = FormData.fromMap({
        'replica_name':replicaName,
        'user_id':userId
      });

      final request = await DioInstance().dio.post(ApiConfig.deleteReplica, data: formData);

      if(request.statusCode != null) {
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          return;
        }
      }
      throw "Error deleting replica.";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }
}