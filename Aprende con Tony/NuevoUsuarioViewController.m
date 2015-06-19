//
//  NuevoUsuarioViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "NuevoUsuarioViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>


@interface NuevoUsuarioViewController ()

@end


@implementation NuevoUsuarioViewController

@synthesize persona,buttonConfigurarJuegos, nombreLabel, nombreText, dniLabel, dniText, edadLabel, edadText, tipoautismoLabel, tipoautismoText, imagenPerfil, buttonDelete, buttonEstadisticas;
@synthesize nombreUser, dniUser, tipoautismoUser, edadUser, context, buttonFoto, imagenUser, popoverController;
@synthesize juegoCasa, juegoCotidianas, juegoEmociones, juegoModales;

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
    
    //no se puede borrar un usuario que no esta creado
    [self.buttonDelete setEnabled:NO];
    self.buttonDelete.hidden = YES;
    [self.buttonEstadisticas setEnabled:NO];
    self.buttonEstadisticas.hidden = YES;
    
    self.nombreUser = @" ";
    self.dniUser = @" ";
    self.edadUser = @"0";
    self.imagenUser = @" ";
    self.tipoautismoUser = @" ";
    
    if (!self.nuevoUsuario) {
        //el usuario no es nuevo. entramos para modificacion
        [self.buttonDelete setEnabled:YES];
        self.buttonDelete.hidden = NO;
        [self.buttonEstadisticas setEnabled:YES];
        self.buttonEstadisticas.hidden=NO;
        
        self.nombreText.text = self.persona.nombre;
        self.dniText.text = self.persona.dni;
        self.edadText.text = [self.persona.edad stringValue];
        self.tipoautismoText.text = self.persona.tipo_autismo;
        
        self.nombreUser = self.persona.nombre;
        self.dniUser = self.persona.dni;
        self.edadUser = [self.persona.edad stringValue];
        self.tipoautismoUser = self.persona.tipo_autismo;
        self.imagenUser = self.persona.imagenUsuario;
        
        
        NSURL *referenceURL = self.persona.imagenUsuario;
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library assetForURL:referenceURL resultBlock:^(ALAsset *asset)
         {
             UIImage  *copyOfOriginalImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
             
             
             [self.imagenPerfil setImage:copyOfOriginalImage];
             self.imagenPerfil.contentMode = UIViewContentModeScaleAspectFit;
             
         }
                failureBlock:^(NSError *error)
         {
             // error handling
             NSLog(@"Error asignando foto...");
         }];
        
        
    }
    
   
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
    
    //habilitar boton juegos solo si hay usuario creado.
    
    
    switch (textField.tag) {
        case 10: //nombre
            NSLog(@"nombre: %@", nombreText.text);
            self.nombreUser = nombreText.text;
            break;
        case 11: //dni
            NSLog(@"dni: %@", dniText.text);
            self.dniUser = dniText.text;
            break;
        case 12: //tipo autismo
            NSLog(@"tipo autismo: %@", tipoautismoText.text);
            self.tipoautismoUser = tipoautismoText.text;
            break;
        case 14: //edad
            NSLog(@"edad: %@", edadText.text);
            self.edadUser = edadText.text;
            break;
        default:
            break;
    }
 
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks buttons actions

