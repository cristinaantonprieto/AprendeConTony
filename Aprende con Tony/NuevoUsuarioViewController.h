//
//  NuevoUsuarioViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 1/5/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfiguracionUsuariosViewController.h"

@interface NuevoUsuarioViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    IBOutlet UIButton *buttonConfigurarJuegos;
}

/** VARIABLES **/
@property (nonatomic, retain) IBOutlet UIButton *buttonConfigurarJuegos;

@property (nonatomic, retain) IBOutlet UILabel *nombreLabel;
@property (nonatomic, retain) IBOutlet UILabel *edadLabel;
@property (nonatomic, retain) IBOutlet UILabel *dniLabel;
@property (nonatomic, retain) IBOutlet UILabel *tipoautismoLabel;

@property (nonatomic, retain) IBOutlet UITextField *nombreText;
@property (nonatomic, retain) IBOutlet UITextField *edadText;
@property (nonatomic, retain) IBOutlet UITextField *dniText;
@property (nonatomic, retain) IBOutlet UITextField *tipoautismoText;

@property (nonatomic, retain) NSString *nombreUser;
@property (nonatomic, retain) NSString *edadUser;
@property (nonatomic, retain) NSString *dniUser;
@property (nonatomic, retain) NSString *tipoautismoUser;

@property (nonatomic, retain) NSManagedObjectContext *context;


/** METODOS **/
-(IBAction)goToConfigurarJuegosViewController:(id)sender;
-(IBAction)goToGuardarUsuarioViewController:(id)sender;


@end






