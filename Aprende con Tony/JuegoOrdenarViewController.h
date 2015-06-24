//
//  JuegoOrdenarViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 12/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "Usuario.h"
#import "JuegoCasa.h"
#import "JuegoCotidianas.h"
#import "JuegoEmociones.h"
#import "JuegoModales.h"

#import "OrdenarObject.h"

#import "SeleccionUsuariosViewController.h"
#import "NuevoUsuarioViewController.h"
#import "DashBoardViewController.h"
#import "IntermediaJuegoViewController.h"

#import <AudioToolbox/AudioServices.h>

@interface JuegoOrdenarViewController : UIViewController<UIAlertViewDelegate>
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
@property(nonatomic, retain) JuegoCotidianas *juegoCotidianas;

@property(nonatomic, retain)IBOutlet UIImageView *imagenTony;
@property(nonatomic, retain)IBOutlet UIImageView *imagenRating;
@property(nonatomic, retain)IBOutlet UIImageView *guionPictograma;
@property(nonatomic, retain)IBOutlet UIView *areaJuego;

@property(nonatomic, assign)int numFallos;
@property(nonatomic, assign)int numAciertos;
@property(nonatomic, assign)int numImagenTocada;

@property (nonatomic, assign)BOOL bienArrastrada;
@property (nonatomic, assign)BOOL accionCorrecta;


@property(nonatomic, retain)OrdenarObject *ordenarObject;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCorrectaUno;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCorrectaDos;
@property(nonatomic, retain)IBOutlet UIImageView *imagenCorrectaTres;
@property(nonatomic, retain)IBOutlet UIImageView *imagenPosUno;
@property(nonatomic, retain)IBOutlet UIImageView *imagenPosDos;
@property(nonatomic, retain)IBOutlet UIImageView *imagenPosTres;



@property(nonatomic, retain) NSTimer *temporizadorBordeRojoOrdenar;
@property(nonatomic, retain) NSTimer *temporizadorTonyOrdenar;
@property(nonatomic, retain) NSTimer *temporizadorEntreToquesOrdenar;
@property(nonatomic, retain)NSTimer *tiempoImagenFinNivelOrdenar;

@property(nonatomic, retain)NSTimer *tiempoTotalOrdenar;
@property(nonatomic, assign)int contadorTiempoTotalOrdenar;

@property(nonatomic, assign) SystemSoundID soundBien;
@property(nonatomic, assign) SystemSoundID soundOrdena;
@property(nonatomic, assign) SystemSoundID soundAplausos;



-(void)cargarVistaDelJuegoOrdenar;
-(void)cargarBotonesNavigationOrdenar;
-(void)cargarImagenesJuegoOrdenar;
-(void)goToDashViewControllerOrdenar:(id)sender;
-(void)goToSeleccionarUsuariosViewControllerOrdenar:(id)sender;


@end
