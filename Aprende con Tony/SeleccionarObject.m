//
//  SeleccionarObject.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "SeleccionarObject.h"

@implementation SeleccionarObject

@synthesize nombreNivel, nombreImagenCentral, nombreImagenGuion, arrayCorrectas, arrayPosibilidades;

-(SeleccionarObject *) initWithInstruccion: (NombreNivel) nombre_nivel
{
    self = [super init];
    
    switch (nombreNivel) {
        case NombreNivelRopa:
        {
          //nombre de la imagen central
            self.nombreImagenCentral = @"niñosSucios.png";
          //nombre de la imagen del guion
            self.nombreImagenGuion = @""; //COMPLETAR!!!!!!
          //array de las correctas
            self.arrayCorrectas = [[NSArray alloc]initWithObjects:@"lavadora.png", @"detergente.png", @"suavizante.png", nil];
          //array de las posibilidades
            self.arrayPosibilidades = [[NSArray alloc]initWithObjects:@"lavadora.png", @"detergente.png", @"suavizante.png",@"recogedor.png", @"cuchillo.png", nil];
        }
            break;
        case NombreNivelBarrer:
        {
            
            //completar
        }
            break;
        case NombreNivelMesa:
        {
            //completar
        }
            break;
       
        default:
            break;
    }
    
    return self;
}

@end
