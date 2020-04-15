class Note {

  static const DEFAULT = 'DEFAULT';
  static const CALL = 'CALL';
  static const HOMEWORK = 'HOMEWORK';

  int id;
  String title;
  String body;
  int completed;
  String type;
  Note(
    {
      this.title, 
      this.body, 
      this.completed,
      this.type
    }
  );
}
