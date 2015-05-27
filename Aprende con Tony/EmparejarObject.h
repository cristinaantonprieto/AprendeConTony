//
//  EmparejarObject.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 26/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NombreNivelEmpRopa, //casa
    NombreNivelEmpBarrer, //casa
    NombreNivelEmpMesa, //casa
    NombreNivelEmpMaleta, //cotidianas
    NombreNivelEmpDientes, //cotidianas
    NombreNivelEmpCine, //cotidianas
    NombreNivelEmpLavarManos, //modales
    NombreNivelEmpMocos, //modales
    NombreNivelEmpPapel, //modales
    NombreNivelEmpContento, //emociones
    NombreNivelEmpTriste, //emociones
    NombreNivelEmpAsustado, //emociones
}NombreNivelEmp;

@interface EmparejarObject : NSObject
{
    
}


@property (nonatomic, readonly) NombreNivelEmp nombreNivel;
@property (nonatomic, retain) NSString *nombreImagenCentral;
@property (nonatomic, retain) NSArray *arrayPosibilidades;
@property (nonatomic, retain) NSString *stringIndiceCorrecto;
@property (nonatomic, retain) NSString *stringCorrecta;
@property (nonatomic, retain) NSString *nombreImagenGuion;


-(EmparejarObject *) initWithInstruccion: (NombreNivelEmp) nombre_nivel numero_dificultad:(int)num_dificultad;

@end
