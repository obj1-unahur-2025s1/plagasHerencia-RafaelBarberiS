import plagas.*
class Hogar{
    var mugre
    const confort 
    method esBueno() = confort/2 >= mugre 
    method ataqueDePlaga(unaPlaga) { mugre +=unaPlaga.daño() }
}

class Huerta{
    var capacidadProduccion 
    method esBueno() = capacidadProduccion > nivelMinimo.nivel() 
    method ataqueDePlaga(unaPlaga){capacidadProduccion = 0.max(capacidadProduccion - if(unaPlaga.transmiteEnfermedades()) unaPlaga.daño()*0.1 + 10 else unaPlaga.daño() )}
}

object nivelMinimo{
    var property nivel = 100
}

class Mascota{
    var salud 
    method esBueno() = salud > 250
    method ataqueDePlaga(unaPlaga) { salud = 0.max(salud - if(unaPlaga.transmiteEnfermedades()) unaPlaga.daño() else 0 )}
}

class Barrio{
    const elementos = []

    method agregarElemento(listaElementos) {elementos.addAll(listaElementos)}
    method removerElemento(listaElementos) {elementos.removeAll(listaElementos)}

    method esCopado() = self.cantidadElementosBuenos() > self.cantidadElementosNoBuenos()
    method cantidadElementosBuenos() = elementos.count({e => e.esBueno()})
    method cantidadElementosNoBuenos() = elementos.count({e => not e.esBueno()})

}