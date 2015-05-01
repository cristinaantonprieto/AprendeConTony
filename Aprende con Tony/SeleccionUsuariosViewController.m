//
//  SeleccionUsuariosViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "SeleccionUsuariosViewController.h"

@implementation SeleccionUsuariosViewController

@synthesize imagenFondo;

#pragma mark metodos inicio

- (void) viewWillAppear
{
    [super viewWillAppear:YES];
   
}

-(void)viewDidLoad
{
    NSLog(@"SeleccionUsuariosViewController: viewdidload...");
   
    
    [super viewDidLoad];
    
    
 
    

    /** FIJAR BOTON NUEVO USUARIO **/
    UIButton *buttonAdd =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonAdd setImage:[UIImage imageNamed:@"addUser.png"] forState:UIControlStateNormal];
    [buttonAdd addTarget:self action:@selector(goToNuevoUsuarioViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonAdd setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithCustomView:buttonAdd];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    
    
}



-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // Navigation button was pressed. Do some stuff
        [self.navigationController popViewControllerAnimated:NO];
    }
    [super viewWillDisappear:animated];
}



#pragma mark SEGUES

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if([segue.identifier isEqualToString:@"nuevoUsuarioViewControllerSegue"])
//    {
//
//        NuevoUsuarioViewController *nuevoUsuarioViewController = segue.destinationViewController;
//        NSLog(@"Prepare for segue: configuracion usuarios segue");
//        
//    }
//    
//}

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
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:nuevoUsuarioViewController animated:YES];
    }
    
    
    
}



-(void)goToNuevoUsuarioViewController:(id)sender
{
    NSLog(@"gotonuevousuarioviewcontroller....");
    
    /** mostramos el alert que pide la contraseña **/
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Introudce la contraseña:"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Aceptar"
                                            otherButtonTitles:nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [message show];

}

@end
