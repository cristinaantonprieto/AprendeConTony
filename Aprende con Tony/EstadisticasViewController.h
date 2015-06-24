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
#import "JBChartHeaderView.h"
#import "JBBarChartFooterView.h"
#import "JBChartInformationView.h"




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

@property (nonatomic, retain) IBOutlet UILabel *labelCasaDificultad;
@property (nonatomic, retain) IBOutlet UILabel *labelCasaFallosSelecc;
@property (nonatomic, retain) IBOutlet UILabel *labelCasaFallosEmp;
@property (nonatomic, retain) IBOutlet UILabel *labelCasaFallosOrd;
@property (nonatomic, retain) IBOutlet UILabel *labelCasaNivel;
@property (nonatomic, retain) IBOutlet UILabel *labelCasaSuperado;
@property (nonatomic, retain) IBOutlet UILabel *labelCasaTiempo;

@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasDificultad;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasFallosSelecc;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasFallosEmp;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasFallosOrd;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasNivel;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasSuperado;
@property (nonatomic, retain) IBOutlet UILabel *labelCotidianasTiempo;


@property (nonatomic, retain) IBOutlet UILabel *labelModalesDificultad;
@property (nonatomic, retain) IBOutlet UILabel *labelModalesFallosSelecc;
@property (nonatomic, retain) IBOutlet UILabel *labelModalesFallosEmp;
@property (nonatomic, retain) IBOutlet UILabel *labelModalesFallosOrd;
@property (nonatomic, retain) IBOutlet UILabel *labelModalesNivel;
@property (nonatomic, retain) IBOutlet UILabel *labelModalesSuperado;
@property (nonatomic, retain) IBOutlet UILabel *labelModalesTiempo;

@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesDificultad;
@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesFallosSelecc;
@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesFallosEmp;
@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesFallosOrd;
@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesNivel;
@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesSuperado;
@property (nonatomic, retain) IBOutlet UILabel *labelEmocionesTiempo;


@property (nonatomic, retain) IBOutlet UIImageView *imagenUsuario;

@property (nonatomic, retain) IBOutlet UIView *viewSkillGeneral;
@property (nonatomic, retain) IBOutlet UIView *viewSkillErrores;

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property(nonatomic, strong) IBOutlet JBBarChartView *barChartViewGeneral;
@property(nonatomic, strong) IBOutlet JBBarChartView *barChartViewErrores;

@property (nonatomic, strong) JBChartInformationView *informationView;

@property (nonatomic, strong) JBChartHeaderView *headerViewGeneral;
@property (nonatomic, strong) JBChartHeaderView *headerViewErrores;


@property(nonatomic, assign) long tiempoCasa;
@property(nonatomic, assign) long tiempoCotidianas;
@property(nonatomic, assign) long tiempoModales;
@property(nonatomic, assign) long tiempoEmociones;

@property(nonatomic, assign) int numFallosCasa;
@property(nonatomic, assign) int numFallosSeleccionarCasa;
@property(nonatomic, assign) int numFallosEmparejarCasa;
@property(nonatomic, assign) int numFallosOrdenarCasa;

@property(nonatomic, assign) int numFallosCotidianas;
@property(nonatomic, assign) int numFallosSeleccionarCotidianas;
@property(nonatomic, assign) int numFallosEmparejarCotidianas;
@property(nonatomic, assign) int numFallosOrdenarCotidianas;

@property(nonatomic, assign) int numFallosModales;
@property(nonatomic, assign) int numFallosSeleccionarModales;
@property(nonatomic, assign) int numFallosEmparejarModales;
@property(nonatomic, assign) int numFallosOrdenarModales;

@property(nonatomic, assign) int numFallosEmociones;
@property(nonatomic, assign) int numFallosSeleccionarEmociones;
@property(nonatomic, assign) int numFallosEmparejarEmociones;
@property(nonatomic, assign) int numFallosOrdenarEmociones;

@property(nonatomic, assign) float notaCasa;
@property (nonatomic, assign) float notaCotidianas;
@property (nonatomic, assign) float notaModales;
@property (nonatomic, assign) float notaEmociones;
@property (nonatomic, assign) float notaMediaJuegos;


@end
