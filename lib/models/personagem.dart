class Personagem {
  final int? id;
  String nome;
  String arma;
  String armadura;
  String magia;
  String raca;

  Personagem(
      {this.id,
      required this.nome,
      required this.arma,
      required this.armadura,
      required this.magia,
      required this.raca});

  factory Personagem.fromJson(Map<String, dynamic> json) => Personagem(
        id: json['id'] as int?,
        nome: json['nome'],
        arma: json['arma'],
        armadura: json['armadura'],
        magia: json['magia'],
        raca: json['raca'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'arma': arma,
        'armadura': armadura,
        'magia': magia,
        'raca': raca,
      };
}
