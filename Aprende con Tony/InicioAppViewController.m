//
//  InicioAppViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "InicioAppViewController.h"


@implementation InicioAppViewController

@synthesize imagenFondo, buttonConfiguracion, buttonPlay;


#pragma mark metodos inicio

-(void)viewDidLoad
{
    NSLog(@"InicioViewController: viewdidload...");
 
    
   
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [[UIImage imageNamed:@"PantallaIntro.png"] drawInRect:self.view.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    
    [super viewDidLoad];
    
}



#pragma mark metodos segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"seleccionUsuariosSegue"]){
        
        SeleccionUsuariosViewController * seleccionUsuariosViewController = segue.destinationViewController;
        NSLog(@"Prepare for segue: seleccion Usuarios segue");
        //segundoViewController.delegate = self;

    }else if([segue.identifier isEqualToString:@"configuracionUsuariosSegue"])
    {
        ConfiguracionUsuariosViewController *configuracionUsuariosViewController = segue.destinationViewController;
        NSLog(@"Prepare for segue: configuracion usuarios segue");
        
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

-(void)goToConfiguracionViewController:(id)sender
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
