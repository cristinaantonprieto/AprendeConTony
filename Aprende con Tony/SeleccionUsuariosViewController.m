//
//  SeleccionUsuariosViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "SeleccionUsuariosViewController.h"
#import <CoreData/CoreData.h>

@implementation SeleccionUsuariosViewController

@synthesize imagenFondo, collectionView, imagenUsuario, usuarioPhotosArray, context, arrayUsuarios;

#pragma mark metodos inicio

- (void) viewWillAppear
{
    [super viewWillAppear:YES];
   
}

-(void)viewDidLoad
{
    NSLog(@"SeleccionUsuariosViewController: viewdidload...");
   
    
    [super viewDidLoad];
    
    
    [self loadUsuarios];
   
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
   
    /** cargar fotos de los usuarios y datos necesarios**/
    // Initialize recipe image array
    self.usuarioPhotosArray = [[NSMutableArray alloc] init];
    self.arrayUsuarios = [[NSMutableArray alloc] init];
    
    
    /** FIJAR BOTON NUEVO USUARIO **/
    UIButton *buttonAdd =  [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonAdd setImage:[UIImage imageNamed:@"addUser.png"] forState:UIControlStateNormal];
    [buttonAdd addTarget:self action:@selector(goToNuevoUsuarioViewController:)forControlEvents:UIControlEventTouchUpInside];
    [buttonAdd setFrame:CGRectMake(0, 0, 34, 34)];
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc] initWithCustomView:buttonAdd];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    
    [self.view addSubview:self.collectionView];
    
#warning revisar esto aquí y la carga del array.
    [self.collectionView reloadData];
}




-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // Navigation button was pressed. Do some stuff
        [self.navigationController popViewControllerAnimated:NO];
    }
    
    self.usuarioPhotosArray = nil;
    
    [super viewWillDisappear:animated];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
#warning ojo quitar esto de aquí solo por pruebas.
    
    [self loadUsuarios];
    
}

#pragma mark core data
-(void) loadUsuarios
{
    
    //Fetch
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:[NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:self.context]];
    fetch.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"nombre" ascending:YES]];
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:fetch managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];
  //  self.fetchedResultsController = results;
    NSArray *array = [context executeFetchRequest:fetch error:nil];
    
    self.arrayUsuarios = [array mutableCopy];
    
    for (int i=0; i<self.arrayUsuarios.count; i++) {
        
        Usuario *user = [self.arrayUsuarios objectAtIndex:i];
        
        NSLog(@"user.nombre = %@", user.nombre);
        NSLog(@"user.imagenUsuario = %@", user.imagenUsuario);
        [self.usuarioPhotosArray addObject:user.imagenUsuario];
    }
 
    
    
    if (array ==nil) {
        NSLog(@"array vacio");
        self.sinUsuarios = YES;
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Pulsa el botón añadir para crear un nuevo usuario"
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"Aceptar"
                                                otherButtonTitles:nil];
        
        [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
        
        [message show];

    }else
    {
        self.sinUsuarios = NO;
    }
}

#pragma mark collection methods protocol
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    

   return self.arrayUsuarios.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    //carga de la imagen
    NSURL *referenceURL = [self.usuarioPhotosArray objectAtIndex:indexPath.row];
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:referenceURL resultBlock:^(ALAsset *asset)
     {
         
         
         UIImage  *copyOfOriginalImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
        
         cell.backgroundView = [[UIImageView alloc] initWithImage:copyOfOriginalImage];
         cell.backgroundView.contentMode = UIViewContentModeScaleAspectFit;
         
         
     }
            failureBlock:^(NSError *error)
     {
         // error handling
         NSLog(@"Error asignando foto...");
     }];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Usuario *userSeleccionado = [self.arrayUsuarios objectAtIndex:indexPath.row];
    
    /** vamos a dashboardviewcontroller **/
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // De este obtenemos el controlador con Identifier "Pantalla2"
    DashBoardViewController *dashboardViewController = [storyBoard instantiateViewControllerWithIdentifier:@"dashBoardViewControllerID"];
    dashboardViewController.context = self.context;
    dashboardViewController.usuarioSeleccionado = userSeleccionado;
    // Ahora lanzamos el controlador en el navigation de forma animada:
    [self.navigationController pushViewController:dashboardViewController animated:YES];
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
    
    if (!self.sinUsuarios) {
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        // obtenemos el nombre desde la base de datos
        NSString *password = [defaults stringForKey:@"kPassword"];
        
        //si la clave coincide pasamos a la siguiente pantalla
        if ([inputText isEqualToString:password]) {
            // Llamamos al storyBoard principal
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            NuevoUsuarioViewController *nuevoUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"nuevoUsuarioViewControllerID"];
            nuevoUsuarioViewController.context = self.context;
            nuevoUsuarioViewController.nuevoUsuario = YES;
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:nuevoUsuarioViewController animated:YES];
        }
    }
    
    
}

#pragma mark segues

-(void)goToNuevoUsuarioViewController:(id)sender
{
    NSLog(@"gotonuevousuarioviewcontroller....");
    
    
    /** mostramos el alert que pide la contraseña **/
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Introduce la contraseña:"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Aceptar"
                                            otherButtonTitles:nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [message show];

}

@end
