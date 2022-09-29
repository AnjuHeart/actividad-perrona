class Raza{
  late final String valor;

  Raza._(this.valor);

  factory Raza.constructor(String propuesta){
    if(propuesta.trim().isEmpty){
      throw('Nick está mal formado');
    }
    return Raza._(propuesta);
  }

}