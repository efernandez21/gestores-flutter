part of 'usuario_bloc.dart';

// Se pueden tener multiples states y emitir el que se necesite, por ahora se trabajara con un unico estado
// Estado como el de un statefulwidget
class UsuarioState {
  // Propiedades finales inicializar al definirlas o en constructor
  final bool existeUsuario;
  final Usuario usuario;
  // Se trabajaria con un copyWith en este caso para no perder nada de las propiedades ya existentes en este estado
  // Si tengo el usuario lo inicializo si no, entoces sera nulo, lo inicializo con instrucciones pequeñas, definicion de las propiedades del estado
  UsuarioState({Usuario user})
      : usuario = user ?? null,
        existeUsuario = (user != null) ? true : false;
  // Copiar el estado para mantenerlo como lo tenemos, y no eliminar las otras propiedades, metodo que regresa el usuarioState, si no recibe el usuario seguramente lo coloca en nulo
  UsuarioState copyWith({Usuario usuario}) => UsuarioState(
    user: usuario ?? this.usuario
  );
  // Metodo para borrar el estado del usuario o llevarlo al estado inicial
  UsuarioState estadoInicial() => new UsuarioState();
}
