class Post {
  String? id;
  String? name;
  String? content;
  String? url;

  Post({this.id, this.name, this.content, this.url});

  Post.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        url = json["url"],
        content = json["content"],
        id = json["id"];

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "url": url,
      "content": content,
      "id": id,
    };
  }
}

Post postFromDocument(Map<String, dynamic> document) {
  return Post(
    id: document['id'],
    name: document['name'],
    content: document['content'],
    url: document['url'],
  );
}
