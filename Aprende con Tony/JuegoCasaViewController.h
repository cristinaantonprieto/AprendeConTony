//
//  JuegoCasaViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "JuegoSeleccionarViewController.h"
#import "JuegoEmparejarViewController.h"
#import "JuegoOrdenarViewController.h"
#import "JuegoCasa.h"

@interface JuegoCasaViewController : UIViewController
{
    
}

@property (nonatomic, retain)NSString *nombreJuego;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property(nonatomic, retain) NSTimer *temporizador;
@property(nonatomic, retain) JuegoCasa *juegoCasa;

////OJOOOOOO LA INSTANCIA DE JUEGO ES NECESARIA PASARLA AL SIGUIENTE CONTROLADOR


-(void)goToSiguienteJuegoViewController:(id)sender;


@end
