//
//  ConfiguracionUsuariosViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 28/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "ConfiguracionUsuariosViewController.h"


@interface ConfiguracionUsuariosViewController ()

@end

@implementation ConfiguracionUsuariosViewController

@synthesize imagenFondo, buttonSaveConfiguracion, noguardar, context, nuevoUsuario, usuarioSeleccionado;
@synthesize juegoModales, juegoEmociones, juegoCotidianas, juegoCasa;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    noguardar = YES;
    
    if (!nuevoUsuario) { //si no es nuevo usuario se tienen que cargar los datos para el usuario. y mostrarlos en los textfield
        
        self.juegoCasa = self.usuarioSeleccionado.usuario_juegoCasa;
       
        self.juegoEmociones = self.usuarioSeleccionado.usuario_juegoEmociones;
        
        self.juegoModales = self.usuarioSeleccionado.usuario_juegoModales;
        
        self.juegoCotidianas = self.usuarioSeleccionado.usuario_juegoCotidianas;
      
        NSLog(@"configurar usuarios view controlle........ no nuevo usuario.......");
         NSLog(@"juego casa nombre y nivel = %@   %d", self.juegoCasa.nombreJuego, self.juegoCasa.num_nivel.intValue);
        NSLog(@"juego emociones nombre y nivel = %@   %d", self.juegoEmociones.nombreJuego, self.juegoEmociones.num_nivel.intValue);
        NSLog(@"juego modales nombre y nivel = %@   %d", self.juegoModales.nombreJuego, self.juegoModales.num_nivel.intValue);
          NSLog(@"juego cotidianas nombre y nivel = %@   %d", self.juegoCotidianas.nombreJuego, self.juegoCotidianas.num_nivel.intValue);
        NSLog(@"......................configurar usuarios view controlle........ no nuevo usuario");

        
        
    }

    
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if (!nuevoUsuario) { //si no es nuevo usuario se tienen que cargar los datos para el usuario. y mostrarlos en los textfield
        
        self.juegoCasa = self.usuarioSeleccionado.usuario_juegoCasa;
        
        self.juegoEmociones = self.usuarioSeleccionado.usuario_juegoEmociones;
        
        self.juegoModales = self.usuarioSeleccionado.usuario_juegoModales;
        
        self.juegoCotidianas = self.usuarioSeleccionado.usuario_juegoCotidianas;
        
        NSLog(@"configurar usuarios view controlle........ no nuevo usuario.......");
        NSLog(@"juego casa nombre y nivel = %@   %d", self.juegoCasa.nombreJuego, self.juegoCasa.num_nivel.intValue);
        NSLog(@"juego emociones nombre y nivel = %@   %d", self.juegoEmociones.nombreJuego, self.juegoEmociones.num_nivel.intValue);
        NSLog(@"juego modales nombre y nivel = %@   %d", self.juegoModales.nombreJuego, self.juegoModales.num_nivel.intValue);
        NSLog(@"juego cotidianas nombre y nivel = %@   %d", self.juegoCotidianas.nombreJuego, self.juegoCotidianas.num_nivel.intValue);
        NSLog(@"......................configurar usuarios view controlle........ no nuevo usuario");
        
        
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
}

#pragma mark metodos botones

-(IBAction)goToConfigurarCasaViewController:(id)sender{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionCaracteristicasJuegosViewController *configuracionCaracteristicasViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionesCaracteristicasJuegosID"];
    configuracionCaracteristicasViewController.nombreJuego = @"En casa";
    configuracionCaracteristicasViewController.nuevoUsuario = self.nuevoUsuario;
    configuracionCaracteristicasViewController.context = self.context;
    configuracionCaracteristicasViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configuracionCaracteristicasViewController animated:YES];
}
-(IBAction)goToConfigurarCotidianasViewController:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionCaracteristicasJuegosViewController *configuracionCaracteristicasViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionesCaracteristicasJuegosID"];
    configuracionCaracteristicasViewController.nombreJuego = @"Situaciones cotidianas";
    configuracionCaracteristicasViewController.nuevoUsuario = self.nuevoUsuario;
    configuracionCaracteristicasViewController.context = self.context;
    configuracionCaracteristicasViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configuracionCaracteristicasViewController animated:YES];
}
-(IBAction)goToConfigurarModalesViewController:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionCaracteristicasJuegosViewController *configuracionCaracteristicasViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionesCaracteristicasJuegosID"];
    configuracionCaracteristicasViewController.nombreJuego = @"Buenos modales";
    configuracionCaracteristicasViewController.nuevoUsuario = self.nuevoUsuario;
    configuracionCaracteristicasViewController.context = self.context;
    configuracionCaracteristicasViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configuracionCaracteristicasViewController animated:YES];
}
-(IBAction)goToConfigurarEmocionesViewController:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionCaracteristicasJuegosViewController *configuracionCaracteristicasViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionesCaracteristicasJuegosID"];
    configuracionCaracteristicasViewController.nombreJuego = @"Emociones";
    configuracionCaracteristicasViewController.nuevoUsuario = self.nuevoUsuario;
    configuracionCaracteristicasViewController.context = self.context;
    configuracionCaracteristicasViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configuracionCaracteristicasViewController animated:YES];
}








@end
