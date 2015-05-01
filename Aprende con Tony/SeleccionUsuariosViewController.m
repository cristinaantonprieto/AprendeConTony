//
//  SeleccionUsuariosViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "SeleccionUsuariosViewController.h"

@implementation SeleccionUsuariosViewController

@synthesize imagenFondo, collectionView, imagenUsuario, usuarioPhotosArray;

#pragma mark metodos inicio

- (void) viewWillAppear
{
    [super viewWillAppear:YES];
   
}

-(void)viewDidLoad
{
    NSLog(@"SeleccionUsuariosViewController: viewdidload...");
   
    
    [super viewDidLoad];
   
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
   
    /** cargar fotos de los usuarios y datos necesarios**/
    // Initialize recipe image array
    self.usuarioPhotosArray = [NSMutableArray arrayWithObjects:@"save.png",@"save.png", nil];
    
    
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




#pragma mark collection methods protocol
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.usuarioPhotosArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fondoFoto.png"]];
      
    [cell.contentView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"save.png"]]];

//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
//    recipeImageView.image = [UIImage imageNamed:[self.usuarioPhotosArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // obtenemos el nombre desde la base de datos
    NSString *password = [defaults stringForKey:@"kPassword"];
    
    //si la clave coincide pasamos a la siguiente pantalla
    if ([inputText isEqualToString:password]) {
            // Llamamos al storyBoard principal
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            // De este obtenemos el controlador con Identifier "Pantalla2"
            NuevoUsuarioViewController *nuevoUsuarioViewController = [storyBoard instantiateViewControllerWithIdentifier:@"nuevoUsuarioViewControllerID"];
            // Ahora lanzamos el controlador en el navigation de forma animada:
            [self.navigationController pushViewController:nuevoUsuarioViewController animated:YES];
    }
    
    
    
}



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
