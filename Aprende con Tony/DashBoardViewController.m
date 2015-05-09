//
//  DashBoardViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "DashBoardViewController.h"

@interface DashBoardViewController ()

@end

@implementation DashBoardViewController

@synthesize context, usuarioSeleccionado, imagentony, guionPictogramas;
@synthesize buttonCasa, buttonCotidianas, buttonEmociones, buttonModales;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"usuario seleccionado nombre = %@", self.usuarioSeleccionado.nombre);
    
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
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // Navigation button was pressed. Do some stuff
        [self.navigationController popViewControllerAnimated:NO];
    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark metodos segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"configurarUsuariosSegue"]){
        
       ConfiguracionUsuariosViewController * configurarUsuariosViewController = segue.destinationViewController;
     
        //segundoViewController.delegate = self;
        
    }
}


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

#pragma mark action buttons juegos



-(IBAction)actionButtonCasa:(id)sender //juego uno
{

  
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    IntermediaJuegoViewController *intermediaViewController = [storyBoard instantiateViewControllerWithIdentifier:@"intermediaViewControllerID"];
    intermediaViewController.context = self.context;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    intermediaViewController.numJuego = 1;
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:intermediaViewController animated:YES];
}


-(IBAction)actionButtonCotidianas:(id)sender //juego dos
{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    IntermediaJuegoViewController *intermediaViewController = [storyBoard instantiateViewControllerWithIdentifier:@"intermediaViewControllerID"];
    intermediaViewController.context = self.context;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
     intermediaViewController.numJuego = 2;
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:intermediaViewController animated:YES];
}

-(IBAction)actionButtonModales:(id)sender; //juego tres
{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    IntermediaJuegoViewController *intermediaViewController = [storyBoard instantiateViewControllerWithIdentifier:@"intermediaViewControllerID"];
    intermediaViewController.context = self.context;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
     intermediaViewController.numJuego = 3;
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:intermediaViewController animated:YES];
}

-(IBAction)actionButtonEmociones:(id)sender //juego cuatro
{
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    IntermediaJuegoViewController *intermediaViewController = [storyBoard instantiateViewControllerWithIdentifier:@"intermediaViewControllerID"];
    intermediaViewController.context = self.context;
    
    intermediaViewController.usuarioSeleccionado = self.usuarioSeleccionado;
    intermediaViewController.numJuego = 4;
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:intermediaViewController animated:YES];
}


@end
