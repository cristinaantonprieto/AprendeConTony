
//
//  JuegoEmocionesViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 13/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoEmocionesViewController.h"

@interface JuegoEmocionesViewController ()

@end

@implementation JuegoEmocionesViewController

@synthesize usuarioSeleccionado, context, nombreJuego, temporizador, juegoEmociones, nombreNivel;

-(void)viewDidLoad
{
    NSLog(@"viewDidLoad juego casa view controller.....");
    
    self.nombreJuego = @"emociones";
    self.juegoEmociones = self.usuarioSeleccionado.usuario_juegoEmociones;
    
    self.temporizador = [NSTimer scheduledTimerWithTimeInterval:0.0
                                                         target:self
                                                       selector:@selector(goToSiguienteJuegoViewController:)
                                                       userInfo:nil
                                                        repeats:NO];
    
    [super viewDidLoad];
}


-(void)goToSiguienteJuegoViewController:(id)sender
{
    NSLog(@"vamos al juego correspondiente seleccionar, emparejar, ordenar....");
    
    [self.temporizador invalidate];
    self.temporizador = nil;
    
    
    if ([self.nombreNivel isEqualToString:@"Seleccionar"]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        JuegoSeleccionarViewController *juegoSeleccionarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoSeleccionarViewControllerID"];
        juegoSeleccionarViewController.context = self.context;
        juegoSeleccionarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoSeleccionarViewController.nombreJuego = @"emociones";
        juegoSeleccionarViewController.juegoEmociones = self.juegoEmociones;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:juegoSeleccionarViewController animated:YES];
    }
    else if ([self.nombreNivel isEqualToString:@"Emparejar"]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        JuegoEmparejarViewController *juegoEmparejarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoEmparejarViewControllerID"];
        juegoEmparejarViewController.context = self.context;
        juegoEmparejarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoEmparejarViewController.nombreJuego = @"emociones";
        juegoEmparejarViewController.juegoEmociones = self.juegoEmociones;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:juegoEmparejarViewController animated:YES];
    }
    else if ([self.nombreNivel isEqualToString:@"Ordenar"]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        JuegoOrdenarViewController *juegoOrdenarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoOrdenarViewControllerID"];
        juegoOrdenarViewController.context = self.context;
        juegoOrdenarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoOrdenarViewController.nombreJuego = @"emociones";
        juegoOrdenarViewController.juegoEmociones = self.juegoEmociones;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:juegoOrdenarViewController animated:YES];
        
    }
    
    
    
    
}



@end
