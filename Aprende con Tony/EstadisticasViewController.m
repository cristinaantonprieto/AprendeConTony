//
//  EstadisticasViewController.m
//  Aprende con Tony
//
//  Created by Cristina Anton prieto on 18/6/15.
//  Copyright (c) 2015 Cristina Anton prieto. All rights reserved.
//

#import "EstadisticasViewController.h"

@interface EstadisticasViewController ()

@end

@implementation EstadisticasViewController

@synthesize juegoCasa, juegoCotidianas, juegoModales, juegoEmociones, context, persona;
@synthesize labelCasa, labelCotidianas, labelDni, labelEdad, labelEmociones, labelGeneral, labelModales, labelNombre, labelTipoAutismo;
@synthesize imagenUsuario, informationView;
@synthesize viewSkillCasa, viewSkillCotidianas, viewSkillEmociones, viewSkillGeneral, viewSkillModales, scrollView;
@synthesize barChartViewGeneral, barChartViewCasa,barChartViewCotidianas,barChartViewEmociones,barChartViewModales;
@synthesize notaCasa, notaCotidianas, notaEmociones, notaModales;
@synthesize tiempoCasa, tiempoCotidianas, tiempoEmociones, tiempoModales;
@synthesize numFallosCasa, numFallosCotidianas, numFallosEmociones, numFallosModales;
@synthesize numFallosEmparejarCasa, numFallosEmparejarCotidianas, numFallosEmparejarEmociones, numFallosEmparejarModales, numFallosOrdenarCasa, numFallosOrdenarCotidianas, numFallosOrdenarEmociones, numFallosOrdenarModales, numFallosSeleccionarCasa, numFallosSeleccionarCotidianas, numFallosSeleccionarEmociones, numFallosSeleccionarModales;
@synthesize headerViewCasa, headerViewCotidianas, headerViewEmociones, headerViewGeneral, headerViewModales;


- (void)dealloc
{
    self.barChartViewGeneral.delegate=nil;
    self.barChartViewGeneral.dataSource = nil;
    
    self.barChartViewCasa.delegate = nil;
    self.barChartViewCasa.dataSource = nil;
    
    self.barChartViewCotidianas.delegate = nil;
    self.barChartViewCotidianas.dataSource = nil;
    
    self.barChartViewModales.delegate =nil;
    self.barChartViewModales.dataSource = nil;
    
    self.barChartViewEmociones.delegate = nil;
    self.barChartViewEmociones.dataSource =nil;
}



#pragma mark - View Lifecycle

