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

@synthesize buttonConfigurarJuegos, nombreLabel, nombreText, dniLabel, dniText, edadLabel, edadText, tipoautismoLabel, tipoautismoText;
@synthesize nombreUser, dniUser, tipoautismoUser, edadUser, context;

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
    
    self.nombreText.delegate = self;
    self.nombreText.tag = 10;
    self.dniText.delegate = self;
    self.dniText.tag = 11;
    self.tipoautismoText.delegate = self;
    self.tipoautismoText.tag = 12;
    self.edadText.delegate = self;
    self.edadText.tag = 14;
    
   
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

#pragma mark textfield delegate methods

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 10: //nombre
            NSLog(@"nombre: %@", nombreText.text);
            break;
        case 11: //dni
            NSLog(@"dni: %@", dniText.text);
            break;
        case 12: //tipo autismo
            NSLog(@"tipo autismo: %@", tipoautismoText.text);
            break;
        case 14: //edad
            NSLog(@"edad: %@", edadText.text);
            break;
        default:
            break;
    }

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks buttons actions

-(IBAction)goToGuardarUsuarioViewController:(id)sender
{
#warning guardar en core data el nuevo usuario
    NSLog(@"guardar nuevo usuario....");
    
    self.nombreUser = self.nombreText.text;
    self.dniUser = self.dniText.text;
    self.edadUser = self.edadText.text;
    self.tipoautismoUser = self.tipoautismoText.text;
    
    
    //Creamos el objeto a persistir indicando la entidad y el contexto
    Usuario* persona = (Usuario *)[NSEntityDescription
                                   insertNewObjectForEntityForName:@"Usuario"
                                   inManagedObjectContext:self.context];
    
    //Cumplimentamos los atributos del mismo
    [persona setNombre:self.nombreUser];
    [persona setDni:self.dniUser];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:self.edadUser];
    [persona setEdad:myNumber];
    [persona setTipo_autismo:self.tipoautismoUser];
    
    //Persistimos el objeto
    [self saveAction];
    
}


- (void)saveAction {
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }
}

-(IBAction)goToConfigurarJuegosViewController:(id)sender
{
#warning plantearse si son necesarios los datos de perfil de usuario para pasarlos
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configurarUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionUsuariosViewControllerID"];
    configurarUsuarioViewController.context = self.context;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configurarUsuarioViewController animated:YES];
}

@end
