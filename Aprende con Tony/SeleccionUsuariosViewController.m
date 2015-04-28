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
    
    
    /** FIJAR BOTON CONFIGURACION EN BARRA DE NAVEGACIÓN **/
    UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"configuracionItem.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToConfigurarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
    
    
}



-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // Navigation button was pressed. Do some stuff
        [self.navigationController popViewControllerAnimated:NO];
    }
    [super viewWillDisappear:animated];
}



#pragma mark SEGUES

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"configuracionUsuariosSegue"])
    {
        ConfiguracionUsuariosViewController *configuracionUsuariosViewController = segue.destinationViewController;
        NSLog(@"Prepare for segue: configuracion usuarios segue");
        
    }
    
}



-(void)goToConfigurarUsuariosViewController:(id)sender
{
    NSLog(@"gotoconfiguracionviewcontroller....");
    // Llamamos al storyBoard principal
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configuracionUsuariosViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionUsuariosViewControllerID"];
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configuracionUsuariosViewController animated:YES];
}

@end
