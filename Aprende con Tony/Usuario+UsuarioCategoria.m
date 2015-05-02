//
//  Usuario+UsuarioCategoria.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 2/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "Usuario+UsuarioCategoria.h"
#import "AppDelegate.h"

@implementation Usuario (UsuarioCategoria)


+(id)usuarioWithContext:(NSManagedObjectContext *)context {
    Usuario *usuario = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Usuario"
                        inManagedObjectContext:context];
    return usuario;
}




@end
