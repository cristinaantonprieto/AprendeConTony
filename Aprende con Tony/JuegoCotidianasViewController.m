//
//  JuegoCotidianasViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 13/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoCotidianasViewController.h"

@interface JuegoCotidianasViewController ()

@end

@implementation JuegoCotidianasViewController

@synthesize usuarioSeleccionado, context, nombreJuego, temporizador, juegoCotidianas, nombreNivel;

-(void)viewDidLoad
{
    NSLog(@"viewDidLoad juego casa view controller.....");
    
    self.nombreJuego = @"cotidianas";
    self.juegoCotidianas = self.usuarioSeleccionado.usuario_juegoCotidianas;
    
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
        juegoSeleccionarViewController.nombreJuego = @"cotidianas";
        juegoSeleccionarViewController.juegoCotidianas = self.juegoCotidianas;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:juegoSeleccionarViewController animated:YES];
    }
    else if ([self.nombreNivel isEqualToString:@"Emparejar"]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        JuegoEmparejarViewController *juegoEmparejarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoEmparejarViewControllerID"];
        juegoEmparejarViewController.context = self.context;
        juegoEmparejarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoEmparejarViewController.nombreJuego = @"cotidianas";
        juegoEmparejarViewController.juegoCotidianas = self.juegoCotidianas;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:juegoEmparejarViewController animated:YES];
    }
    else if ([self.nombreNivel isEqualToString:@"Ordenar"]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        JuegoOrdenarViewController *juegoOrdenarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoOrdenarViewControllerID"];
        juegoOrdenarViewController.context = self.context;
        juegoOrdenarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
        juegoOrdenarViewController.nombreJuego = @"cotidianas";
        juegoOrdenarViewController.juegoCotidianas = self.juegoCotidianas;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:juegoOrdenarViewController animated:YES];
        
    }
    
    
    
    
}



@end
