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
@synthesize labelDni, labelEdad, labelGeneral, labelNombre, labelTipoAutismo;
@synthesize imagenUsuario, informationView;
@synthesize viewSkillErrores, viewSkillGeneral, scrollView;
@synthesize barChartViewGeneral, barChartViewErrores;
@synthesize notaCasa, notaCotidianas, notaEmociones, notaModales;
@synthesize tiempoCasa, tiempoCotidianas, tiempoEmociones, tiempoModales;
@synthesize numFallosCasa, numFallosCotidianas, numFallosEmociones, numFallosModales;
@synthesize numFallosEmparejarCasa, numFallosEmparejarCotidianas, numFallosEmparejarEmociones, numFallosEmparejarModales, numFallosOrdenarCasa, numFallosOrdenarCotidianas, numFallosOrdenarEmociones, numFallosOrdenarModales, numFallosSeleccionarCasa, numFallosSeleccionarCotidianas, numFallosSeleccionarEmociones, numFallosSeleccionarModales;
@synthesize headerViewGeneral, headerViewErrores;
@synthesize notaMediaJuegos;

@synthesize labelCasaDificultad, labelCasaFallosEmp, labelCasaFallosOrd, labelCasaFallosSelecc, labelCasaNivel, labelCasaSuperado, labelCasaTiempo;
@synthesize labelCotidianasDificultad, labelCotidianasFallosEmp, labelCotidianasFallosOrd, labelCotidianasFallosSelecc, labelCotidianasNivel, labelCotidianasSuperado, labelCotidianasTiempo;
@synthesize labelEmocionesDificultad, labelEmocionesFallosEmp, labelEmocionesFallosOrd, labelEmocionesFallosSelecc, labelEmocionesNivel, labelEmocionesSuperado, labelEmocionesTiempo;
@synthesize labelModalesDificultad, labelModalesFallosEmp, labelModalesFallosOrd, labelModalesFallosSelecc, labelModalesNivel, labelModalesSuperado, labelModalesTiempo;

- (void)dealloc
{
    self.barChartViewGeneral.delegate=nil;
    self.barChartViewGeneral.dataSource = nil;
    
    self.barChartViewErrores.delegate = nil;
    self.barChartViewErrores.dataSource = nil;
    
   
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
    
    self.barChartViewErrores = [[JBBarChartView alloc] init];
    self.barChartViewErrores.frame = self.viewSkillErrores.frame;
    self.barChartViewErrores.frame = CGRectMake(self.viewSkillErrores.frame.origin.x, self.viewSkillErrores.frame.origin.y, 800, 392);
    
    
    self.barChartViewErrores.delegate = self;
    self.barChartViewErrores.dataSource = self;
    
    self.barChartViewErrores.minimumValue = 0.0f;
    self.barChartViewErrores.inverted = NO;
    self.barChartViewErrores.backgroundColor = [UIColor clearColor];
    
   
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
    
    
    JBBarChartFooterView *footerView = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 25.0)];
    footerView.padding = 10.0f;
    footerView.leftLabel.text = @"  Nota media juegos              Nota media casa           Nota media cotidianas          Nota media modales       Nota media emociones";
    
    footerView.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewGeneral.footerView = footerView;
    
    JBBarChartFooterView *footerViewErrores = [[JBBarChartFooterView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(25.0 * 0.5), 800 - (10.0 * 2), 25.0)];
    footerViewErrores.padding = 10.0f;
    footerViewErrores.leftLabel.text = @"      Media fallos                        Fallos Casa                    Fallos Cotidianas                   Fallos Modales               Fallos Emociones";
    footerViewErrores.leftLabel.backgroundColor = [UIColor clearColor];
    footerViewErrores.leftLabel.textColor = [UIColor whiteColor];
    self.barChartViewErrores.footerView = footerViewErrores;
    
    
    [self.viewSkillGeneral addSubview:self.barChartViewGeneral];
    [self.viewSkillErrores addSubview:self.barChartViewErrores];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scrollView.scrollEnabled = YES;
    
    
    self.juegoCasa = self.persona.usuario_juegoCasa;
    self.juegoEmociones = self.persona.usuario_juegoEmociones;
    self.juegoModales = self.persona.usuario_juegoModales;
    self.juegoCotidianas = self.persona.usuario_juegoCotidianas;
    
    
    [self cargarDatosJuegos];
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
  
}

