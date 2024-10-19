class User {
  final int id;
  final String name;
  final String avatar;

  User(this.id, this.name, this.avatar);
}

// List of Preset Users
final List<User> users = [
  User(1, 'Alice', 'https://via.placeholder.com/150'),
  User(2, 'Bob', 'https://via.placeholder.com/150'),
  User(3, 'Charlie', 'https://via.placeholder.com/150'),
  User(4, 'David', 'https://via.placeholder.com/150'),
  User(5, 'Eve', 'https://via.placeholder.com/150'),
];