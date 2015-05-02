//
//  Juegos.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 2/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Usuario;

@interface Juegos : NSManagedObject

@property (nonatomic, retain) NSString * voz;
@property (nonatomic, retain) Usuario *usuarioJuegos;

@end
