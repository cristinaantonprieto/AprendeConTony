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
@synthesize imagenUsuario;
@synthesize viewSkillCasa, viewSkillCotidianas, viewSkillEmociones, viewSkillGeneral, viewSkillModales, scrollView;
@synthesize barChartViewGeneral, barChartViewCasa,barChartViewCotidianas,barChartViewEmociones,barChartViewModales;
@synthesize notaCasa, notaCotidianas, notaEmociones, notaModales;
@synthesize tiempoCasa, tiempoCotidianas, tiempoEmociones, tiempoModales;
@synthesize numFallosCasa, numFallosCotidianas, numFallosEmociones, numFallosModales;
@synthesize numFallosEmparejarCasa, numFallosEmparejarCotidianas, numFallosEmparejarEmociones, numFallosEmparejarModales, numFallosOrdenarCasa, numFallosOrdenarCotidianas, numFallosOrdenarEmociones, numFallosOrdenarModales, numFallosSeleccionarCasa, numFallosSeleccionarCotidianas, numFallosSeleccionarEmociones, numFallosSeleccionarModales;


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
    self.barChartViewGeneral.frame = CGRectMake(self.viewSkillGeneral.frame.origin.x, self.viewSkillGeneral.frame.origin.y, self.barChartViewGeneral.frame.size.width, 392);
    
   
 
    self.barChartViewGeneral.delegate = self;
    self.barChartViewGeneral.dataSource = self;
    
    self.barChartViewGeneral.minimumValue = 0.0f;
    self.barChartViewGeneral.inverted = NO;
    self.barChartViewGeneral.backgroundColor = [UIColor clearColor];
    
    self.barChartViewCasa = [[JBBarChartView alloc] init];
    self.barChartViewCasa.frame = self.viewSkillCasa.frame;
    self.barChartViewCasa.frame = CGRectMake(self.viewSkillCasa.frame.origin.x, self.viewSkillCasa.frame.origin.y, self.barChartViewCasa.frame.size.width, 392);
    
    
    self.barChartViewCasa.delegate = self;
    self.barChartViewCasa.dataSource = self;
    
    self.barChartViewCasa.minimumValue = 0.0f;
    self.barChartViewCasa.inverted = NO;
    self.barChartViewCasa.backgroundColor = [UIColor clearColor];
    
    self.barChartViewCotidianas = [[JBBarChartView alloc] init];
    self.barChartViewCotidianas.frame = self.viewSkillCotidianas.frame;
    self.barChartViewCotidianas.frame = CGRectMake(self.viewSkillCotidianas.frame.origin.x, self.viewSkillCotidianas.frame.origin.y, self.barChartViewCotidianas.frame.size.width, 392);
    
    
    self.barChartViewCotidianas.delegate = self;
    self.barChartViewCotidianas.dataSource = self;
    
    self.barChartViewCotidianas.minimumValue = 0.0f;
    self.barChartViewCotidianas.inverted = NO;
    self.barChartViewCotidianas.backgroundColor = [UIColor clearColor];
    
    self.barChartViewModales = [[JBBarChartView alloc] init];
    self.barChartViewModales.frame = self.viewSkillModales.frame;
    self.barChartViewModales.frame = CGRectMake(self.viewSkillModales.frame.origin.x, self.viewSkillModales.frame.origin.y, self.barChartViewModales.frame.size.width, 392);
    
    
    self.barChartViewModales.delegate = self;
    self.barChartViewModales.dataSource = self;
    
    self.barChartViewModales.minimumValue = 0.0f;
    self.barChartViewModales.inverted = NO;
    self.barChartViewModales.backgroundColor = [UIColor clearColor];
    
    self.barChartViewEmociones = [[JBBarChartView alloc] init];
    self.barChartViewEmociones.frame = self.viewSkillEmociones.frame;
    self.barChartViewEmociones.frame = CGRectMake(self.viewSkillEmociones.frame.origin.x, self.viewSkillEmociones.frame.origin.y, self.barChartViewEmociones.frame.size.width, 392);
    
    
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
            return 3;
            break;
        case 3://cotidianas
            return 3;
            break;
        case 4://modales
            return 3;
            break;
        case 5://emociones
            return 3;
            break;
        default:
            break;
    }
    return 3;
}

- (void)barChartView:(JBBarChartView *)barChartView didSelectBarAtIndex:(NSUInteger)index touchPoint:(CGPoint)touchPoint
{
    
}

- (void)didDeselectBarChartView:(JBBarChartView *)barChartView
{
    
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

- (UIColor *)barSelectionColorForBarChartView:(JBBarChartView *)barChartView
{
    return [UIColor whiteColor];
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
