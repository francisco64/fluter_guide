import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';



class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
      
      final response = await _dio.get('https://yesno.wtf/api');
      
      /*http request
      data = Map (3 items)
      0 = "answer" -> "no"
      1 = "forced" -> false
      2 = "image" -> "https://yesno.wtf/assets/no/31-cc391a4c0332a4ce5b4d4666f64a7b4a.gif"
      extra = Map (0 items)
      */

      final yesNoModel = YesNoModel.fromJsonMap(response.data);//transforms map to object
      //throw UnimplementedError();
      return yesNoModel.toMessageEntity();
      /*
      Message(
        text: yesNoModel.answer, 
        fromWho: FromWho.hers,
        imageUrl: yesNoModel.image
        );
      */


  }


}