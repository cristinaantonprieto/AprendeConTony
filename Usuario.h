//
//  Usuario.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 2/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Juegos;

@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSString * dni;
@property (nonatomic, retain) NSNumber * edad;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * tipo_autismo;
@property (nonatomic, retain) Juegos *usuarioJuegos;

@end
