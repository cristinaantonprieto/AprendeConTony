//
//  DashBoardViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"
#import "SeleccionUsuariosViewController.h"
#import "NuevoUsuarioViewController.h"

#import "IntermediaJuegoViewController.h"

#import "Usuario.h"
#import "JuegoModales.h"
#import "JuegoEmociones.h"
#import "JuegoCotidianas.h"
#import "JuegoCasa.h"

@interface DashBoardViewController : UIViewController<UIAlertViewDelegate>
{
    
}

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property (nonatomic, retain) JuegoCasa *juegoCasa;
@property (nonatomic, retain) JuegoCotidianas *juegoCotidianas;
@property (nonatomic, retain) JuegoModales *juegoModales;
@property (nonatomic, retain) JuegoEmociones *juegoEmociones;


@property (nonatomic, retain)IBOutlet UIButton *buttonEmociones;
@property (nonatomic, retain)IBOutlet UIButton *buttonCasa;
@property (nonatomic, retain)IBOutlet UIButton *buttonModales;
@property (nonatomic, retain)IBOutlet UIButton *buttonCotidianas;

@property (nonatomic, retain) IBOutlet UIImageView *imagentony;
@property (nonatomic, retain) IBOutlet UIImageView *guionPictogramas;


-(void)goToConfigurarUsuariosViewController:(id)sender;
-(void)goToSeleccionarUsuariosViewController:(id)sender;


-(IBAction)actionButtonEmociones:(id)sender;

-(IBAction)actionButtonCasa:(id)sender;

-(IBAction)actionButtonModales:(id)sender;

-(IBAction)actionButtonCotidianas:(id)sender;

@end
