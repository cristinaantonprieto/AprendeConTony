//
//  ConfiguracionCaracteristicasJuegosViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 11/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "JuegoCasa.h"
#import "JuegoEmociones.h"
#import "JuegoCotidianas.h"
#import "JuegoModales.h"
#import "ConfiguracionUsuariosViewController.h"


@interface ConfiguracionCaracteristicasJuegosViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    
}

@property(nonatomic, retain)NSString *nombreJuego;
@property(nonatomic, assign)BOOL nuevoUsuario;

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;

@property(nonatomic, retain)IBOutlet UILabel *labelnombrejuego;
@property (nonatomic, retain)IBOutlet UITextField *voztextfield;
@property (nonatomic, retain)IBOutlet UITextField *pictostextfield;
@property (nonatomic, retain)IBOutlet UITextField *num_niveltextfield;
@property (nonatomic, retain)IBOutlet UITextField *num_dificultadtextfield;
@property (nonatomic, retain)IBOutlet UITextField *tiempototaltextfield;
@property (nonatomic, retain)IBOutlet UITextField *numfallos_ordenar;
@property (nonatomic, retain)IBOutlet UITextField *numfallos_emparejar;
@property (nonatomic, retain)IBOutlet UITextField *numfallos_seleccionar;

@end
