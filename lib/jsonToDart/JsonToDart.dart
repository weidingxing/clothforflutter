import 'dart:convert';

import 'package:graduationproject/auto_json/ToJson.dart';

class JsonToDart{
  final String json_data;

  JsonToDart(this.json_data);
 List<Data> toJson(){
//   String rejson=re.data.toString();

      Map mapJson=json.decode(json_data);
      Autogenerated a  =Autogenerated.fromJson(mapJson);
      Result r=a.result;
      List<Data> reList=r.data;
      return reList;

 }

}