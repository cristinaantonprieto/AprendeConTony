//
//  JuegoEmparejarViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Usuario.h"
#import "JuegoCasa.h"


#import "SeleccionUsuariosViewController.h"
#import "NuevoUsuarioViewController.h"
#import "DashBoardViewController.h"
#import "IntermediaJuegoViewController.h"

@interface JuegoEmparejarViewController : UIViewController
{
    
}

@property(nonatomic, retain) NSString *nombreJuego; //casa, cotidianas, modales, emociones
@property(nonatomic, retain) NSString *nombreNivel; //ropa, barrer, ....

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property(nonatomic, assign)int numDificultad;


@property(nonatomic, retain) JuegoCasa *juegoCasa;

@end
