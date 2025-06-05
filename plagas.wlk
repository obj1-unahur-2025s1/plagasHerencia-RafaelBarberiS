import elemento.*
class Plagas{
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10
    method efectoDeAtacar() {
      poblacion += poblacion* 1.1
    }
    method atacaUnElemento(unElemento){ 
        unElemento.ataqueDePlaga(self)
        self.efectoDeAtacar()
    }
}

class Cucarachas inherits Plagas{
    var property pesoPromedio 

    method daño() = poblacion / 2
    override method transmiteEnfermedades() = super() and pesoPromedio >= 10 
    override method atacaUnElemento(unElemento) {super(unElemento)
    pesoPromedio += 2
    }  
}

class Pulgas inherits Plagas{

    method daño() = poblacion * 2
}

class Garrapatas inherits Pulgas{
    override method efectoDeAtacar(){ poblacion += poblacion* 1.2}
}

class Mosquitos inherits Plagas{

    method daño() = poblacion
    override method transmiteEnfermedades() = super() and (poblacion % 3 == 0)
}