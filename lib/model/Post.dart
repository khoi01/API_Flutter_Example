
class PostList{
  final List<Post> posts;

  PostList({this.posts});


  //list of item
  factory PostList.fromJson(List<dynamic> parsedJson){

    List<Post> posts = new List<Post>();
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();

    return new PostList(posts:posts);
  }


}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });


  //why used map?
  //each object at json is a map

  //factory constructor
  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title:json['title'],
      body:json['body']
    );
  }

}
