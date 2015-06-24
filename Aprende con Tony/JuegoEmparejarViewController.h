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
#import "JuegoModales.h"
#import "JuegoEmociones.h"
#import "JuegoCotidianas.h"

#import "EmparejarObject.h"

#import "SeleccionUsuariosViewController.h"
#import "NuevoUsuarioViewController.h"
#import "DashBoardViewController.h"
#import "IntermediaJuegoViewController.h"

#import <AudioToolbox/AudioServices.h>

@interface JuegoEmparejarViewController : UIViewController
{
    
}

@property(nonatomic, retain) NSString *nombreJuego; //casa, cotidianas, modales, emociones
@property(nonatomic, retain) NSString *nombreNivel; //ropa, barrer, ....

@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;
@property(nonatomic, assign)int numDificultad;


@property(nonatomic, retain) JuegoCasa *juegoCasa;
@property(nonatomic, retain) JuegoModales *juegoModales;
@property(nonatomic, retain) JuegoEmociones *juegoEmociones;
@property (nonatomic, retain) JuegoCotidianas *juegoCotidianas;


@property(nonatomic, retain)IBOutlet UIImageView *imagenTony;
@property(nonatomic, retain)IBOutlet UIImageView *imagenRating;
@property(nonatomic, retain)IBOutlet UIImageView *guionPictograma;
@property(nonatomic, retain)IBOutlet UIView *areaJuego;

@property(nonatomic, assign)int numFallos;
@property(nonatomic, assign)int numAciertos;
@property(nonatomic, assign)int numImagenTocada;
@property (nonatomic, assign)BOOL bienArrastrada;
@property (nonatomic, assign)BOOL accionCorrecta;


@property(nonatomic, retain)EmparejarObject *emparejarObject;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCentral;
@property(nonatomic, retain)IBOutlet UIImageView *imagenUno;
@property(nonatomic, retain)IBOutlet UIImageView *imagenDos;
@property(nonatomic, retain)IBOutlet UIImageView *imagenTres;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCuatro;


@property(nonatomic, retain) NSTimer *temporizadorBordeRojo;
@property(nonatomic, retain) NSTimer *temporizadorTony;
@property(nonatomic, retain) NSTimer *temporizadorEntreToquesEmparejar;
@property(nonatomic, retain)NSTimer *tiempoImagenFinNivel;

@property(nonatomic, retain)NSTimer *tiempoTotalEmparejar;
@property(nonatomic, assign)int contadorTiempoTotalEmparejar;

@property(nonatomic, assign) SystemSoundID soundBien;
@property(nonatomic, assign) SystemSoundID soundArrastra;
@property(nonatomic, assign) SystemSoundID soundAplausos;


-(void)cargarVistaDelJuego;
-(void)cargarBotonesNavigation;
-(void)cargarImagenesJuego;
-(void)goToDashViewController:(id)sender;
-(void)goToSeleccionarUsuariosViewController:(id)sender;


@end
