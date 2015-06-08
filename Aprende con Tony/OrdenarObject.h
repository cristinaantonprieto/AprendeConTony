//
//  OrdenarObject.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 8/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NombreNivelRopa, //casa
    NombreNivelTelefono, //casa
    NombreNivelZumo, //casa
    NombreNivelBarba, //cotidianas
    NombreNivelDientes, //cotidianas
    NombreNivelDormir, //cotidianas
    NombreNivelLavarManos, //modales
    NombreNivelMocos, //modales
    NombreNivelComer, //modales
    NombreNivelContento, //emociones
    NombreNivelTriste, //emociones
    NombreNivelAsustado, //emociones
}NombreNivel;

@interface OrdenarObject : NSObject
{
}


@property (nonatomic, readonly) NombreNivel nombreNivel;

@property (nonatomic, retain) NSArray *arrayPosibilidades;
@property (nonatomic, retain) NSArray *arrayCorrectas;
@property (nonatomic, retain) NSString *nombreImagenGuion;


-(OrdenarObject *) initWithInstruccion: (NombreNivel) nombre_nivel numero_dificultad:(int)num_dificultad;

@end
