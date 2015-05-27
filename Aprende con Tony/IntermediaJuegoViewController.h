//
//  IntermediaJuegoViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 7/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Usuario.h"
#import "JuegoCasaViewController.h"
#import "JuegoCotidianasViewController.h"
#import "JuegoModalesViewController.h"
#import "JuegoEmocionesViewController.h"

@interface IntermediaJuegoViewController : UIViewController
{
    int tiempoIncremento;
}

@property(nonatomic, retain) IBOutlet UIImageView *imagenFondo;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) Usuario *usuarioSeleccionado;

@property (nonatomic, retain) IBOutlet UIImageView *bolaUno;
@property (nonatomic, retain) IBOutlet UIImageView *bolaDos;
@property (nonatomic, retain) IBOutlet UIImageView *bolaTres;
@property (nonatomic, retain) IBOutlet UIImageView *pictograma;

@property (nonatomic, retain)NSString *nombreNivel;


@property(nonatomic, assign)int tiempoIncremento;
@property(nonatomic, retain) NSTimer *temporizador;
@property(nonatomic, assign) int numJuego;



-(void)comienzaTiempo:(NSTimer *) elContador;
- (void)reiniciarTiempo:(id)sender;
- (void)terminarTiempo:(id)sender;


@end