-(void)cargarDatosJuegos
{
    //casa
    self.labelCasaDificultad.text = [self.juegoCasa.num_dificultad stringValue];
    self.labelCasaNivel.text = [self.juegoCasa.num_nivel stringValue];
    self.labelCasaSuperado.text = self.juegoCasa.superado;
    self.labelCasaTiempo.text = [self.juegoCasa.tiempoTotal stringValue];
    self.labelCasaFallosSelecc.text = [self.juegoCasa.num_fallos_seleccionar stringValue];
    self.labelCasaFallosEmp.text = [self.juegoCasa.num_fallos_emparejar stringValue];
    self.labelCasaFallosOrd.text = [self.juegoCasa.num_fallos_ordenar stringValue];
    
    //cotidianas
    self.labelCotidianasDificultad.text = [self.juegoCotidianas.num_dificultad stringValue];
    self.labelCotidianasNivel.text = [self.juegoCotidianas.num_nivel stringValue];
    self.labelCotidianasSuperado.text = self.juegoCotidianas.superado;
    self.labelCotidianasTiempo.text = [self.juegoCotidianas.tiempoTotal stringValue];
    self.labelCotidianasFallosSelecc.text = [self.juegoCotidianas.num_fallos_seleccionar stringValue];
    self.labelCotidianasFallosEmp.text = [self.juegoCotidianas.num_fallos_emparejar stringValue];
    self.labelCotidianasFallosOrd.text = [self.juegoCotidianas.num_fallos_ordenar stringValue];
    
    //modales
    self.labelModalesDificultad.text = [self.juegoModales.num_dificultad stringValue];
    self.labelModalesNivel.text = [self.juegoModales.num_nivel stringValue];
    self.labelModalesSuperado.text = self.juegoModales.superado;
    self.labelModalesTiempo.text = [self.juegoModales.tiempoTotal stringValue];
    self.labelModalesFallosSelecc.text = [self.juegoModales.num_fallos_seleccionar stringValue];
    self.labelModalesFallosEmp.text = [self.juegoModales.num_fallos_emparejar stringValue];
    self.labelModalesFallosOrd.text = [self.juegoModales.num_fallos_ordenar stringValue];
    
    //emociones
    self.labelEmocionesDificultad.text = [self.juegoEmociones.num_dificultad stringValue];
    self.labelEmocionesNivel.text = [self.juegoEmociones.num_nivel stringValue];
    self.labelEmocionesSuperado.text = self.juegoEmociones.superado;
    self.labelEmocionesTiempo.text = [self.juegoEmociones.tiempoTotal stringValue];
    self.labelEmocionesFallosSelecc.text = [self.juegoEmociones.num_fallos_seleccionar stringValue];
    self.labelEmocionesFallosEmp.text = [self.juegoEmociones.num_fallos_emparejar stringValue];
    self.labelEmocionesFallosOrd.text = [self.juegoEmociones.num_fallos_ordenar stringValue];
    
    
}

