//
//  EmparejarObject.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 26/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "EmparejarObject.h"

@implementation EmparejarObject

@synthesize nombreNivel, nombreImagenCentral, nombreImagenGuion, stringCorrecta, arrayPosibilidades, stringIndiceCorrecto;

-(EmparejarObject *) initWithInstruccion: (NombreNivelEmp) nombre_nivel numero_dificultad:(int)num_dificultad
{
    self = [super init];
    
    switch (nombre_nivel) {
        case NombreNivelEmpRopa:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"ninosSucios.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"lavadora.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"cepilloBarrer.png", @"papelera.png", nil];
                    self.stringIndiceCorrecto = @"1";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"papelera.png", nil];
                     self.stringIndiceCorrecto = @"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", nil];
                    self.stringIndiceCorrecto = @"1";
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case NombreNivelEmpBarrer:
        {
            
            //nombre de la imagen central
            self.nombreImagenCentral = @"barrer.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"cepilloBarrer.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"cepilloBarrer.png", @"tenedor.png", nil];
                    self.stringIndiceCorrecto =@"2";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", @"recogedor.png", nil];
                    self.stringIndiceCorrecto =@"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", nil];
                    self.stringIndiceCorrecto =@"1";
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelEmpMesa:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"comer.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"cubiertos.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"cubiertos.png", @"cepilloBarrer.png", nil];
                    self.stringIndiceCorrecto =@"2";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"cubiertos.png", nil];
                    self.stringIndiceCorrecto =@"2";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cubiertos.png", nil];
                    self.stringIndiceCorrecto =@"1";
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelEmpMaleta:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"frio.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"abrigo.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"chanclas.png", @"camiseta.png", @"abrigo.png", nil];
                    self.stringIndiceCorrecto = @"3";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"abrigo.png", @"camiseta.png", nil];
                    self.stringIndiceCorrecto = @"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"abrigo.png", nil];
                    self.stringIndiceCorrecto = @"1";
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelEmpDientes:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"dientesSucios.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"cepillo_dental.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepilloBarrer.png", @"cepillo_dental.png", @"panuelos.png", nil];
                    self.stringIndiceCorrecto = @"2";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"grifo.png", @"cepillo_dental.png", nil];
                    self.stringIndiceCorrecto = @"2";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"cepillo_dental.png", nil];
                    self.stringIndiceCorrecto = @"1";
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case NombreNivelEmpCine:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"cinema.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            //string opcion correcta
            self.stringCorrecta = @"palomitas.png";
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"palomitas.png", @"cubiertos.png",@"jabonManos.png", @"palomitas.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"palomitas.png", @"cubiertos.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"palomitas.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case NombreNivelEmpLavarManos:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"antesDeComer.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"lavarManos.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"palomitas.png", @"lavarManos.png", @"lavadora.png", nil];
                    self.stringIndiceCorrecto = @"2";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"palomitas.png", @"lavarManos.png", nil];
                    self.stringIndiceCorrecto = @"2";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavarManos.png", nil];
                    self.stringIndiceCorrecto = @"1";
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case NombreNivelEmpMocos:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"tengoMocos.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"sonarse.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sonarse.png", @"comer.png", @"lavarManos.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sonarse.png", @"comer.png", nil];
                   self.stringIndiceCorrecto=@"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sonarse.png", nil];
                   self.stringIndiceCorrecto=@"1";
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case NombreNivelEmpPapel:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"tirarPapel.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"papelera.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"cepillo_dental.png",@"papelera.png", nil];
                    self.stringIndiceCorrecto=@"3";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"papelera.png", nil];
                    self.stringIndiceCorrecto=@"2";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"papelera.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        case NombreNivelEmpContento:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"jugando.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"contentodos.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", @"contentodos.png",@"asustadodos.png", nil];
                    self.stringIndiceCorrecto=@"2";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", @"contentodos.png", nil];
                     self.stringIndiceCorrecto=@"2";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentodos.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        case NombreNivelEmpTriste:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"tristecentral.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"tristecuatro.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentodos.png", @"asustadodos.png",@"tristecuatro.png", nil];
                    self.stringIndiceCorrecto=@"3";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", @"contentodos.png", nil];
                       self.stringIndiceCorrecto=@"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", nil];
                       self.stringIndiceCorrecto=@"1";
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
        case NombreNivelEmpAsustado:
        {
            //nombre de la imagen central
            self.nombreImagenCentral = @"asustadocentral.png";
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //string opcion correcta
            self.stringCorrecta = @"asustadodos.png";
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentodos.png", @"tristecuatro.png",@"asustadodos.png", nil];
                    self.stringIndiceCorrecto=@"3";
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustadodos.png", @"contentodos.png", nil];
                    self.stringIndiceCorrecto=@"1";
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustadodos.png", nil];
                    self.stringIndiceCorrecto=@"1";
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
