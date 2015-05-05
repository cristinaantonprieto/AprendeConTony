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

@synthesize persona,buttonConfigurarJuegos, nombreLabel, nombreText, dniLabel, dniText, edadLabel, edadText, tipoautismoLabel, tipoautismoText, imagenPerfil;
@synthesize nombreUser, dniUser, tipoautismoUser, edadUser, context, buttonFoto, imagenUser, popoverController;

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
    
    
  
    [self.buttonConfigurarJuegos setEnabled:NO]; //hasta que no se haya guardado el nuevo usuario no se habilita el boton.
    
   
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
 
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
#warning cambiar esto de aqui, se habilita el boton de configurar juegos solo si se tienen datos para el usuario.

    [self.buttonConfigurarJuegos setEnabled:YES];
    
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
    
    if ([self.nombreUser isEqualToString:@""]|| self.nombreUser==nil) {
        self.nombreUser = @" ";
    }
    if ([self.dniUser isEqualToString:@""]|| self.dniUser==nil) {
        self.dniUser = @" ";
    }
    if ([self.edadUser isEqualToString:@""]|| self.edadUser==nil) {
        self.edadUser = @" ";
    }
    if ([self.tipoautismoUser isEqualToString:@""]|| self.tipoautismoUser==nil) {
        self.tipoautismoUser = @" ";
    }
    
    if ([self.imagenUser isEqualToString:@""]|| self.imagenUser == nil) {
         self.imagenUser = @" ";
    }
   
    
    
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
    
    
#warning esto será con las configuraciones de los juegos por defecto ojoooo cambiarlo!!!!!!!
    
    /*****/
    Juegos *partida = [NSEntityDescription insertNewObjectForEntityForName:@"Juegos" inManagedObjectContext:[self.persona managedObjectContext]];
    
				// Presumably the tag was added for the current event, so relate it to the event.
    [self.persona setUsuarioJuegos:partida];
    
				// Add the new tag to the tags array and to the table view.
    partida.voz = @"YES";
    /***/
    
    
    //Persistimos el objeto
    [self saveAction];
    
    
    
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
        // Ahora lanzamos el controlador en el navigation de forma animada:
        [self.navigationController pushViewController:dashboardViewController animated:YES];
        
        
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

-(IBAction)actionButtonFoto:(id)sender
{
   // Abrir popover seleccionar foto y guardarla como informacion del usuario;
    NSLog(@"action button foto....");
    
    
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
       
        
        
         /**/
         if (self.persona == nil) {
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
             [self.persona setImagenUsuario:referenceURL];
         }
         
         /**/
         [self.imagenPerfil setImage:copyOfOriginalImage];
         self.imagenPerfil.contentMode = UIViewContentModeScaleAspectFit;
         
         self.persona.imagenUsuario = referenceURL;
     
   
  
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




- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)selectedImage editingInfo:(NSDictionary *)editingInfo {
    
    
    // crear un objeto de imagen para la nueva foto
 //   if (!usuarioCreadoAntes) {
        
   //     Imagen *image = [NSEntityDescription insertNewObjectForEntityForName:@"Imagen" inManagedObjectContext:usuario.managedObjectContext];
        
        self.persona.imagenUsuario = selectedImage;
     //   [image setValue:selectedImage forKey:@"image"];
 //   }
  
    
        CGSize size = selectedImage.size;
        
        CGFloat ratio = 0;
        if (size.width > size.height) {
            ratio = 200.0 / size.width;
        } else {
            ratio = 200.0 / size.height;
        }
        CGRect rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
        
        UIGraphicsBeginImageContext(rect.size);
        [selectedImage drawInRect:rect];
        self.persona.imagenUsuario = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //poner la nueva foto seleccionada en la pantalla
        [self.buttonConfigurarJuegos setImage:self.persona.imagenUsuario forState:UIControlStateNormal];
      //  [botonAux setImage:self.imagenUser.imagenUser forState:UIControlStateNormal];
        
    
    
        [self.buttonConfigurarJuegos setImage:self.persona.imagenUsuario forState:UIControlStateNormal];
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


@end
