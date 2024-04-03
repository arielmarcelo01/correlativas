class Materia {
	var property nombreMateria
	var property codigoMateria
	var property correlativasPrevias = #{}
	
	method cambiarNombre(nuevoNombre,nuevoCodigo, nuevasCorrelativas){ // las instrucciones se separan con ;
		nombreMateria = nuevoNombre;
		codigoMateria = nuevoCodigo;
		correlativasPrevias = nuevasCorrelativas}
	
	method aniadirCorrelativa(unaMateria) = correlativasPrevias.add(unaMateria)
		 
}

class Alumno {
	const property nombreCompleto
	const property legajo
	const property materiasAprobadas = #{ }
	
	method aniadirMateriaAprobada(unaMateria)= materiasAprobadas.add(unaMateria)
	
	method cumpleCorrelativas(unaMateria) = unaMateria.correlativasPrevias().all( {materia => self.materiaAprobada(materia)})
	
	method materiaAprobada(unaMateria) = materiasAprobadas.contains(unaMateria) }

class Inscripcion {
	const property alumno
	const property materiasIncripcion = #{}
	
	method agregarMateriaIncripcion(unasMaterias) = materiasIncripcion.addAll(unasMaterias)
	
	method eliminarMateriaIncripcion(unaMateria) {
		if ( materiasIncripcion.contains(unaMateria) )
			{ materiasIncripcion.remove(unaMateria) } else { } }
	
	method aprobada() = materiasIncripcion.all({materia => alumno.cumpleCorrelativas(materia)})
	
}