CREATE TABLE owners (
    owner_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
   
);
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),           -- معرف المستخدم (تلقائي)
    first_name VARCHAR(100) NOT NULL,            -- الاسم الأول
    last_name VARCHAR(100) NOT NULL,             -- الاسم الأخير
    email VARCHAR(100) UNIQUE NOT NULL,          -- البريد الإلكتروني (يجب أن يكون فريد)
    password VARCHAR(255) NOT NULL,              -- كلمة المرور (يجب أن تكون مشفرة)
    phone_number VARCHAR(20),                    -- رقم الهاتف
    profile_image_url VARCHAR(255),              -- رابط الصورة الشخصية
   
);

CREATE TABLE meeting_requests (
    id INT PRIMARY KEY IDENTITY(1,1),
    child_name VARCHAR(255) NOT NULL,
    child_age INT NOT NULL,
    programs VARCHAR(100) NOT NULL,  -- مثل Full-time, Part-time, Flexible
    parent_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    meeting_date DATETIME NOT NULL,
    additional_notes TEXT,
    preschool_id INT,  -- يمثل العلاقة مع جدول الحضانات
   
    FOREIGN KEY (preschool_id) REFERENCES preschools(preschool_id)
);


CREATE TABLE preschools (
    preschool_id INT PRIMARY KEY IDENTITY(1,1),
    owner_id INT,
    preschool_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    program_type VARCHAR(50) NOT NULL,
    age_group VARCHAR(50) NOT NULL,
    programs TEXT,
    social_links VARCHAR(255),
    logo VARCHAR(255),
 
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE facilities (
    facility_id INT PRIMARY KEY IDENTITY(1,1),
    facility_name VARCHAR(100) NOT NULL,
    preschool_id INT,
    FOREIGN KEY (preschool_id) REFERENCES preschools(preschool_id)
);
CREATE TABLE programs (
    program_id INT PRIMARY KEY IDENTITY(1,1),
    program_name VARCHAR(255) NOT NULL,
    description TEXT,
    preschool_id INT,
    FOREIGN KEY (preschool_id) REFERENCES preschools(preschool_id)
);


CREATE TABLE payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    preschool_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
  
    FOREIGN KEY (preschool_id) REFERENCES preschools(preschool_id)
);


المالكون (owners): تخزين بيانات أصحاب الحضانات.
المستخدمون (users): تخزين بيانات المستخدمين.
طلبات الاجتماعات (meeting_requests): تخزين طلبات الاجتماعات مع الحضانة.
الحضانات (preschools): تخزين بيانات الحضانات.
المرافق (facilities): تخزين بيانات المرافق الخاصة بكل حضانة.
البرامج (programs): تخزين بيانات البرامج المقدمة من قبل الحضانات.
المدفوعات (payments): تخزين بيانات المدفوعات التي تمت من قبل المستخدمين.