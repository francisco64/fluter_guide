import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {//from a mao creates an object that stores the same values
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String,dynamic> json) => 
  YesNoModel(
    answer: json['answer'],
    forced: json['forced'],
    image: json['image']
  );

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si omme 😎' : 'ni por el putas',
    fromWho: FromWho.hers,
    imageUrl: image
  );


}
