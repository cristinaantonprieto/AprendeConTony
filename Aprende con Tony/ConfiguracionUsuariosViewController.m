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

@synthesize imagenFondo, buttonSaveConfiguracion, noguardar;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    noguardar = YES;
    
    /** FIJAR BOTON BORRAR USUARIO **/
    UIButton *buttonDelete =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonDelete setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
    [buttonDelete addTarget:self action:@selector(goToEliminarUsuariosViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonDelete setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonDelete = [[UIBarButtonItem alloc] initWithCustomView:buttonDelete];
    self.navigationItem.rightBarButtonItem = barButtonDelete;
    
   
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


-(IBAction)goToEliminarUsuariosViewController:(id)sender
{
#warning funcionalidad eliminar usuario
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"¿Desea borrar el usuario?"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Cancelar"
                                            otherButtonTitles:@"Borrar",nil];
    
    [message show];
}

-(IBAction)guardarConfiguracion:(id)sender
{
#warning funcionalidad guardar configuracion y mostrar alert de guardado
    noguardar = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark alertView delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
 
#warning actualizar collection view de seleccion de usuarios ojoooooooooo
    if (buttonIndex == 1) {
        noguardar = NO;
        // Llamamos al storyBoard principal
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        SeleccionUsuariosViewController *seleccionUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:seleccionUsuarioViewController animated:YES];
    }

    
}



@end
