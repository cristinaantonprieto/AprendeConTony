//
//  SeleccionarObject.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "SeleccionarObject.h"

@implementation SeleccionarObject

@synthesize nombreNivel, nombreImagenCentral, nombreImagenGuion, arrayCorrectas, arrayPosibilidades, arrayPosibilidadesIndices;

-(SeleccionarObject *) initWithInstruccion: (NombreNivel) nombre_nivel numero_dificultad:(int)num_dificultad
{
    self = [super init];
    
    switch (nombre_nivel) {
        case NombreNivelRopa:
        {
          //nombre de la imagen central
            self.nombreImagenCentral = @"ninosSucios.png";
          //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
          //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"lavadora.png", @"detergente.png", @"suavizante.png", nil];
          //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"recogedor.png", @"suavizante.png",@"detergente.png", @"cuchillo.png", nil];
                     self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"recogedor.png", @"suavizante.png",@"detergente.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"detergente.png", @"suavizante.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case NombreNivelBarrer:
        {
            
            //nombre de la imagen central
            self.nombreImagenCentral = @"barrer.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", @"recogedor.png", @"papelera.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", @"recogedor.png", @"tenedor.png",@"papelera.png", @"suavizante.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", @"recogedor.png", @"tenedor.png",@"papelera.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", @"recogedor.png", @"papelera.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelMesa:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"comer.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"tenedor.png", @"vaso.png", @"cuchillo.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tenedor.png", @"recogedor.png", @"suavizante.png",@"cuchillo.png", @"vaso.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"4", @"5", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tenedor.png", @"recogedor.png", @"cuchillo.png",@"vaso.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tenedor.png", @"vaso.png", @"cuchillo.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelMaleta:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"verano.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"chanclas.png", @"camiseta.png", @"pantalonCorto.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"chanclas.png", @"camiseta.png", @"abrigo.png",@"gorro.png", @"pantalonCorto.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"5", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"chanclas.png", @"gorro.png", @"pantalonCorto.png",@"camiseta.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"chanclas.png", @"camiseta.png", @"pantalonCorto.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelDientes:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"lavarDientes.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"cepillo_dental.png", @"grifo.png", @"pastaDientes.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"grifo.png", @"cepillo_dental.png", @"suavizante.png",@"cuchillo.png", @"pastaDientes.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"5", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"grifo.png", @"cepillo_dental.png", @"cuchillo.png",@"pastaDientes.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepillo_dental.png", @"grifo.png", @"pastaDientes.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelCine:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"cine.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"palomitas.png", @"entrada.png", @"dinero.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"entrada.png", @"recogedor.png", @"suavizante.png",@"dinero.png", @"palomitas.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"4", @"5", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"entrada.png", @"recogedor.png", @"dinero.png",@"palomitas.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"dinero.png", @"entrada.png", @"palomitas.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
        case NombreNivelLavarManos:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"antesDeComer.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"toalla.png", @"jabonManos.png", @"lavarManos.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"jabonManos.png", @"recogedor.png", @"suavizante.png",@"toalla.png", @"lavarManos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"4", @"5", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"jabonManos.png", @"toalla.png", @"lavarManos.png",@"palomitas.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"toalla.png", @"jabonManos.png", @"lavarManos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
        case NombreNivelMocos:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"tengoMocos.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"sonarse.png", @"panuelos.png", @"noDedoNariz.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"noDedoNariz.png", @"recogedor.png", @"sonarse.png",@"panuelos.png", @"palomitas.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sonarse.png", @"noDedoNariz.png", @"dinero.png",@"panuelos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sonarse.png", @"panuelos.png", @"noDedoNariz.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
        case NombreNivelPapel:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"usarPapelera.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"papelera.png", @"panueloPapelera.png", @"contenedor.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"panueloPapelera.png", @"contenedor.png", @"suavizante.png",@"papelera.png", @"palomitas.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"papelera.png", @"recogedor.png", @"contenedor.png",@"panueloPapelera.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contenedor.png", @"papelera.png", @"panueloPapelera.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        case NombreNivelContento:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"jugando.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"contentouno.png", @"contentodos.png", @"contento3.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentouno.png", @"contentodos.png", @"triste.png",@"contento3.png", @"asustadodos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentouno.png", @"triste.png", @"contentodos.png",@"contento3.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"3", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentouno.png", @"contentodos.png", @"contento3.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        case NombreNivelTriste:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"tristecentral.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"triste.png", @"tristedos.png", @"tristecuatro.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"triste.png", @"tristedos.png", @"contentouno.png",@"asustadodos.png", @"tristecuatro.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"5", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"triste.png", @"tristedos.png", @"tristecuatro.png",@"contentodos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"triste.png", @"tristedos.png", @"tristecuatro.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        case NombreNivelAsustado:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"asustadocentral.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"asustadocama.png", @"asustadodos.png", @"asustado.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustado.png", @"asustadocama.png", @"contentouno.png",@"asustadodos.png", @"triste.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustado.png", @"asustadocama.png", @"triste.png",@"asustadodos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"4", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustado.png", @"asustadocama.png", @"asustadodos.png", nil];
                    self.arrayPosibilidadesIndices = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        default:
            break;
    }
    
    
    return self;
}

@end
