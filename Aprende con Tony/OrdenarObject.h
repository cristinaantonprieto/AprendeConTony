//
//  OrdenarObject.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 8/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NombreNivelRopaOrdenar, //casa
    NombreNivelTelefonoOrdenar, //casa
    NombreNivelZumoOrdenar, //casa
    NombreNivelBarbaOrdenar, //cotidianas
    NombreNivelDientesOrdenar, //cotidianas
    NombreNivelDormirOrdenar, //cotidianas
    NombreNivelLavarManosOrdenar, //modales
    NombreNivelMocosOrdenar, //modales
    NombreNivelComerOrdenar, //modales
    NombreNivelContentoOrdenar, //emociones
    NombreNivelTristeOrdenar, //emociones
    NombreNivelAsustadoOrdenar, //emociones
}NombreNivelOrdenar;

@interface OrdenarObject : NSObject
{
}


@property (nonatomic, readonly) NombreNivelOrdenar nombreNivel;

@property (nonatomic, retain) NSArray *arrayPosibilidades;
@property (nonatomic, retain) NSArray *arrayCorrectas;
@property (nonatomic, retain) NSString *nombreImagenGuion;


-(OrdenarObject *) initWithInstruccion: (NombreNivelOrdenar) nombre_nivel numero_dificultad:(int)num_dificultad;

@end