-(IBAction)goToGuardarUsuarioViewController:(id)sender
{
  
   
    if (self.nuevoUsuario) {
        
        
        //Creamos el objeto a persistir indicando la entidad y el contexto
        self.persona = (Usuario *)[NSEntityDescription
                                   insertNewObjectForEntityForName:@"Usuario"
                                   inManagedObjectContext:self.context];
        
        //Cumplimentamos los atributos del mismo
        [self.persona setNombre:self.nombreUser];
        [self.persona setDni:self.dniUser];
        
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myNumber = [f numberFromString:self.edadUser];
        [self.persona setEdad:myNumber];
        [self.persona setTipo_autismo:self.tipoautismoUser];
        [self.persona setImagenUsuario:self.imagenUser];
        
    
            /** Creamos datos por defectos para entidades de juegos **/
        self.juegoCasa =[NSEntityDescription insertNewObjectForEntityForName:@"JuegoCasa" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoCasa setNombreJuego:@"En casa"];
        [self.persona setUsuario_juegoCasa:self.juegoCasa];
        
        
        self.juegoCotidianas = [NSEntityDescription insertNewObjectForEntityForName:@"JuegoCotidianas" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoCotidianas setNombreJuego:@"Situaciones cotidianas"];
        [self.persona setUsuario_juegoCotidianas:self.juegoCotidianas];
        
        self.juegoModales = [NSEntityDescription insertNewObjectForEntityForName:@"JuegoModales" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoModales setNombreJuego:@"Buenos modales"];
        [self.persona setUsuario_juegoModales:self.juegoModales];
        
        self.juegoEmociones = [NSEntityDescription insertNewObjectForEntityForName:@"JuegoEmociones" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoEmociones setNombreJuego:@"Emociones"];
        [self.persona setUsuario_juegoEmociones:self.juegoEmociones];
        
        
        //Persistimos el objeto
        [self saveAction];
        
    }
    else //estamos modificando un usuario
    {
        //Cumplimentamos los atributos del mismo
        [self.persona setNombre:self.nombreUser];
        [self.persona setDni:self.dniUser];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myNumber = [f numberFromString:self.edadUser];
        [self.persona setEdad:myNumber];
        [self.persona setTipo_autismo:self.tipoautismoUser];
        [self.persona setImagenUsuario:self.imagenUser];
        
        NSLog(@"nuevo usuario modificado..................");
        self.juegoCasa = self.persona.usuario_juegoCasa;
        self.juegoEmociones = self.persona.usuario_juegoEmociones;
        self.juegoModales = self.persona.usuario_juegoModales;
        self.juegoCotidianas = self.persona.usuario_juegoCotidianas;
       
        
        
        [self.juegoCasa setNombreJuego:@"En casa"];
        [self.juegoCotidianas setNombreJuego:@"Situaciones cotidianas"];
        [self.juegoModales setNombreJuego:@"Buenos modales"];
        [self.juegoEmociones setNombreJuego:@"Emociones"];
        
        
    
    
        NSError *error = nil;
        if (![self.persona.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }else
        {
            /** vamos a dashboardviewcontroller **/
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
            dashboardViewController.context = self.context;
            dashboardViewController.usuarioSeleccionado = self.persona;
            dashboardViewController.juegoCasa = self.juegoCasa;
            dashboardViewController.juegoCotidianas = self.juegoCotidianas;
            dashboardViewController.juegoEmociones = self.juegoEmociones;
            dashboardViewController.juegoModales = self.juegoModales;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:dashboardViewController animated:YES];

        }
    }
    
}


- (void)saveAction {
    
    
    
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
        exit(-1);
    }else
    {
        /** vamos a dashboardviewcontroller **/
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // De este obtenemos el controlador con Identifier "Pantalla2"
        DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
        dashboardViewController.context = self.context;
        dashboardViewController.usuarioSeleccionado = self.persona;
        dashboardViewController.juegoCasa = self.juegoCasa;
        dashboardViewController.juegoCotidianas = self.juegoCotidianas;
        dashboardViewController.juegoEmociones = self.juegoEmociones;
        dashboardViewController.juegoModales = self.juegoModales;

        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:dashboardViewController animated:YES];
        
        
    }
}

-(IBAction)goToConfigurarJuegosViewController:(id)sender
{
    
    if (self.nuevoUsuario) {
        //Creamos el objeto a persistir indicando la entidad y el contexto
        self.persona = (Usuario *)[NSEntityDescription
                                   insertNewObjectForEntityForName:@"Usuario"
                                   inManagedObjectContext:self.context];
        
        //Cumplimentamos los atributos del mismo
        [self.persona setNombre:self.nombreUser];
        [self.persona setDni:self.dniUser];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myNumber = [f numberFromString:self.edadUser];
        [self.persona setEdad:myNumber];
        [self.persona setTipo_autismo:self.tipoautismoUser];
        [self.persona setImagenUsuario:self.imagenUser];
        
        
        /** Creamos datos por defectos para entidades de juegos **/
        self.juegoCasa =[NSEntityDescription insertNewObjectForEntityForName:@"JuegoCasa" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoCasa setNombreJuego:@"En casa"];
        [self.juegoCasa setSuperado:@"NO"];
        [self.persona setUsuario_juegoCasa:self.juegoCasa];
        
        self.juegoCotidianas = [NSEntityDescription insertNewObjectForEntityForName:@"JuegoCotidianas" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoCotidianas setNombreJuego:@"Situaciones cotidianas"];
        [self.juegoCotidianas setSuperado:@"NO"];
        [self.persona setUsuario_juegoCotidianas:self.juegoCotidianas];
        
        self.juegoModales = [NSEntityDescription insertNewObjectForEntityForName:@"JuegoModales" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoModales setNombreJuego:@"Buenos modales"];
          [self.juegoModales setSuperado:@"NO"];
        [self.persona setUsuario_juegoModales:self.juegoModales];
        
        self.juegoEmociones = [NSEntityDescription insertNewObjectForEntityForName:@"JuegoEmociones" inManagedObjectContext:[self.persona managedObjectContext]];
        [self.juegoEmociones setNombreJuego:@"Emociones"];
          [self.juegoEmociones setSuperado:@"NO"];
        [self.persona setUsuario_juegoEmociones:self.juegoEmociones];
        
        
        //Persistimos el objeto
        NSError *error;
        if (![self.context save:&error]) {
            NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
            exit(-1);
        }
    }
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    ConfiguracionUsuariosViewController *configurarUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"configuracionUsuariosViewControllerID"];
    configurarUsuarioViewController.context = self.context;
    configurarUsuarioViewController.nuevoUsuario = self.nuevoUsuario;
    configurarUsuarioViewController.usuarioSeleccionado = self.persona;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:configurarUsuarioViewController animated:YES];
}

