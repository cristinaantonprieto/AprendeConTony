//
//  SeleccionarObject.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum {
    NombreNivelRopa, //casa
    NombreNivelBarrer, //casa
    NombreNivelMesa, //casa
    NombreNivelMaleta, //cotidianas
    NombreNivelDientes, //cotidianas
    NombreNivelCine, //cotidianas
    NombreNivelLavarManos, //modales
    NombreNivelMocos, //modales
    NombreNivelPapel, //modales
    NombreNivelContento, //emociones
    NombreNivelTriste, //emociones
    NombreNivelAsustado, //emociones
}NombreNivel;

@interface SeleccionarObject : NSObject
{
    
}

@property (nonatomic, readonly) NombreNivel nombreNivel;
@property (nonatomic, retain) NSString *nombreImagenCentral;
@property (nonatomic, retain) NSArray *arrayPosibilidades;
@property (nonatomic, retain) NSArray *arrayPosibilidadesIndices;
@property (nonatomic, retain) NSArray *arrayCorrectas;
@property (nonatomic, retain) NSString *nombreImagenGuion;


-(SeleccionarObject *) initWithInstruccion: (NombreNivel) nombre_nivel numero_dificultad:(int)num_dificultad;

@end
