//
//  OrdenarObject.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 8/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "OrdenarObject.h"

@implementation OrdenarObject

@synthesize nombreNivel, nombreImagenGuion, arrayCorrectas, arrayPosibilidades;

-(OrdenarObject *) initWithInstruccion: (NombreNivelOrdenar) nombre_nivel numero_dificultad:(int)num_dificultad
{
    self = [super init];
    
    switch (nombre_nivel) {
        case NombreNivelRopaOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"sucio.png", @"ponerLavadora.png", @"limpio.png", nil];
           
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"ponerLavadora.png", @"sucio.png", @"limpio.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"ponerLavadora.png", @"limpio.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"limpio.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case NombreNivelTelefonoOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"telefono.png", @"marcar.png", @"hablar.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"marcar.png", @"telefono.png", @"hablar.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"hablar.png", @"marcar.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"hablar.png", nil];
                    break;
                    
                default:
                    break;
            }
            
            
        }
            break;
        case NombreNivelZumoOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"naranja.png", @"hacerZumo.png", @"zumo.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"zumo.png", @"hacerZumo.png", @"naranja.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"zumo.png", @"hacerZumo.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"zumo.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case NombreNivelBarbaOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"barba.png", @"afeitar.png", @"afeitado.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"afeitar.png", @"barba.png", @"afeitado.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"afeitado.png", @"afeitar.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"afeitado.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case NombreNivelDientesOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"pastaDientes.png", @"lavarDientes-1.png", @"enjuagar.png", nil];
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"enjuagar.png", @"lavarDientes-1.png", @"pastaDientes.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"enjuagar.png", @"lavarDientes-1.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"enjuagar.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        case NombreNivelDormirOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"desvestirse.png", @"pijama.png", @"dormir.png", nil];
  
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"dormir.png", @"pijama.png", @"desvestirse.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"dormir.png", @"pijama.png", nil];
                    break;
                case 1: //dificultad menor
                   self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"dormir.png", nil];
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case NombreNivelLavarManosOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"sucias.png", @"lavarSucias.png", @"limpias.png", nil];
            
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sucias.png", @"limpias.png", @"lavarSucias.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"limpias.png", @"lavarSucias.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"limpias.png", nil];
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case NombreNivelMocosOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"tengoMocos.png", @"sonarse.png", @"panueloPapelera.png", nil];
            
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tengoMocos.png", @"panueloPapelera.png", @"sonarse.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"panueloPapelera.png", @"sonarse.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"panueloPapelera.png", nil];
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case NombreNivelComerOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"ninoCome.png", @"lavabo.png", @"ninoDientes.png", nil];
            
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"ninoDientes.png", @"lavabo.png", @"ninoCome.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavabo.png", @"ninoDientes.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"ninoDientes.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            
            break;
        case NombreNivelContentoOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"tristedos.png", @"jugarBalon.png", @"contentodos.png", nil];
           
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                     self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristedos.png", @"jugarBalon.png", @"contentodos.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"jugarBalon.png", @"contentodos.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"contentodos.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            
            break;
        case NombreNivelTristeOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"caer.png", @"duele.png", @"tristecuatro.png", nil];
            
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                   self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", @"duele.png", @"caer.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", @"duele.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", nil];
                    break;
                    
                default:
                    break;
            }
            
        }
            
            break;
        case NombreNivelAsustadoOrdenar:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"asustadocentral.png", @"vayaSusto.png", @"asustadodos.png", nil];
            
            //array de las posibilidades
            switch (num_dificultad) {
                case 3: //dificultad mayor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustadocentral.png", @"asustadodos.png", @"vayaSusto.png", nil];
                    break;
                case 2: //dificultad media
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustadodos.png", @"vayaSusto.png", nil];
                    break;
                case 1: //dificultad menor
                    self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustadodos.png", nil];
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
