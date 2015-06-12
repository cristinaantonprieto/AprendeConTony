//
//  Usuario.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JuegoCasa, JuegoCotidianas, JuegoEmociones, JuegoModales;

@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSString * dni;
@property (nonatomic, retain) NSNumber * edad;
@property (nonatomic, retain) id imagenUsuario;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo_autismo;
@property (nonatomic, retain) JuegoCasa *usuario_juegoCasa;
@property (nonatomic, retain) JuegoCotidianas *usuario_juegoCotidianas;
@property (nonatomic, retain) JuegoEmociones *usuario_juegoEmociones;
@property (nonatomic, retain) JuegoModales *usuario_juegoModales;

@end
