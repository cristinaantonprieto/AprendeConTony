//
//  JuegoSeleccionarViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 9/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "JuegoSeleccionarViewController.h"

@implementation JuegoSeleccionarViewController

@synthesize usuarioSeleccionado, nombreJuego, context, numDificultad, nombreNivel;
@synthesize imagenRating, imagenTony, areaJuego, guionPictograma;
@synthesize imagenCentral, imagenCinco, imagenCuatro, imagenDos, imagenTres, imagenUno;


-(void)viewDidLoad
{
    
    /** FIJAR BOTON CONFIGURACION EN BARRA DE NAVEGACIÓN **/
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"configuracionItem.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToConfigurarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = barButton;
    
    /** FIJAR BOTON HOME EN BARRA DE NAVEGACIÓN **/
    UIButton *buttonHome =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonHome setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [buttonHome addTarget:self action:@selector(goToSeleccionarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonHome setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonH = [[UIBarButtonItem alloc] initWithCustomView:buttonHome];
    self.navigationItem.leftBarButtonItem = barButtonH;
    
    
    self.areaJuego.layer.borderColor = [UIColor yellowColor].CGColor;
    self.areaJuego.layer.borderWidth = 5.0f;
    self.areaJuego.layer.cornerRadius = 15;
    self.areaJuego.layer.masksToBounds = YES;
    
    
    
   /** cargar datos segun el juego **/
    if ([nombreJuego isEqualToString:@"casa"]) {
        
        //cargar datos para juego de seleccionar cosas de casas segun nivel
#warning cargar datos segun nivel, ropa barrer o mesa, primero probamos para una cosa que sera el de ropa
        self.seleccionarObject = [[SeleccionarObject alloc]initWithInstruccion:NombreNivelRopa];

       //////// self.imagenCentral.image = [UIImage imageNamed:self.seleccionarObject.nombreImagenCentral];

        
    }else if([nombreJuego isEqualToString:@"cotidianas"])
    {
        
    }else if([nombreJuego isEqualToString:@"modales"])
    {
        
    }else if([nombreJuego isEqualToString:@"emociones"])
    
    [super viewDidLoad];
}


-(void)loadView{
    [super loadView];
    
    
}

#pragma mark metodos botones navigation bar

-(void)goToConfigurarUsuariosViewController:(id)sender
{
    
    NSLog(@"go to configurar usuarios view controller...");
    
    /** mostramos el alert que pide la contraseña **/
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Introduce la contraseña:"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Aceptar"
                                            otherButtonTitles:nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [message show];
}

-(void)goToSeleccionarUsuariosViewController:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    SeleccionUsuariosViewController *seleccionUsuariosViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
    seleccionUsuariosViewController.context = self.context;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:seleccionUsuariosViewController animated:YES];
}


#pragma mark alertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    
    NSLog(@"password introducida: %@", inputText);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // obtenemos el nombre desde la base de datos
    NSString *password = [defaults stringForKey:@"kPassword"];
    
    //si la clave coincide pasamos a la siguiente pantalla
    if ([inputText isEqualToString:password]) {
        // Llamamos al storyBoard principal
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        NuevoUsuarioViewController *nuevoUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"nuevoUsuarioViewControllerID"];
        nuevoUsuarioViewController.context = self.context;
        nuevoUsuarioViewController.nuevoUsuario = NO;
        nuevoUsuarioViewController.persona = self.usuarioSeleccionado;
        
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:nuevoUsuarioViewController animated:YES];
    }
    
    
    
}


@end
