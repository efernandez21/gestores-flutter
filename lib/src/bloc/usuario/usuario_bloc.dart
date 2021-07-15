import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados_app/src/models/usuario.dart';

// Relaciono mi conexion de estos 3 archivos
part 'usuario_state.dart';
part 'usuario_event.dart';

// Servicio donde estan los streams
class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  // Al inicializar el bloc se manda el estado inicial
  UsuarioBloc() : super(UsuarioState());

  // Recibe un evento y retorna un estado
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    // Se emite un estado en base al evento recibido solo se redibujara si se emitio algo
    if (event is ActivarUsuario) {
      // El yield emite un usuario state
      // yield UsuarioState(user: event.usuario);
      // Podemos establecer una copia de ese estado en busca de afectar algunas y no todas sus propiedades
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      // Retorno del nuevo state, pero con un copyWith para mantener algunas propiedades
      yield state.copyWith(usuario:state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      // Codigo para agregar profesion diseñado por mi
      // final List<String> newProfesiones = state.usuario.profesiones;
      // newProfesiones.add(event.profesion);
      // yield UsuarioState(user: state.usuario.copyWith(profesiones: newProfesiones));
      yield state.copyWith(usuario:state.usuario.copyWith( profesiones: [...state.usuario.profesiones, event.profesion]));
    } else if (event is BorrarUsuario) {
      // Enviamos el estado sin usuario por lo tanto lo pondra en nulo
      yield state.estadoInicial();
    }
  }
}
