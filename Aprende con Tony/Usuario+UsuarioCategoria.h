//
//  Usuario+UsuarioCategoria.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 2/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "Usuario.h"

@interface Usuario (UsuarioCategoria)


//crear nueva instancia, constructor
+(id)usuarioWithContext:(NSManagedObjectContext *)context;

//Usuario *usuario = [Usuario usuarioWithContext:context];  para usarlo
//para borrar  [context deleteObject:aManagedObject];


@end
