//
//  NuevoUsuarioViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "NuevoUsuarioViewController.h"

@interface NuevoUsuarioViewController ()

@end


@implementation NuevoUsuarioViewController

@synthesize buttonConfigurarJuegos;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** FIJAR BOTON GUARDAR USUARIO **/
    UIButton *buttonSave =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSave setImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    [buttonSave addTarget:self action:@selector(goToGuardarUsuarioViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonSave setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonSave = [[UIBarButtonItem alloc] initWithCustomView:buttonSave];
    self.navigationItem.rightBarButtonItem = barButtonSave;
    
   
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
       
        
        /** mostramos el alert que pide la contraseña **/
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Usuario no guardado"
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"Aceptar"
                                                otherButtonTitles:nil];
        
        [message show];

    }
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks buttons actions

-(IBAction)goToGuardarUsuarioViewController:(id)sender
{
#warning guardar en core data el nuevo usuario
}

-(IBAction)goToConfigurarJuegosViewController:(id)sender
{
#warning plantearse si son necesarios los datos de perfil de usuario para pasarlos
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configurarUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionUsuariosViewControllerID"];
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configurarUsuarioViewController animated:YES];
}

@end
