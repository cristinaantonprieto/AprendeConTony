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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    // Llamamos al storyBoard principal
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configurarUsuariosViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configurarUsuariosViewControllerID"];
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configurarUsuariosViewController animated:YES];
}




@end
