//
//  JuegoCasaViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoCasaViewController.h"

@implementation JuegoCasaViewController

@synthesize usuarioSeleccionado, context, nombreJuego, temporizador, juegoCasa;

-(void)viewDidLoad
{
    NSLog(@"viewDidLoad juego casa view controller.....");
    
    self.nombreJuego = @"casa";
    self.juegoCasa = self.usuarioSeleccionado.usuario_juegoCasa;
    
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
    
    #warning habría que comprobar el numero de juego para cargar seleccionar/emparejar o ordenar view controller, de momento se carga siempre seleccionar como primera alternativa. Y PASAR LA INSTANCIA DE JUEGO
    
    switch (self.juegoCasa.num_nivel.intValue) {
        case 1:
        {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            JuegoSeleccionarViewController *juegoSeleccionarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoSeleccionarViewControllerID"];
            juegoSeleccionarViewController.context = self.context;
            juegoSeleccionarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            juegoSeleccionarViewController.nombreJuego = @"casa";
            juegoSeleccionarViewController.juegoCasa = self.juegoCasa;
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:juegoSeleccionarViewController animated:YES];
            
        }
        break;
        case 2:
        {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            JuegoEmparejarViewController *juegoEmparejarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoEmparejarViewControllerID"];
            juegoEmparejarViewController.context = self.context;
            juegoEmparejarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            juegoEmparejarViewController.nombreJuego = @"casa";
            juegoEmparejarViewController.juegoCasa = self.juegoCasa;
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:juegoEmparejarViewController animated:YES];
        }
        break;
        case 3:
        {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            JuegoOrdenarViewController *juegoOrdenarViewController = [storyBoard instantiateViewControllerWithIdentifier:@"juegoOrdenarViewControllerID"];
            juegoOrdenarViewController.context = self.context;
            juegoOrdenarViewController.usuarioSeleccionado = self.usuarioSeleccionado;
            juegoOrdenarViewController.nombreJuego = @"casa";
            juegoOrdenarViewController.juegoCasa = self.juegoCasa;
            
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:juegoOrdenarViewController animated:YES];
            
        }
        break;
            
        default:
            break;
    }
    
   
}



@end
