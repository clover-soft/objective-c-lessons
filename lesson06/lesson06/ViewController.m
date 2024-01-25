//
//  ViewController.m
//  lesson06
//
//  Created by yakov on 25.01.2024.
//

#import "ViewController.h"
#import "Robot.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Инициализация полей
    self.robotNameField = [self createTextFieldWithPlaceholder:@"Название робота"];
    self.coordinateXField = [self createTextFieldWithPlaceholder:@"Координата X"];
    self.coordinateYField = [self createTextFieldWithPlaceholder:@"Координата Y"];
    self.descriptionTextView = [self createTextView];
    self.descriptionTextView.editable = NO;
    self.robotNameField.text = @"Robot#1";
    self.coordinateXField.text = @"0.0";
    self.coordinateYField.text = @"0.0";
    
    
    // Инициализация кнопок
    self.readFromFileButton = [self createButtonWithTitle:@"Считать из File"];
    self.writeToFileButton = [self createButtonWithTitle:@"Записать в File"];
    self.readFromUserDefaultsButton = [self createButtonWithTitle:@"Считать из UserDefaults"];
    self.writeToUserDefaultsButton = [self createButtonWithTitle:@"Записать в UserDefaults"];
    
    // Добавление элементов на view
    [self.view addSubview:self.robotNameField];
    [self.view addSubview:self.coordinateXField];
    [self.view addSubview:self.coordinateYField];
    [self.view addSubview:self.descriptionTextView];
    
    [self.view addSubview:self.readFromFileButton];
    [self.view addSubview:self.writeToFileButton];
    [self.view addSubview:self.readFromUserDefaultsButton];
    [self.view addSubview:self.writeToUserDefaultsButton];
    
}

// Создание UITextField с заданным placeholder
- (UITextField *)createTextFieldWithPlaceholder:(NSString *)placeholder {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    return textField;
}

// Создание UITextView
- (UITextView *)createTextView {
    UITextView *textView = [[UITextView alloc] init];
    textView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    return textView;
}

// Создание UIButton с заданным заголовком
- (UIButton *)createButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat statusBarHeight = 100;
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat topOffset = statusBarHeight + navigationBarHeight;
    
    CGFloat padding = 10.0;
    CGFloat fieldHeight = 30.0;
    
    // Расположение полей
    self.robotNameField.frame = CGRectMake(padding, topOffset + padding, self.view.frame.size.width - 2 * padding, fieldHeight);
    self.coordinateXField.frame = CGRectMake(padding, CGRectGetMaxY(self.robotNameField.frame) + padding, self.view.frame.size.width - 2 * padding, fieldHeight);
    self.coordinateYField.frame = CGRectMake(padding, CGRectGetMaxY(self.coordinateXField.frame) + padding, self.view.frame.size.width - 2 * padding, fieldHeight);
    
    CGFloat descriptionTextViewHeight = 100.0;
    self.descriptionTextView.frame = CGRectMake(padding, CGRectGetMaxY(self.coordinateYField.frame) + padding, self.view.frame.size.width - 2 * padding, descriptionTextViewHeight);
    
    CGFloat bottomPadding = 50.0; // Отступ от нижнего края экрана до нижней кнопки
    CGFloat buttonWidth = self.view.frame.size.width - 2 * padding; // Ширина кнопки
    CGFloat buttonHeight = 44; // Высота кнопки
    
    // Расположение нижней кнопки
    self.writeToUserDefaultsButton.frame = CGRectMake(padding, self.view.frame.size.height - bottomPadding - buttonHeight, buttonWidth, buttonHeight);
    
    // Расположение кнопки над ней
    self.readFromUserDefaultsButton.frame = CGRectMake(padding, CGRectGetMinY(self.writeToUserDefaultsButton.frame) - padding - buttonHeight, buttonWidth, buttonHeight);
    
    // Расположение следующей кнопки
    self.writeToFileButton.frame = CGRectMake(padding, CGRectGetMinY(self.readFromUserDefaultsButton.frame) - padding - buttonHeight, buttonWidth, buttonHeight);
    
    // Расположение верхней кнопки
    self.readFromFileButton.frame = CGRectMake(padding, CGRectGetMinY(self.writeToFileButton.frame) - padding - buttonHeight, buttonWidth, buttonHeight);
    
    
    // Настройка цветов
#define btnColor [UIColor systemGray6Color]
#define fieldColor [UIColor systemGray6Color]
    self.view.backgroundColor = [UIColor whiteColor];
    self.robotNameField.backgroundColor = fieldColor;
    self.coordinateXField.backgroundColor = fieldColor;
    self.coordinateYField.backgroundColor = fieldColor;
    self.descriptionTextView.backgroundColor = fieldColor;
    
    self.readFromFileButton.backgroundColor = btnColor;
    self.writeToFileButton.backgroundColor = btnColor;
    self.readFromUserDefaultsButton.backgroundColor = btnColor;
    self.writeToUserDefaultsButton.backgroundColor = btnColor;
}


