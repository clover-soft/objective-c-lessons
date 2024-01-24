//
//  ViewController.m
//  lesson05
//
//  Created by yakov on 23.01.2024.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UISegmentedControl *requestTypeSegmentedControl;
@property (strong, nonatomic) UITextField *urlTextField;
@property (strong, nonatomic) UITextField *paramName1TextField;
@property (strong, nonatomic) UITextField *paramValue1TextField;
@property (strong, nonatomic) UITextField *paramName2TextField;
@property (strong, nonatomic) UITextField *paramValue2TextField;
@property (strong, nonatomic) UITextView *resultsTextView;
@property (strong, nonatomic) UIButton *sendRequestButton;
- (void)setupUI;
- (void)sendRequestButtonTapped;
@end

@implementation ViewController
- (instancetype)initWithLoader:(Loader *)loader {
    self = [super init];
    if (self) {
        _loader = loader;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    // Инициализация переключателя типа запроса
    self.requestTypeSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"GET", @"POST"]];
    [self.requestTypeSegmentedControl addTarget:self action:@selector(requestTypeChanged:) forControlEvents:UIControlEventValueChanged];
    self.requestTypeSegmentedControl.selectedSegmentIndex = 0; // Установка GET по умолчанию
    [self.view addSubview:self.requestTypeSegmentedControl];
    
    // Инициализация поля адресной строки
    self.urlTextField = [[UITextField alloc] init];
    self.urlTextField.placeholder = @"URL";
    self.urlTextField.text = @"https://postman-echo.com/get"; // Установка GET по умолчанию
    self.urlTextField.backgroundColor = [UIColor systemGray6Color];
    self.urlTextField.enabled = NO;
    [self.view addSubview:self.urlTextField];
    
    // Инициализация полей для параметров
    self.paramName1TextField = [[UITextField alloc] init];
    self.paramName1TextField.placeholder = @"Parameter Name 1";
    self.paramName1TextField.text = @"arg1";
    self.paramName1TextField.backgroundColor = [UIColor systemGray6Color];
    [self.view addSubview:self.paramName1TextField];
    
    self.paramValue1TextField = [[UITextField alloc] init];
    self.paramValue1TextField.placeholder = @"Parameter Value 1";
    self.paramValue1TextField.text = @"first";
    self.paramValue1TextField.backgroundColor = [UIColor systemGray6Color];
    [self.view addSubview:self.paramValue1TextField];
    
    self.paramName2TextField = [[UITextField alloc] init];
    self.paramName2TextField.placeholder = @"Parameter Name 2";
    self.paramName2TextField.text = @"arg2";
    self.paramName2TextField.backgroundColor = [UIColor systemGray6Color];
    [self.view addSubview:self.paramName2TextField];
    
    self.paramValue2TextField = [[UITextField alloc] init];
    self.paramValue2TextField.placeholder = @"Parameter Value 2";
    self.paramValue2TextField.text = @"second";
    self.paramValue2TextField.backgroundColor = [UIColor systemGray6Color];
    [self.view addSubview:self.paramValue2TextField];
    
    // Инициализация поля для вывода результатов
    self.resultsTextView = [[UITextView alloc] init];
    self.resultsTextView.editable = NO;
    self.resultsTextView.backgroundColor = [UIColor systemGray6Color];
    [self.view addSubview:self.resultsTextView];
    
    // Инициализация кнопки для отправки запроса
    self.sendRequestButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.sendRequestButton setTitle:@"Send Request" forState:UIControlStateNormal];
    [self.sendRequestButton addTarget:self action:@selector(sendRequestButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sendRequestButton];
    
    // Отключим autoresizing mask, чтобы использовать Auto Layout
    self.requestTypeSegmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    self.urlTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.paramName1TextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.paramValue1TextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.paramName2TextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.paramValue2TextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.resultsTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.sendRequestButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Началл с верхнего элемента и будем располагать их сверху вниз
    [NSLayoutConstraint activateConstraints:@[
        // Переключатель типа запроса
        [self.requestTypeSegmentedControl.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20.0],
        [self.requestTypeSegmentedControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.requestTypeSegmentedControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Поле с адресной строкой
        [self.urlTextField.topAnchor constraintEqualToAnchor:self.requestTypeSegmentedControl.bottomAnchor constant:20.0],
        [self.urlTextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.urlTextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Название параметра 1
        [self.paramName1TextField.topAnchor constraintEqualToAnchor:self.urlTextField.bottomAnchor constant:20.0],
        [self.paramName1TextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.paramName1TextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Значение параметра 1
        [self.paramValue1TextField.topAnchor constraintEqualToAnchor:self.paramName1TextField.bottomAnchor constant:20.0],
        [self.paramValue1TextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.paramValue1TextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Название параметра 2
        [self.paramName2TextField.topAnchor constraintEqualToAnchor:self.paramValue1TextField.bottomAnchor constant:20.0],
        [self.paramName2TextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.paramName2TextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Значение параметра 2
        [self.paramValue2TextField.topAnchor constraintEqualToAnchor:self.paramName2TextField.bottomAnchor constant:20.0],
        [self.paramValue2TextField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.paramValue2TextField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Поле для вывода результатов
        [self.resultsTextView.topAnchor constraintEqualToAnchor:self.paramValue2TextField.bottomAnchor constant:20.0],
        [self.resultsTextView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.resultsTextView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        
        // Кнопка для отправки пост/гет запроса
        [self.sendRequestButton.topAnchor constraintEqualToAnchor:self.resultsTextView.bottomAnchor constant:20.0],
        [self.sendRequestButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20.0],
        [self.sendRequestButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20.0],
        [self.sendRequestButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20.0],
    ]];
    
    // Приоритет для constraints кнопки, чтобы при необходимости она могла сжиматься
    [self.sendRequestButton setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    
    // Constraints для поля результатов, чтобы оно растягивалось в соответствии с доступным пространством
    [self.resultsTextView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    
}

- (void)requestTypeChanged:(UISegmentedControl *)segmentedControl {
    // Базовый URL для запросов
    NSString *baseUrl = @"https://postman-echo.com/";
    // Проверка, какой сегмент выбран
    if (segmentedControl.selectedSegmentIndex == 0) {
        // GET запрос
        self.urlTextField.text = [baseUrl stringByAppendingFormat:@"get"];
    } else {
        // POST запрос
        self.urlTextField.text = [baseUrl stringByAppendingString:@"post"];
    }
}

- (void)sendRequestButtonTapped {
        NSString *requestType = [self.requestTypeSegmentedControl titleForSegmentAtIndex:self.requestTypeSegmentedControl.selectedSegmentIndex];
        NSString *url = self.urlTextField.text;
        NSDictionary *parameters = @{
            self.paramName1TextField.text: self.paramValue1TextField.text,
            self.paramName2TextField.text: self.paramValue2TextField.text
        };
    
        if ([requestType isEqualToString:@"GET"]) {
            [self.loader performGetRequestFromURL:url arguments:parameters block:^(NSDictionary *dict, NSError *error) {
                [self handleResponse:dict error:error];
            }];
        } else if ([requestType isEqualToString:@"POST"]) {
            [self.loader performPostRequestFromURL:url arguments:parameters block:^(NSDictionary *dict, NSError *error) {
                [self handleResponse:dict error:error];
            }];
        }
}

- (void)handleResponse:(NSDictionary *)response error:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (error) {
            self.resultsTextView.text = error.localizedDescription;
            // If possible, show response headers
            if (error.userInfo[@"com.alamofire.serialization.response.error.response"]) {
                NSHTTPURLResponse *httpResponse = error.userInfo[@"com.alamofire.serialization.response.error.response"];
                self.resultsTextView.text = [httpResponse.allHeaderFields descriptionInStringsFileFormat];
            }
        } else {
            self.resultsTextView.text = [response descriptionInStringsFileFormat];
        }
    });
}

@end
