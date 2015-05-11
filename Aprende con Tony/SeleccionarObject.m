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
    
    switch (nombreNivel) {
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
