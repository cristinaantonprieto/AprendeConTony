//
//  NuevoUsuarioViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"
#import "DashBoardViewController.h"
#import "Usuario.h"
#import "Juegos.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface NuevoUsuarioViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate, UIPopoverControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIButton *buttonConfigurarJuegos;
}

/** VARIABLES **/
@property (nonatomic, retain) IBOutlet UIButton *buttonConfigurarJuegos;
@property (nonatomic, retain) IBOutlet UIButton *buttonFoto;

@property (nonatomic, retain) Usuario* persona;

@property (nonatomic, retain) IBOutlet UILabel *nombreLabel;
@property (nonatomic, retain) IBOutlet UILabel *edadLabel;
@property (nonatomic, retain) IBOutlet UILabel *dniLabel;
@property (nonatomic, retain) IBOutlet UILabel *tipoautismoLabel;

@property (nonatomic, weak) IBOutlet UITextField *nombreText;
@property (nonatomic, weak) IBOutlet UITextField *edadText;
@property (nonatomic, weak) IBOutlet UITextField *dniText;
@property (nonatomic, weak) IBOutlet UITextField *tipoautismoText;

@property (nonatomic, retain) NSString *nombreUser;
@property (nonatomic, retain) NSString *edadUser;
@property (nonatomic, retain) NSString *dniUser;
@property (nonatomic, retain) NSString *tipoautismoUser;
@property (nonatomic, retain) NSString *imagenUser;

@property (nonatomic, retain) IBOutlet UIImageView *imagenPerfil;

@property (nonatomic, retain) UIPopoverController *popoverController;

@property (nonatomic, retain) NSManagedObjectContext *context;


/** METODOS **/
-(IBAction)goToConfigurarJuegosViewController:(id)sender;
-(IBAction)goToGuardarUsuarioViewController:(id)sender;
-(IBAction)actionButtonFoto:(id)sender;

@end






