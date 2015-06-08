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

-(OrdenarObject *) initWithInstruccion: (NombreNivel) nombre_nivel numero_dificultad:(int)num_dificultad
{
    self = [super init];
    
    switch (nombre_nivel) {
        case NombreNivelRopa:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"sucio.png", @"ponerLavadora.png", @"limpio.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"ponerLavadora.png", @"sucio.png", @"limpio.png", nil];
            
        }
            break;
        case NombreNivelTelefono:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"telefono.png", @"marcar.png", @"hablar.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"marcar.png", @"hablar.png", @"telefono.png", nil];
            
        }
            break;
        case NombreNivelZumo:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"naranja.png", @"hacerZumo.png", @"zumo.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"zumo.png", @"hacerZumo.png", @"naranja.png", nil];
            
        }
            break;
        case NombreNivelBarba:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"barba.png", @"afeitar.png", @"afeitado.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"barba.png", @"afeitado.png", @"afeitar.png", nil];
            
        }
            break;
        case NombreNivelDientes:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"pastaDientes.png", @"lavarDientes.png", @"enjuagar.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"pastaDientes.png", @"enjuagar.png", @"lavarDientes.png", nil];
            
        }
            break;
        case NombreNivelDormir:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"desvestirse.png", @"pijama.png", @"dormir.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"dormir.png", @"pijama.png", @"desvestirse.png", nil];
            
        }
        case NombreNivelLavarManos:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"sucias.png", @"lavarSucias.png", @"limpias.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"sucias.png", @"limpias.png", @"lavarSucias.png", nil];
            
        }
        case NombreNivelMocos:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"tengoMocos.png", @"sonarse.png", @"panueloPapelera.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"detergente.png", @"suavizante.png", nil];
            
        }
        case NombreNivelComer:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"niñoCome.png", @"lavabo.png", @"niñoDientes.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"niñoDientes.png", @"lavabo.png", @"niñoCome.png", nil];
            
        }
            
            break;
        case NombreNivelContento:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"tristedos.png", @"jugarBalon.png", @"contentodos.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristedos.png", @"jugarBalon.png", @"contentodos.png", nil];
            
        }
            
            break;
        case NombreNivelTriste:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"caer.png", @"duele.png", @"tristecuatro.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"tristecuatro.png", @"duele.png", @"caer.png", nil];
            
        }
            
            break;
        case NombreNivelAsustado:
        {
            
            //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
            //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"asustadocentral.png", @"vayaSusto.png", @"asustadodos.png", nil];
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"asustadocentral.png", @"asustadodos.png", @"vayaSusto.png", nil];
            
        }
            
            break;
        default:
            break;
    }
    
    
    return self;
}

@end