// Обработка нажатий кнопок
- (void)buttonTapped:(UIButton *)sender {
    if (sender == self.readFromFileButton) {
        [self readFromFile];
    } else if (sender == self.writeToFileButton) {
        [self writeToFile];
    } else if (sender == self.readFromUserDefaultsButton) {
        [self readFromUserDefaults];
    } else if (sender == self.writeToUserDefaultsButton) {
        [self writeToUserDefaults];
    }
}

// Создание экземлпяра класса Robot по данным из полей
- (Robot *)createRobot {
    NSString *robotName = self.robotNameField.text;
    double xCoordinate = [self.coordinateXField.text doubleValue];
    double yCoordinate = [self.coordinateYField.text doubleValue];
    Robot *robot = [[Robot alloc] initWithName:robotName xCoordinate:xCoordinate yCoordinate:yCoordinate];
    self.descriptionTextView.text = [NSString stringWithFormat:@"%@\nX-coordinate: %f\nY-coordinate: %f",
                                     robot.name,
                                     robot.xCoordinate,
                                     robot.yCoordinate];
    return robot;
}
// Установка полей по данным экземлпяра класса Robot
- (void)setRobotValues:(Robot *)robot {
    NSLog(@"Robot name: %@", robot.name);
    NSLog(@"X coordinate: %f", robot.xCoordinate);
    NSLog(@"Y coordinate: %f", robot.yCoordinate);
    self.robotNameField.text = robot.name;
    self.coordinateXField.text = [NSString stringWithFormat:@"%f", robot.xCoordinate];
    self.coordinateYField.text = [NSString stringWithFormat:@"%f", robot.yCoordinate];
    self.descriptionTextView.text = [NSString stringWithFormat:@"%@\nX-coordinate: %f\nY-coordinate: %f",
                                     robot.name,
                                     robot.xCoordinate,
                                     robot.yCoordinate];
}

- (void)readFromFile {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *url = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *folderURL = [url URLByAppendingPathComponent:@"Robots"];
    NSURL *fileURL = [folderURL URLByAppendingPathComponent:self.robotNameField.text];
    NSData *robotData;
    if ([fileManager fileExistsAtPath:fileURL.path]) {
        NSLog(@"Файл существует: %@", fileURL);
        robotData = [fileManager contentsAtPath:fileURL.path];
        NSLog(@"RobotData: %@", robotData);
        Robot *robot = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:
                                                                     Robot.class,
                                                                     NSString.class,
                                                                     nil]
                                                           fromData:robotData error:nil];
        [self setRobotValues:robot];
        NSLog(@"Чтение из файла: %@", self.robotNameField.text);
    } else {
        NSLog(@"Файл не существует: %@", self.robotNameField.text);
    }
}

- (void)writeToFile {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    Robot *robot = [self createRobot]; // Создание экземпляра робота
    NSURL *url = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *folderURL = [url URLByAppendingPathComponent:@"Robots"];
    NSURL *fileURL = [folderURL URLByAppendingPathComponent:robot.name];
    NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:nil];
    NSError *error = nil;
    if ([fileManager createDirectoryAtURL:folderURL withIntermediateDirectories:YES attributes:nil error:&error]) { // Попытка создать директорию
        if ([fileManager fileExistsAtPath:fileURL.path]) { // Проверка существования файла
            NSError *deleteError = nil;
            BOOL fileDeleted = [fileManager removeItemAtURL:fileURL error:&deleteError]; // Удаление файла, если он существует
            if (fileDeleted) {
                // Файл успешно удален, теперь можно записать новые данные
                BOOL success = [robotData writeToFile:fileURL.path options:NSDataWritingAtomic error:&error]; // Запись данных в файл
                if (success) {
                    NSLog(@"Файл успешно записан");
                } else {
                    NSLog(@"Не удалось записать данные в файл: %@, ошибка: %@", fileURL, error);
                }
            } else {
                NSLog(@"Не удалось удалить файл: %@, ошибка: %@", fileURL, deleteError);
            }
        } else {
            // Файл не существует, можно сразу записывать новые данные
            BOOL success = [robotData writeToFile:fileURL.path options:NSDataWritingAtomic error:&error]; // Запись данных в файл
            if (!success) {
                NSLog(@"Не удалось записать данные в файл: %@, ошибка: %@", fileURL, error);
            }
        }
    } else {
        NSLog(@"Не удалось создать папку: %@, ошибка: %@", folderURL, error);
    }
}

- (void)readFromUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *robotData = [defaults objectForKey:self.robotNameField.text];
    Robot *robot = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:
                                                         Robot.class,
                                                         NSString.class,
                                                         nil]
                                               fromData:robotData error:nil];
    [self setRobotValues:robot];
    NSLog(@"Чтение из UserDefaults robot name: %@", self.robotNameField.text);
}

- (void)writeToUserDefaults{
    Robot *robot = [self createRobot];
    NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot
                                              requiringSecureCoding:YES
                                                              error:nil];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:robotData forKey:self.robotNameField.text];
    NSLog(@"Запись в UserDefaults Robot name:  %@",self.robotNameField.text);
}

@end
