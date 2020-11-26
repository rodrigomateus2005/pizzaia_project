class Foto {
  String uuid;
  bool favorita;
  String url;
  String repoName;

  Foto({this.uuid, this.favorita, this.url, this.repoName}) {
    if (this.favorita == null) this.favorita = false;
  }
}