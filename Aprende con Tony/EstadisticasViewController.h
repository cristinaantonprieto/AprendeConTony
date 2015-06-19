//
//  EstadisticasViewController.h
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 18/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

#import "Usuario.h"
#import "JuegoCasa.h"
#import "JuegoCotidianas.h"
#import "JuegoModales.h"
#import "JuegoEmociones.h"


#import "JBBarChartView.h"
#import "JBChartView.h"

@interface EstadisticasViewController : UIViewController<UINavigationControllerDelegate, UIScrollViewDelegate, JBBarChartViewDataSource, JBBarChartViewDelegate, JBChartViewDataSource, JBChartViewDelegate>
{}

@property (nonatomic, retain) Usuario* persona;
@property (nonatomic, retain) JuegoCasa *juegoCasa;
@property (nonatomic, retain) JuegoCotidianas *juegoCotidianas;
@property (nonatomic, retain) JuegoModales *juegoModales;
@property (nonatomic, retain) JuegoEmociones *juegoEmociones;
@property (nonatomic, retain) NSManagedObjectContext *context;

@property (nonatomic, retain) IBOutlet UILabel *labelNombre;
@property (nonatomic, retain) IBOutlet UILabel *labelDni;
@property (nonatomic, retain) IBOutlet UILabel *labelEdad;
@property (nonatomic, retain) IBOutlet UILabel *labelTipoAutismo;
@property (nonatomic, retain) IBOutlet UILabel *labelGeneral;
@property (nonatomic, retain) IBOutlet UILabel *labelCasa;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianas;
@property (nonatomic, retain) IBOutlet UILabel *labelEmociones;
@property (nonatomic, retain) IBOutlet UILabel *labelModales;

@property (nonatomic, retain) IBOutlet UIImageView *imagenUsuario;

@property (nonatomic, retain) IBOutlet UIView *viewSkillGeneral;
@property (nonatomic, retain) IBOutlet UIView *viewSkillCasa;
@property (nonatomic, retain) IBOutlet UIView *viewSkillCotidianas;
@property (nonatomic, retain) IBOutlet UIView *viewSkillEmociones;
@property (nonatomic, retain) IBOutlet UIView *viewSkillModales;

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property(nonatomic, strong) JBBarChartView *barChartViewGeneral;
@property(nonatomic, strong) JBBarChartView *barChartViewCasa;
@property(nonatomic, strong) JBBarChartView *barChartViewCotidianas;
@property(nonatomic, strong) JBBarChartView *barChartViewModales;
@property(nonatomic, strong) JBBarChartView *barChartViewEmociones;


@end
