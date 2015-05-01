//
//  InicioAppViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "InicioAppViewController.h"


@implementation InicioAppViewController

@synthesize imagenFondo, buttonPlay;


#pragma mark metodos inicio

-(void)viewDidLoad
{
    NSLog(@"InicioViewController: viewdidload...");
 
    
    [super viewDidLoad];
    
    /** conseguimos la contraseña **/
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // obtenemos el nombre desde la base de datos
    NSString *password = [defaults stringForKey:@"kPassword"];
    if (password != nil)
    {
        NSLog(@"pass: %@", password);
    }else
    {
        //guardarmos un valor para ella
        [defaults setObject:@"123" forKey:@"kPassword"];
        password =[defaults stringForKey:@"kPassword"];
        
    }
     NSLog(@"pass: %@", password);
    
    [defaults synchronize];
    
    
}



#pragma mark metodos segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"seleccionUsuariosSegue"]){
        
        SeleccionUsuariosViewController * seleccionUsuariosViewController = segue.destinationViewController;
        NSLog(@"Prepare for segue: seleccion Usuarios segue");
        //segundoViewController.delegate = self;

    }
}

-(void)goToSeleccionUsuariosViewController:(id)sender
{
    NSLog(@"go to seleccion usuarios view controller...");
    // Llamamos al storyBoard principal
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    SeleccionUsuariosViewController *seleccionUsuariosViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:seleccionUsuariosViewController animated:YES];
}



@end
