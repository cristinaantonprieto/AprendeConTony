//
//  JuegoCotidianas.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Usuario;

@interface JuegoCotidianas : NSManagedObject

@property (nonatomic, retain) NSNumber * guionPictos;
@property (nonatomic, retain) NSString * nombreJuego;
@property (nonatomic, retain) NSNumber * num_dificultad;
@property (nonatomic, retain) NSNumber * num_fallos_emparejar;
@property (nonatomic, retain) NSNumber * num_fallos_ordenar;
@property (nonatomic, retain) NSNumber * num_fallos_seleccionar;
@property (nonatomic, retain) NSNumber * num_nivel;
@property (nonatomic, retain) NSNumber * tiempoTotal;
@property (nonatomic, retain) NSNumber * voz;
@property (nonatomic, retain) NSString * superado;
@property (nonatomic, retain) Usuario *usuario_juegoCotidianas;

@end
