//
//  ConfiguracionUsuariosViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 28/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeleccionUsuariosViewController.h"
#include "ConfiguracionCaracteristicasJuegosViewController.h"
#import "Usuario.h"
#import "JuegoEmociones.h"
#import "JuegoCasa.h"
#import "JuegoCotidianas.h"
#import "JuegoModales.h"

@interface ConfiguracionUsuariosViewController : UIViewController
{
    IBOutlet UIImageView *imagenFondo;
    IBOutlet UIButton *buttonSaveConfiguracion;
    BOOL noguardar;
    
}


/** VARIABLES **/

@property(nonatomic, assign) BOOL noguardar;
@property (nonatomic, retain) IBOutlet UIButton *buttonSaveConfiguracion;

@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;

@property (nonatomic, assign) BOOL nuevoUsuario;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property (nonatomic, retain) JuegoEmociones *juegoEmociones;
@property (nonatomic, retain) JuegoCasa *juegoCasa;
@property (nonatomic, retain) JuegoModales *juegoModales;
@property (nonatomic, retain) JuegoCotidianas *juegoCotidianas;

@property (nonatomic, retain) IBOutlet UIButton *buttonConfiguracionCasa;
@property (nonatomic, retain) IBOutlet UIButton *buttonConfiguracionCotidianas;
@property (nonatomic, retain) IBOutlet UIButton *buttonConfiguracionModales;
@property (nonatomic, retain) IBOutlet UIButton *buttonConfiguracionEmociones;


@property (nonatomic, retain) NSManagedObjectContext *context;
/** METODOS **/

-(IBAction)guardarConfiguracion:(id)sender;
-(IBAction)goToConfigurarCasaViewController:(id)sender;
-(IBAction)goToConfigurarCotidianasViewController:(id)sender;
-(IBAction)goToConfigurarModalesViewController:(id)sender;
-(IBAction)goToConfigurarEmocionesViewController:(id)sender;


@end

