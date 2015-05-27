//
//  JuegoModalesViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 13/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Usuario.h"
#import "JuegoSeleccionarViewController.h"
#import "JuegoEmparejarViewController.h"
#import "JuegoOrdenarViewController.h"
#import "JuegoModales.h"

@interface JuegoModalesViewController : UIViewController
{
    
}

@property (nonatomic, retain)NSString *nombreJuego;
@property (nonatomic, retain)NSString *nombreNivel;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property(nonatomic, retain) NSTimer *temporizador;
@property(nonatomic, retain) JuegoModales *juegoModales;

-(void)goToSiguienteJuegoViewController:(id)sender;

@end