- (void)loadView
{
    [super loadView];
    
    
    self.scrollView.scrollEnabled = YES;
    
    self.barChartViewGeneral = [[JBBarChartView alloc] init];
    self.barChartViewGeneral.frame = self.viewSkillGeneral.frame;
    self.barChartViewGeneral.frame = CGRectMake(self.viewSkillGeneral.frame.origin.x, self.viewSkillGeneral.frame.origin.y, 800, 392);
    
   
 
    self.barChartViewGeneral.delegate = self;
    self.barChartViewGeneral.dataSource = self;
    
    self.barChartViewGeneral.minimumValue = 0.0f;
    self.barChartViewGeneral.inverted = NO;
    self.barChartViewGeneral.backgroundColor = [UIColor clearColor];
    
    self.barChartViewCasa = [[JBBarChartView alloc] init];
    self.barChartViewCasa.frame = self.viewSkillCasa.frame;
    self.barChartViewCasa.frame = CGRectMake(self.viewSkillCasa.frame.origin.x, self.viewSkillCasa.frame.origin.y, 800, 392);
    
    
    self.barChartViewCasa.delegate = self;
    self.barChartViewCasa.dataSource = self;
    
    self.barChartViewCasa.minimumValue = 0.0f;
    self.barChartViewCasa.inverted = NO;
    self.barChartViewCasa.backgroundColor = [UIColor clearColor];
    
    self.barChartViewCotidianas = [[JBBarChartView alloc] init];
    self.barChartViewCotidianas.frame = self.viewSkillCotidianas.frame;
    self.barChartViewCotidianas.frame = CGRectMake(self.viewSkillCotidianas.frame.origin.x, self.viewSkillCotidianas.frame.origin.y, 800, 392);
    
    
    self.barChartViewCotidianas.delegate = self;
    self.barChartViewCotidianas.dataSource = self;
    
    self.barChartViewCotidianas.minimumValue = 0.0f;
    self.barChartViewCotidianas.inverted = NO;
    self.barChartViewCotidianas.backgroundColor = [UIColor clearColor];
    
    self.barChartViewModales = [[JBBarChartView alloc] init];
    self.barChartViewModales.frame = self.viewSkillModales.frame;
    self.barChartViewModales.frame = CGRectMake(self.viewSkillModales.frame.origin.x, self.viewSkillModales.frame.origin.y, 800, 392);
    
    
    self.barChartViewModales.delegate = self;
    self.barChartViewModales.dataSource = self;
    
    self.barChartViewModales.minimumValue = 0.0f;
    self.barChartViewModales.inverted = NO;
    self.barChartViewModales.backgroundColor = [UIColor clearColor];
    
    self.barChartViewEmociones = [[JBBarChartView alloc] init];
    self.barChartViewEmociones.frame = self.viewSkillEmociones.frame;
    self.barChartViewEmociones.frame = CGRectMake(self.viewSkillEmociones.frame.origin.x, self.viewSkillEmociones.frame.origin.y, 800, 392);
    
    
    self.barChartViewEmociones.delegate = self;
    self.barChartViewEmociones.dataSource = self;
    
    self.barChartViewEmociones.minimumValue = 0.0f;
    self.barChartViewEmociones.inverted = NO;
    self.barChartViewEmociones.backgroundColor = [UIColor clearColor];
    
  /* self.barChartViewGeneral.transform = CGAffineTransformRotate(self.barChartViewGeneral.transform, 0.5*M_PI);
    self.barChartViewCasa.transform = CGAffineTransformRotate(self.barChartViewCasa.transform, 0.5*M_PI);
    self.barChartViewCotidianas.transform = CGAffineTransformRotate(self.barChartViewCotidianas.transform, 0.5*M_PI);
    self.barChartViewModales.transform = CGAffineTransformRotate(self.barChartViewModales.transform, 0.5*M_PI);
    self.barChartViewEmociones.transform = CGAffineTransformRotate(self.barChartViewEmociones.transform, 0.5*M_PI);
    */
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    
   
    
    
    JBBarChartFooterView *footerView = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 25.0)];
    footerView.padding = 10.0f;
    footerView.leftLabel.text = @"     Mayor nº fallos            Menor nº fallos                   media casa              media s.cotidianas          media b.modales          media emociones";
    footerView.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewGeneral.footerView = footerView;
    
    JBBarChartFooterView *footerViewCasa = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), 800 - (10.0 * 2), 25.0)];
    footerViewCasa.padding = 10.0f;
    footerViewCasa.leftLabel.text = @   "      Fallos seleccionar             Fallos emparejar                   Fallos ordenar                        Nota media";
    footerViewCasa.leftLabel.backgroundColor = [UIColor clearColor];
    footerViewCasa.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewCasa.footerView = footerViewCasa;
    
    
    
    JBBarChartFooterView *footerViewCotidianas = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), 800 - (10.0 * 2), 25.0)];
    footerViewCotidianas.padding = 10.0f;
    footerViewCotidianas.leftLabel.text = @   "      Fallos seleccionar             Fallos emparejar                   Fallos ordenar                        Nota media";
    footerViewCotidianas.leftLabel.backgroundColor = [UIColor clearColor];
    footerViewCotidianas.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewCotidianas.footerView = footerViewCotidianas;

    
    JBBarChartFooterView *footerViewModales= [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), 800 - (10.0 * 2), 25.0)];
    footerViewModales.padding = 10.0f;
    footerViewModales.leftLabel.text = @   "      Fallos seleccionar             Fallos emparejar                   Fallos ordenar                        Nota media";
    footerViewModales.leftLabel.backgroundColor = [UIColor clearColor];
    footerViewModales.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewModales.footerView = footerViewModales;
    
    
    JBBarChartFooterView *footerViewEmociones = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), 800 - (10.0 * 2), 25.0)];
    footerViewEmociones.padding = 10.0f;
    footerViewEmociones.leftLabel.text = @   "      Fallos seleccionar             Fallos emparejar                   Fallos ordenar                        Nota media";
    footerViewEmociones.leftLabel.backgroundColor = [UIColor clearColor];
    footerViewEmociones.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewEmociones.footerView = footerViewEmociones;


    
    
    [self.viewSkillGeneral addSubview:self.barChartViewGeneral];
     [self.viewSkillCasa addSubview:self.barChartViewCasa];
     [self.viewSkillCotidianas addSubview:self.barChartViewCotidianas];
     [self.viewSkillModales addSubview:self.barChartViewModales];
     [self.viewSkillEmociones addSubview:self.barChartViewEmociones];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scrollView.scrollEnabled = YES;
    
    
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
   
  //  [self.barChartViewGeneral setState:JBChartViewStateCollapsed];
}

