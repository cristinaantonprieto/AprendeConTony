//
//  JuegoSeleccionarViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Usuario.h"
#import "SeleccionarObject.h"

#import "SeleccionUsuariosViewController.h"
#import "NuevoUsuarioViewController.h"

@interface JuegoSeleccionarViewController : UIViewController<UIAlertViewDelegate>
{
    
}

@property(nonatomic, retain) NSString *nombreJuego; //casa, cotidianas, modales, emociones
@property(nonatomic, retain) NSString *nombreNivel; //ropa, barrer, ....

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property(nonatomic, assign)int numDificultad;

@property(nonatomic, retain)SeleccionarObject *seleccionarObject;

@property(nonatomic, retain)IBOutlet UIImageView *imagenTony;
@property(nonatomic, retain)IBOutlet UIImageView *imagenRating;
@property(nonatomic, retain)IBOutlet UIImageView *guionPictograma;
@property(nonatomic, retain)IBOutlet UIView *areaJuego;

@property(nonatomic, retain)IBOutlet UIImageView *imagenCentral;
@property(nonatomic, retain)IBOutlet UIImageView *imagenUno;
@property(nonatomic, retain)IBOutlet UIImageView *imagenDos;
@property(nonatomic, retain)IBOutlet UIImageView *imagenTres;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCuatro;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCinco;


-(void)goToConfigurarUsuariosViewController:(id)sender;
-(void)goToSeleccionarUsuariosViewController:(id)sender;

@end
