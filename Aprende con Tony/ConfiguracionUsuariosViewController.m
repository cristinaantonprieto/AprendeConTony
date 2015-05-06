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

@synthesize imagenFondo, buttonSaveConfiguracion, noguardar, context;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    noguardar = YES;
    

    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        
        if (noguardar) {
            
            
            /** mostramos el alert que pide la contraseña **/
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Configuración no guardada"
                                                              message:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Aceptar"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
    }
    [super viewWillDisappear:animated];
}




-(IBAction)guardarConfiguracion:(id)sender
{
    noguardar = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark alertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
 
    if (buttonIndex == 1) {
        noguardar = NO;
        // Llamamos al storyBoard principal
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        SeleccionUsuariosViewController *seleccionUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
        seleccionUsuarioViewController.context = self.context;
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:seleccionUsuarioViewController animated:YES];
    }

    
}



@end