-(void)viewDidLayoutSubviews
{
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    [self.scrollView setContentOffset:CGPointZero];
    [super viewDidLayoutSubviews];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    

    [super viewDidAppear:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.scrollEnabled = YES;
    
    // Do any additional setup after loading the view.
    self.juegoCasa = self.persona.usuario_juegoCasa;
    self.juegoEmociones = self.persona.usuario_juegoEmociones;
    self.juegoModales = self.persona.usuario_juegoModales;
    self.juegoCotidianas = self.persona.usuario_juegoCotidianas;
    
      
    self.labelNombre.text = self.persona.nombre;
    self.labelDni.text = self.persona.dni;
    self.labelEdad.text = [self.persona.edad stringValue];
    self.labelTipoAutismo.text = self.persona.tipo_autismo;
    
    NSURL *referenceURL = self.persona.imagenUsuario;
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:referenceURL resultBlock:^(ALAsset *asset)
     {
         UIImage  *copyOfOriginalImage = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
         
         
         [self.imagenUsuario setImage:copyOfOriginalImage];
         self.imagenUsuario.contentMode = UIViewContentModeScaleAspectFit;
         
     }
            failureBlock:^(NSError *error)
     {
         // error handling
         NSLog(@"Error asignando foto...");
     }];

    self.barChartViewGeneral.tag = 1;
    self.barChartViewCasa.tag =2;
    self.barChartViewCotidianas.tag = 3;
    self.barChartViewModales.tag = 4;
    self.barChartViewEmociones.tag = 5;
    
    [self cargarDatos];
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 2764)];
    
    
    
    [self.barChartViewGeneral setState:JBChartViewStateExpanded];
    [self.barChartViewCasa setState:JBChartViewStateExpanded];
    [self.barChartViewCotidianas setState:JBChartViewStateExpanded];
    [self.barChartViewModales setState:JBChartViewStateExpanded];
    [self.barChartViewEmociones setState:JBChartViewStateExpanded];
    
    
    [self.barChartViewGeneral reloadData];
    [self.barChartViewCasa reloadData];
    [self.barChartViewCotidianas reloadData];
    [self.barChartViewEmociones reloadData];
    [self.barChartViewModales reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cargarDatos
{
    
    //tiempos
    self.tiempoModales = self.juegoModales.tiempoTotal.longValue;
    self.tiempoCasa = self.juegoCasa.tiempoTotal.longValue;
    self.tiempoCotidianas = self.juegoCotidianas.tiempoTotal.longValue;
    self.tiempoEmociones = self.juegoEmociones.tiempoTotal.longValue;
    
    
    //casa
    self.numFallosSeleccionarCasa = self.juegoCasa.num_fallos_seleccionar.intValue;
    self.numFallosEmparejarCasa= self.juegoCasa.num_fallos_emparejar.intValue;
    self.numFallosOrdenarCasa= self.juegoCasa.num_fallos_ordenar.intValue;
    
    //cotidianas
    self.numFallosSeleccionarCotidianas = self.juegoCotidianas.num_fallos_seleccionar.intValue;
    self.numFallosEmparejarCotidianas= self.juegoCotidianas.num_fallos_emparejar.intValue;
    self.numFallosOrdenarCotidianas= self.juegoCotidianas.num_fallos_ordenar.intValue;
    
    //modales
    self.numFallosSeleccionarModales= self.juegoModales.num_fallos_seleccionar.intValue;
    self.numFallosEmparejarModales= self.juegoModales.num_fallos_emparejar.intValue;
    self.numFallosOrdenarModales= self.juegoModales.num_fallos_ordenar.intValue;
    
    //emociones
    self.numFallosSeleccionarEmociones= self.juegoEmociones.num_fallos_seleccionar.intValue;
    self.numFallosEmparejarEmociones= self.juegoEmociones.num_fallos_emparejar.intValue;
    self.numFallosOrdenarEmociones= self.juegoEmociones.num_fallos_ordenar.intValue;
    
    //fallos totales
    self.numFallosCasa = self.numFallosSeleccionarCasa + self.numFallosEmparejarCasa + self.numFallosOrdenarCasa;
    self.numFallosCotidianas = self.numFallosSeleccionarCotidianas + self.numFallosEmparejarCotidianas + self.numFallosOrdenarCotidianas;
    self.numFallosEmociones = self.numFallosSeleccionarEmociones + self.numFallosEmparejarEmociones + self.numFallosOrdenarEmociones;
    self.numFallosModales = self.numFallosSeleccionarModales + self.numFallosEmparejarModales + self.numFallosOrdenarModales;
    
    
    /**
     
     EL CALCULO DE LAS NOTAS VIENE DADO POR UN BAREMO DE PORCENTAJES TENIENDO EN CUENTA TRES VARIABLES PARA CADA JUEGO, 
     TIEMPO TOTAL, DIFICULTAD, NUM FALLOS, SIENDO SU PESO EL SIGUIENTE:
    
    PORCENTAJES PARA NOTAS: 
         TIEMPO = 30%
        +DIFICULTAD = 40%
        +NUM FALLOS = 30 %
                     ----
                      100%
     
     PARA CALCULAR LA NOTA DE CADA UNA DE ESAS VARIABLES ANTERIORES SE HARÁ POR INTERVALOS
     
    **/
    
    //nota casa
    
    
    self.notaCasa = [self notaParaporcentajeTiempo:self.tiempoCasa] + [self notaParaporcentajeDificultad:self.juegoCasa.num_dificultad.intValue] + [self notaParaporcentajeNumFallos:self.numFallosCasa];
    
    //nota cotidianas
    self.notaCotidianas= [self notaParaporcentajeTiempo:self.tiempoCotidianas] + [self notaParaporcentajeDificultad:self.juegoCotidianas.num_dificultad.intValue] + [self notaParaporcentajeNumFallos:self.numFallosCotidianas];
    
    //nota modales
    self.notaModales= [self notaParaporcentajeTiempo:self.tiempoModales] + [self notaParaporcentajeDificultad:self.juegoModales.num_dificultad.intValue] + [self notaParaporcentajeNumFallos:self.numFallosModales];
    
    //nota emociones
    self.notaEmociones= [self notaParaporcentajeTiempo:self.tiempoEmociones] + [self notaParaporcentajeDificultad:self.juegoEmociones.num_dificultad.intValue] + [self notaParaporcentajeNumFallos:self.numFallosEmociones];
    
    NSLog(@"nota casa = %f", self.notaCasa);
    NSLog(@"nota cotidianas = %f", self.notaCotidianas);
    NSLog(@"nota modales = %f", self.notaModales);
    NSLog(@"nota emociones = %f", self.notaEmociones);
    
}

-(float)notaParaporcentajeTiempo:(long)tiempo
{
    /*
     PESO TIEMPO UN 30%
     
     INTERVALOS:
        [0-150] --> 30% (obtiene el maximo)
        [151-250] --> 20%
        [251- ...) --> 10%
     */
    
    float tiempoNota = 0.0f;
    
    if (tiempo<= 150) {
        tiempoNota = 0.3;
    }else if(tiempo >= 151 && tiempo<= 250)
    {
        tiempoNota = 0.2;
    }else if(tiempo>= 251)
    {
        tiempoNota = 0.1;
    }
    
    return tiempoNota;
    
}

-(float)notaParaporcentajeDificultad: (int)dificultad
{
    /*
     PESO DIFICULTAD UN 40%
     
     INTERVALOS:
     DIFICULTAD 3 --> 40%
     DIFICULTAD 2 --> 30%
     DIFICULTAD 1 --> 20%
     */
    
    float dificultadNota = 0.0f;
    
    if (dificultad == 3) {
        dificultadNota = 0.4;
    }else if(dificultad ==2)
    {
        dificultadNota = 0.3;
    }else if(dificultad== 1)
    {
        dificultadNota = 0.2;
    }
    
    return dificultadNota;
}

-(float)notaParaporcentajeNumFallos: (int)fallos
{
    /*
     PESO FALLOS UN 30%
     
     INTERVALOS:
     [0-10] --> 30%
     [11-20] --> 20%
     [21- ...) --> 10%
     */
    
    float fallosNota = 0.0f;
    
    if (fallos<= 10) {
        fallosNota = 0.3;
    }else if(fallos >= 151 && fallos<= 250)
    {
        fallosNota = 0.2;
    }else if(fallos>= 251)
    {
        fallosNota = 0.1;
    }
    
    return fallosNota;
}

#pragma mark - JBChartViewDataSource
- (void)barChartView:(JBBarChartView *)barChartView didSelectBarAtIndex:(NSUInteger)index touchPoint:(CGPoint)touchPoint
{
    
    switch (barChartView.tag) {
        case 1: //general
        {
            self.headerViewGeneral = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(80.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 80.0)];
            switch (index) {
                case 0:
                {
                    
                    NSString *fallosJuego = @"";
                    int maxFallos=0;
                    if(self.numFallosCasa > self.numFallosCotidianas)
                    {
                        maxFallos = self.numFallosCasa;
                        fallosJuego = @"Producido en juego Casa";
                    }else
                    {
                        maxFallos = self.numFallosCotidianas;
                        fallosJuego = @"Producido en juego Cosas Cotidianas";
                    }
                    if(maxFallos < self.numFallosModales)
                    {
                        maxFallos = self.numFallosModales;
                        fallosJuego = @"Producido en juego Buenos modales";
                    }
                    if(maxFallos < self.numFallosEmociones)
                    {
                        maxFallos = self.numFallosEmociones;
                        fallosJuego = @"Producido en juego Emociones";
                    }
                    self.headerViewGeneral.titleLabel.text =[NSString stringWithFormat: @"Mayor número de fallos cometidos en un juego %d", maxFallos];
                    self.headerViewGeneral.subtitleLabel.text = fallosJuego;
                }
                    break;
                case 1:
                {
                    NSString *fallosJuego = @"";
                    int minFallos=0;
                    if(self.numFallosCasa < self.numFallosCotidianas)
                    {
                        minFallos = self.numFallosCasa;
                        fallosJuego = @"Producido en juego Casa";
                    }else
                    {
                        minFallos = self.numFallosCotidianas;
                        fallosJuego = @"Produdico en juego Cosas Cotidianas";
                    }
                    if(minFallos > self.numFallosModales)
                    {
                        minFallos = self.numFallosModales;
                        fallosJuego = @"Producido en juego Buenos modales";
                    }
                    if(minFallos > self.numFallosEmociones)
                    {
                        minFallos = self.numFallosEmociones;
                        fallosJuego = @"Producido en juego Emociones";
                    }
                    self.headerViewGeneral.titleLabel.text =[NSString stringWithFormat: @"Menor número de fallos cometidos en un juego %d", minFallos];
                    self.headerViewGeneral.subtitleLabel.text = fallosJuego;
                }
                    break;
                case 2:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Casa:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%f / 10", self.notaCasa*10];
                    ;
                }
                    break;
                case 3:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Cosas cotidianas:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaCotidianas*10];
                }
                    break;
                case 4:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Buenos Modales:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaModales*10];
                }
                    break;
                case 5:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Emociones:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaEmociones*10];
                }
                    break;
                    
                default:
                    break;
            }
            
            
            self.headerViewGeneral.separatorColor = [UIColor redColor];
            self.barChartViewGeneral.headerView = self.headerViewGeneral;
            self.headerViewGeneral.hidden = NO;
        }
            break;
        case 2://casa
        {
            self.headerViewCasa = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(80.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 80.0)];
            switch (index) {
                case 0:
                {
                    self.headerViewCasa.titleLabel.text = @"Número de fallos para el nivel Seleccionar:";
                    self.headerViewCasa.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosSeleccionarCasa];
                }
                    break;
                case 1:
                {
                    self.headerViewCasa.titleLabel.text = @"Número de fallos para el nivel Emparejar:";
                    self.headerViewCasa.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosEmparejarCasa];
                }
                    break;
                case 2:
                {
                    self.headerViewCasa.titleLabel.text = @"Número de fallos para el nivel Ordenar:";
                    self.headerViewCasa.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosOrdenarCasa];
                }
                    break;
                case 3:
                {
                    self.headerViewCasa.titleLabel.text = @"Nota media para el juego:";
                    self.headerViewCasa.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaCasa*10];
                }
                    break;
                default:
                    break;
            }
        }
            self.headerViewCasa.separatorColor = [UIColor redColor];
            self.barChartViewCasa.headerView = self.headerViewCasa;
            self.headerViewCasa.hidden = NO;
            break;
        case 3://cotidianas
        {
            self.headerViewCotidianas = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(80.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 80.0)];
            switch (index) {
                case 0:
                {
                    self.headerViewCotidianas.titleLabel.text = @"Número de fallos para el nivel Seleccionar:";
                    self.headerViewCotidianas.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosSeleccionarCotidianas];
                }
                    break;
                case 1:
                {
                    self.headerViewCotidianas.titleLabel.text = @"Número de fallos para el nivel Emparejar:";
                    self.headerViewCotidianas.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosEmparejarCotidianas];
                    
                }
                    break;
                case 2:
                {
                    self.headerViewCotidianas.titleLabel.text = @"Número de fallos para el nivel Ordenar:";
                    self.headerViewCotidianas.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosOrdenarCotidianas];
                }
                    break;
                case 3:
                {
                    self.headerViewCotidianas.titleLabel.text = @"Nota media para el juego:";
                    self.headerViewCotidianas.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaCotidianas*10];
                }
                    break;
                    
                default:
                    break;
            }
        }
            self.headerViewCotidianas.separatorColor = [UIColor redColor];
            self.barChartViewCotidianas.headerView = self.headerViewCotidianas;
            self.headerViewCotidianas.hidden = NO;
            break;
        case 4://modales
        {
            self.headerViewModales = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(80.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 80.0)];
            switch (index) {
                case 0:
                {
                    self.headerViewModales.titleLabel.text = @"Número de fallos para el nivel Seleccionar:";
                    self.headerViewModales.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosSeleccionarModales];
                }
                    break;
                case 1:
                {
                    self.headerViewModales.titleLabel.text = @"Número de fallos para el nivel Emparejar:";
                    self.headerViewModales.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosEmparejarModales];
                }
                    break;
                case 2:
                {
                    self.headerViewModales.titleLabel.text = @"Número de fallos para el nivel Ordenar:";
                    self.headerViewModales.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosOrdenarModales];
                }
                    break;
                case 3:
                {
                    self.headerViewModales.titleLabel.text = @"Nota media para el juego:";
                    self.headerViewModales.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaModales*10];
                }
                    break;
                default:
                    break;
            }
            
        }
            self.headerViewModales.separatorColor = [UIColor redColor];
            self.barChartViewModales.headerView = self.headerViewModales;
            self.headerViewModales.hidden = NO;
            break;
        case 5://emociones
        {
            self.headerViewEmociones = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(80.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 80.0)];
            switch (index) {
                case 0:
                {
                    self.headerViewEmociones.titleLabel.text = @"Número de fallos para el nivel Seleccionar:";
                    self.headerViewEmociones.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosSeleccionarEmociones];
                }
                    break;
                case 1:
                {
                    self.headerViewEmociones.titleLabel.text = @"Número de fallos para el nivel Emparejar:";
                    self.headerViewEmociones.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosOrdenarEmociones];
                }
                    break;
                case 2:
                {
                    self.headerViewEmociones.titleLabel.text = @"Número de fallos para el nivel Ordenar:";
                    self.headerViewEmociones.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosOrdenarEmociones];
                }
                    break;
                case 3:
                {
                    self.headerViewEmociones.titleLabel.text = @"Nota media para el juego:";
                    self.headerViewEmociones.subtitleLabel.text = [NSString stringWithFormat: @"%f /10", self.notaEmociones*10];
                }
                    break;
                default:
                    break;
            }
        }
            self.headerViewEmociones.separatorColor = [UIColor redColor];
            self.barChartViewEmociones.headerView = self.headerViewEmociones;
            self.headerViewEmociones.hidden = NO;
            break;
        default:
            break;
    }
    
    
}

