# UtilsFunction

##提供一些共有的类方法,可以下载在viewcontroller.m里面验证方法的正确性,使用的时候直接把UtilsFunction.h和.m拖到工程里面即可


/**
 邮箱验证

 @param email 邮箱地址

 @return 是否符合规则
 */
+ (BOOL)checkEmailIsLegal:(NSString *)email;


/**
 身份证号码核实

 @param idNumber 身份证号

 @return 是否符合规则
 */
+ (BOOL)checkIdentityCardNoIsLegal:(NSString *)idNumber;

/**
 根据颜色生成图片

 @param color 颜色

 @return 图片
 */
+ (UIImage *) imageWithColor: (UIColor *) color ;


/**
 汉字转拼音
 
 @param chinese 汉字
 
 @return 拼音
 */

+ (NSString *)chineseWordSwitchIntoPinyinWith:(NSString *)chinese;
/**
 根据时间戳生产时间字符串

 @param timeStampStr 时间戳

 @return 时间戳对应的时间字符串
 */
+ (NSString*)switchTimeStampToTimeBySecond:(NSString*) timeStampStr;

+ (NSString *)switchTimeStamptoTimeByDay:(NSString *)timeStampStr;

/**
 根据时间字符串生成时间戳

 @param timeStr 时间字符串

 @return 时间字符串对应的时间戳
 */
+ (NSString*)switchTimeStrToTimeStamp:(NSString*) timeStr;

/**
 生成当前时间字符串

 @return 时间字符串
 */
+ (NSString*)creatrTimeStrCurrentWithDay;

+ (NSString*)creatrTimeStrCurrentWithSecond;

/**
 判断手机号码是否合法

 @param phoneNumber 手机号码

 @return 手机号码是否合法
 */
+ (BOOL)checkPhoneNumIsLegal:(NSString *)phoneNumber;


/**
 判断字符串是否为空

 @param str 字符串

 @return 字符串是否为空
 */
+ (BOOL)checkStringIsNull:(NSString *)str;

/**
 判断密码合法性（6-18位数字、字母和符号组成)

 @param password 用户输入的密码

 @return 密码是否合法
 */
+(BOOL)checkPasswordIsLegal:(NSString *)password;

/**
 判断昵称是否合法

 @param nickName 用户输入的昵称

 @return 昵称是否合法
 */
+ (BOOL)checkNickNameIsLegal:(NSString *)nickName;

/**
 判断数组是否为空

 @param array 数组

 @return 数组是否为空
 */
+ (BOOL)checkEmptyArrayIsEmpty:(NSMutableArray *)array;

/**
 给html字符串添加一些标签，适应apple屏幕

 @param htmlStr 代码字符串

 @return 添加头部的html代码字符串
 */
+ (NSString *)adaptWebViewForHtml:(NSString *) htmlStr;

/**
 检测是否为纯数字

 @param string 待检测字符串

 @return 布尔值
 */
+ (BOOL)checkValueIsNumberAll:(NSString *)string;

/**
 检测是否为浮点型

 @param string 待检测字符串

 @return 布尔值
 */
+ (BOOL)checkValueIsFloat:(NSString *)string;


/**
 替换电话号码的中间四位为星号

 @param phoneNum 未替换的电话号码

 @return 已替换的电话号码
 */
+ (NSString *)hiddenMiddleNumOfPhoneNum:(NSString*)phoneNum;

/**
 去掉字符串中的特殊符号

 @param string 没处理字符串

 @return 已去掉特殊符号的字符串
 */
+ (NSString *)removeSpecialChar:(NSString *)string;

/**
 转化较大的数字为万，百万等

 @param count 原来的整数

 @return 转换后的文字
 */
+ (NSString *)switchBigNumIntoUnit:(int)count;

/**
 获取设备唯一标示

 @return 设备标示
 */
+ (NSString *)getUniqueDeviceId;


/**
 获取app版本号

 @return 是否新版本
 */
+ (NSString *)GetAppCurrentVersion;


