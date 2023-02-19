class Post{
  String? id;
  String? name;
  String? content;
  String? url;

  Post({this.id, this.name, this.content, this.url});
}

  Post postFromDocument(Map<String, dynamic> document) {
  return Post(
    id: document['id'],
    name: document['name'],
    content: document['content'],
    url: document['url'],
  );
}