- (void)didDeselectBarChartView:(JBBarChartView *)barChartView
{
    switch (barChartView.tag) {
        case 1: //general
            self.headerViewGeneral.hidden = YES;
            break;
        case 2://casa
            self.headerViewCasa.hidden = YES;
            break;
        case 3://cotidianas
            self.headerViewCotidianas.hidden = YES;
            break;
        case 4://modales
            self.headerViewModales.hidden = YES;
            break;
        case 5://emociones
            self.headerViewEmociones.hidden = YES;
            break;
        default:
            break;
    }
    
   
}
- (UIColor *)barSelectionColorForBarChartView:(JBBarChartView *)barChartView
{
    return [UIColor whiteColor];
}




- (BOOL)shouldExtendSelectionViewIntoHeaderPaddingForChartView:(JBChartView *)chartView
{
    return YES;
}

- (BOOL)shouldExtendSelectionViewIntoFooterPaddingForChartView:(JBChartView *)chartView
{
    return NO;
}

#pragma mark - JBBarChartViewDataSource

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    switch (barChartView.tag) {
        case 1://general
            return 6;
            break;
        case 2://casa
            return 4;
            break;
        case 3://cotidianas
            return 4;
            break;
        case 4://modales
            return 4;
            break;
        case 5://emociones
            return 4;
            break;
        default:
            break;
    }
    return 3;
}