-(IBAction)actionButtonFoto:(id)sender
{
   // Abrir popover seleccionar foto y guardarla como informacion del usuario;

    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    	imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    
 

    // Establece el origen de la imagen
    imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    // Agrega la vista del controlador a la pantalla
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        popoverController = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
    }
    else
        [self presentViewController:imagePicker animated:YES completion:nil];
    
    
    UIButton *tappedButton = (UIButton *)sender;
    //presentar el popover desde el boton pulsado
    [popoverController presentPopoverFromRect:tappedButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (!self.nuevoUsuario) {
        
        //no es nuevo usuario borramos.
        if (buttonIndex == 1) {
            NSLog(@"da acceso a borrar...");
            [self.context deleteObject:self.persona];
            
            NSError *error;
            if (![self.context save:&error]) {
                NSLog(@"Error de Core Data %@, %@", error, [error userInfo]);
                exit(-1);
            }
            
            // Llamamos al storyBoard principal
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            SeleccionUsuariosViewController *seleccionUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"seleccionUsuariosViewControllerID"];
            seleccionUsuarioViewController.context = self.context;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:seleccionUsuarioViewController animated:YES];

            
        }
        
    }
    
    // After saving iamge, dismiss camera
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *selectedImage = [[UIImage alloc]init];
    
    selectedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    if (selectedImage == nil)
        selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // Do something with the image
    
    
    NSURL *referenceURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:referenceURL resultBlock:^(ALAsset *asset)
     {
         
         
         
         UIImage  *copyOfOriginalImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
         
         
         [self.imagenPerfil setImage:copyOfOriginalImage];
         self.imagenPerfil.contentMode = UIViewContentModeScaleAspectFit;
         
         self.persona.imagenUsuario = referenceURL;
         self.imagenUser = referenceURL;
         
         
     }
            failureBlock:^(NSError *error)
     {
         // error handling
         NSLog(@"Error asignando foto...");
     }];
    
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    [self.view setNeedsDisplay];
    
}





- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    
    // Unable to save the image
    if (error)
        alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                           message:@"Imagen NO guardada a Photo Album."
                                          delegate:self cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil];
    else // All is well
        alert = [[UIAlertView alloc] initWithTitle:@"Correcto"
                                           message:@"Imagen guardada a Photo Album."
                                          delegate:self cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil];
    
    
    [alert show];
  
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:NO completion:nil];

}


- (void)updatePhotoButton {
         
        [self.buttonConfigurarJuegos setImage:self.persona.imagenUsuario forState:UIControlStateNormal];
        if (self.persona.imagenUsuario!=nil) {
            [self.buttonConfigurarJuegos setImage:self.persona.imagenUsuario forState:UIControlStateNormal];
        }else {
            [self.buttonConfigurarJuegos setImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
        }
    
}

-(void)deleteUsuario:(id)sender
{
    NSLog(@"delete usuario.....");
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"¿Desea borrar el usuario?"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Cancelar"
                                            otherButtonTitles:@"Borrar",nil];
    
    [message show];
}


-(IBAction)actionButtonEstadisticas:(id)sender
{
    NSLog(@"Ver estadisticas....");
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    EstadisticasViewController *estadisticasViewController = [storyBoard instantiateViewControllerWithIdentifier:@"estadisticasViewControllerID"];
    estadisticasViewController.context = self.context;
    estadisticasViewController.persona = self.persona;
    estadisticasViewController.juegoEmociones = self.juegoEmociones;
    estadisticasViewController.juegoCasa = self.juegoCasa;
    estadisticasViewController.juegoCotidianas = self.juegoCotidianas;
    estadisticasViewController.juegoModales= self.juegoModales;
    
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:estadisticasViewController animated:YES];
    
}


@end
