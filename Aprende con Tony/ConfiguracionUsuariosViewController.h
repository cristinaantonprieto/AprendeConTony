//
//  ConfiguracionUsuariosViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 28/4/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeleccionUsuariosViewController.h"

@interface ConfiguracionUsuariosViewController : UIViewController
{
    IBOutlet UIImageView *imagenFondo;
    IBOutlet UIButton *buttonSaveConfiguracion;
    BOOL noguardar;
    
}


/** VARIABLES **/

@property(nonatomic, assign) BOOL noguardar;
@property (nonatomic, retain) IBOutlet UIButton *buttonSaveConfiguracion;

@property (strong,nonatomic) IBOutlet UIImageView *imagenFondo;
/** METODOS **/
-(IBAction)goToEliminarUsuariosViewController:(id)sender;
-(IBAction)guardarConfiguracion:(id)sender;



@end