#pragma mark - JBBarChartViewDelegate

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index
{
    

    switch (barChartView.tag) {
        case 1://general
            switch (index) {
                case 0: //mayor num fallos
                {
                    int maxFallos=0;
                    if(self.numFallosCasa > self.numFallosCotidianas)
                    {
                        maxFallos = self.numFallosCasa;
                    }else
                    {
                        maxFallos = self.numFallosCotidianas;
                    }
                    if(maxFallos < self.numFallosModales)
                    {
                        maxFallos = self.numFallosModales;
                    }
                    if(maxFallos < self.numFallosEmociones)
                    {
                        maxFallos = self.numFallosEmociones;
                    }
                    NSLog(@"max fallos = %d", maxFallos);
                   
                    
                    return maxFallos;
                }
                    break;
                case 1: //menor num fallos
                {
                    int menorFallos=0;
                    if(self.numFallosCasa < self.numFallosCotidianas)
                    {
                        menorFallos = self.numFallosCasa;
                    }else
                    {
                        menorFallos = self.numFallosCotidianas;
                    }
                    if(menorFallos > self.numFallosModales)
                    {
                        menorFallos = self.numFallosModales;
                    }
                    if(menorFallos > self.numFallosEmociones)
                    {
                        menorFallos = self.numFallosEmociones;
                    }
                    NSLog(@"menor fallos = %d", menorFallos);
                    
                    return menorFallos;
                }
                    break;
                case 2: //nota casa
                {
                    NSLog(@"nota casa sk = %f", self.notaCasa*100);
                    return self.notaCasa*100;
                }
                    break;
                case 3: //nota cotidianas
                {
                    NSLog(@"nota cotidianas sk = %f", self.notaCotidianas*100);
                    return self.notaCotidianas*100;
                }
                    break;
                case 4: //nota modales
                {
                    NSLog(@"nota modales sk = %f", self.notaModales*100);
                    return self.notaModales*100;
                }
                    break;
                case 5: //nota emociones
                {
                    NSLog(@"nota emociones sk = %f", self.notaEmociones*100);
                    return self.notaEmociones*100;
                }
                    break;
                default:
                    break;
            }
            break;
        case 2://casa
            switch (index) {
                case 0://fallos seleccionar
                    return self.juegoCasa.num_fallos_seleccionar.intValue;
                    break;
                case 1: //fallos emparejar
                    return self.juegoCasa.num_fallos_emparejar.intValue;
                    break;
                case 2: //fallos ordenar
                    return self.juegoCasa.num_fallos_ordenar.intValue;
                    break;
                case 3: //total fallos
                {
                    int totalcasa = self.juegoCasa.num_fallos_seleccionar.intValue +self.juegoCasa.num_fallos_emparejar.intValue+self.juegoCasa.num_fallos_ordenar.intValue;
                    return totalcasa;
                }
                    break;
                default:
                    break;
            }
            break;
        case 3://cotidianas
            switch (index) {
                case 0:
                    return self.juegoCotidianas.num_fallos_seleccionar.intValue;
                    break;
                case 1:
                    return self.juegoCotidianas.num_fallos_emparejar.intValue;
                    break;
                case 2:
                    return self.juegoCotidianas.num_fallos_ordenar.intValue;
                    break;
                case 3:
                {
                    int totalcotidianas = self.juegoCotidianas.num_fallos_seleccionar.intValue +self.juegoCotidianas.num_fallos_emparejar.intValue+self.juegoCotidianas.num_fallos_ordenar.intValue;
                    return totalcotidianas;
                }
                default:
                    break;
            }
            break;
        case 4://modales
            switch (index) {
                case 0:
                    return self.juegoModales.num_fallos_seleccionar.intValue;
                    break;
                case 1:
                    return self.juegoModales.num_fallos_emparejar.intValue;
                    break;
                case 2:
                    return self.juegoModales.num_fallos_ordenar.intValue;
                    break;
                case 3:
                {
                    int totalmodales = self.juegoModales.num_fallos_seleccionar.intValue +self.juegoModales.num_fallos_emparejar.intValue+self.juegoModales.num_fallos_ordenar.intValue;
                    return totalmodales;
                }
                    break;
                default:
                    break;
            }
            break;
        case 5://emociones
            switch (index) {
                case 0:
                    return self.juegoEmociones.num_fallos_seleccionar.intValue;
                    break;
                case 1:
                    return self.juegoEmociones.num_fallos_emparejar.intValue;
                    break;
                case 2:
                    return self.juegoEmociones.num_fallos_ordenar.intValue;
                    break;
                case 3:
                {
                    int totalemociones = self.juegoEmociones.num_fallos_seleccionar.intValue +self.juegoEmociones.num_fallos_emparejar.intValue+self.juegoEmociones.num_fallos_ordenar.intValue;
                    return totalemociones;
                }
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    return 3;
    
    
    
    return 20.0f;
}

- (UIColor *)barChartView:(JBBarChartView *)barChartView colorForBarViewAtIndex:(NSUInteger)index
{
    
    return [UIColor yellowColor];
    //return (index % 2 == 0) ? kJBColorBarChartBarBlue : kJBColorBarChartBarGreen;
}


//
//- (CGFloat)barPaddingForBarChartView:(JBBarChartView *)barChartView
//{
//    return kJBBarChartViewControllerBarPadding;
//}

#pragma mark - Buttons

//- (void)chartToggleButtonPressed:(id)sender
//{
//    UIView *buttonImageView = [self.navigationItem.rightBarButtonItem valueForKey:kJBBarChartViewControllerNavButtonViewKey];
//    buttonImageView.userInteractionEnabled = NO;
//
//    CGAffineTransform transform = self.barChartView.state == JBChartViewStateExpanded ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformMakeRotation(0);
//    buttonImageView.transform = transform;
//
//    [self.barChartView setState:self.barChartView.state == JBChartViewStateExpanded ? JBChartViewStateCollapsed : JBChartViewStateExpanded animated:YES callback:^{
//        buttonImageView.userInteractionEnabled = YES;
//    }];
//}

#pragma mark - Overrides

- (JBChartView *)chartView
{
  
    return self.barChartViewGeneral;
}

@end
