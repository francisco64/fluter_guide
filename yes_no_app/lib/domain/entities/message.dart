
enum FromWho {me,hers}

class Message{//object that stores content of message
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, 
  this.imageUrl, //can be null
  required this.fromWho});
}