-(void)viewDidLayoutSubviews
{
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 4800)];
  
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
    self.barChartViewErrores.tag =2;
    
    [self cargarDatos];
    
    self.scrollView.scrollEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 2764)];
    
    
    
    [self.barChartViewGeneral setState:JBChartViewStateExpanded];
    [self.barChartViewErrores setState:JBChartViewStateExpanded];
    
    
    [self.barChartViewGeneral reloadData];
    [self.barChartViewErrores reloadData];
   
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
    
    self.notaMediaJuegos = (self.notaCasa + self.notaCotidianas + self.notaModales + self.notaEmociones)/4;
    
    NSLog(@"nota casa = %f", self.notaCasa);
    NSLog(@"nota cotidianas = %f", self.notaCotidianas);
    NSLog(@"nota modales = %f", self.notaModales);
    NSLog(@"nota emociones = %f", self.notaEmociones);
    NSLog(@"nota media juego = %f", self.notaMediaJuegos);
    
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
                    self.headerViewGeneral.titleLabel.text = @"Nota media de los juegos:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%.02f / 10", self.notaMediaJuegos*10];
                    ;
                }
                    break;
                case 1:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Casa:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%.02f / 10", self.notaCasa*10];
                    ;
                }
                    break;
                case 2:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Cosas cotidianas:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%.02f /10", self.notaCotidianas*10];
                }
                    break;
                case 3:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Buenos Modales:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%.02f /10", self.notaModales*10];
                }
                    break;
                case 4:
                {
                    self.headerViewGeneral.titleLabel.text = @"Nota media para el juego Emociones:";
                    self.headerViewGeneral.subtitleLabel.text = [NSString stringWithFormat: @"%.02f /10", self.notaEmociones*10];
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
     
            self.headerViewErrores = [[JBChartHeaderView alloc] initWithFrame:CGRectMake(10.0, ceil(self.view.bounds.size.height * 0.5) - ceil(80.0 * 0.5), self.view.bounds.size.width - (10.0 * 2), 80.0)];
            
            switch (index) {
                case 0:
                {
                    self.headerViewErrores.titleLabel.text = @"Número medio de fallos:";
                    long mediafallos= 0;
                    mediafallos = (self.numFallosCasa + self.numFallosCotidianas + self.numFallosEmociones + self.numFallosModales)/4;
                    self.headerViewErrores.subtitleLabel.text = [NSString stringWithFormat: @"%ld", mediafallos];
                }
                    break;
                case 1:
                {
                    self.headerViewErrores.titleLabel.text = @"Número de fallos para el juego Casa:";
                    self.headerViewErrores.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosCasa];
                }
                    break;
                case 2:
                {
                    self.headerViewErrores.titleLabel.text = @"Número de fallos para el juego Cosas Cotidianas:";
                    self.headerViewErrores.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosCotidianas];
                }
                    break;
                case 3:
                {
                    self.headerViewErrores.titleLabel.text = @"Número de fallos para el juego Buenos Modales:";
                    self.headerViewErrores.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosModales];
                }
                    break;
                case 4:
                {
                    self.headerViewErrores.titleLabel.text = @"Número de fallos para el juego Emociones:";
                    self.headerViewErrores.subtitleLabel.text = [NSString stringWithFormat: @"%d", self.numFallosEmociones];
                }
                    break;
                default:
                    break;
            }
        }
            self.headerViewErrores.separatorColor = [UIColor redColor];
            self.barChartViewErrores.headerView = self.headerViewErrores;
            self.headerViewErrores.hidden = NO;
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
        case 2://errores
            self.headerViewErrores.hidden = YES;
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
            return 5;
            break;
        case 2://errores
            return 5;
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
                case 0: //nota media
                {
                    NSLog(@"nota media sk = %f", self.notaMediaJuegos*100);
                    return self.notaMediaJuegos*100;
                }
                    break;
                
                case 1: //nota casa
                {
                    NSLog(@"nota casa sk = %f", self.notaCasa*100);
                    return self.notaCasa*100;
                }
                    break;
                case 2: //nota cotidianas
                {
                    NSLog(@"nota cotidianas sk = %f", self.notaCotidianas*100);
                    return self.notaCotidianas*100;
                }
                    break;
                case 3: //nota modales
                {
                    NSLog(@"nota modales sk = %f", self.notaModales*100);
                    return self.notaModales*100;
                }
                    break;
                case 4: //nota emociones
                {
                    NSLog(@"nota emociones sk = %f", self.notaEmociones*100);
                    return self.notaEmociones*100;
                }
                    break;
                default:
                    break;
            }
            break;
        case 2://errores
            switch (index) {
                case 0://fallos media
                {
                    long fallosmedia = (self.numFallosCasa + self.numFallosCotidianas + self.numFallosEmociones + self.numFallosModales)/4;
                    return fallosmedia;
                }
                    break;
                case 1: //fallos casa
                    return self.numFallosCasa;
                    break;
                case 2: //fallos cotidianas
                    return self.numFallosCotidianas;
                    break;
                case 3: //fallos modales
                {
                    
                    return self.numFallosModales;
                }
                    break;
                case 4: //fallos emociones
                {
                    
                    return self.numFallosEmociones;
                }
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
   
    
    return 20.0f;
}

- (UIColor *)barChartView:(JBBarChartView *)barChartView colorForBarViewAtIndex:(NSUInteger)index
{
    
    return [UIColor yellowColor];
  
}


#pragma mark - Overrides

- (JBChartView *)chartView
{
  
    return self.barChartViewGeneral;
}

@end
