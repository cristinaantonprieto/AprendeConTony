//
//  SeleccionUsuariosViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 27/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NuevoUsuarioViewController.h"
#import "Usuario.h"
#import "DashBoardViewController.h"

@interface SeleccionUsuariosViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    IBOutlet UIImageView *imagenFondo;
   //IBOutlet UICollectionView *collectionView;
    IBOutlet UIImageView *imagenUsuario;
    
     NSMutableArray *usuarioPhotosArray;
     NSMutableArray *arrayUsuarios;
    
    NSManagedObjectContext *context;
}


/** VARIABLES **/
@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) IBOutlet UIImageView *imagenUsuario;
@property (nonatomic, strong) NSMutableArray *usuarioPhotosArray;
@property (nonatomic, strong) NSMutableArray *arrayUsuarios;

@property (nonatomic, retain) NSManagedObjectContext *context;

@property (nonatomic, assign) BOOL sinUsuarios;

/** METODOS **/
-(IBAction)goToNuevoUsuarioViewController:(id)sender;

@end
