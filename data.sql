PRAGMA defer_foreign_keys=TRUE;
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "users" ("id","email","password_hash","created_at","updated_at") VALUES(1,'admin@hotmail.com','$2a$12$uK69LbclYlmP1Aw32k8xouWtnYmsshNmvYPrSusQrhi357KXyHxmO','2026-03-20 10:34:30','2026-03-20 10:34:30');
CREATE TABLE vehicles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    model TEXT NOT NULL,
    plate_number TEXT NOT NULL UNIQUE,
    vin TEXT,
    mileage REAL DEFAULT 0,
    registration_expiry DATE NOT NULL,
    status TEXT DEFAULT 'نشطة',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP, maintenance_interval REAL DEFAULT 5000, last_maintenance_mileage REAL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO "vehicles" ("id","user_id","model","plate_number","vin","mileage","registration_expiry","status","created_at","updated_at","maintenance_interval","last_maintenance_mileage") VALUES(1,1,'تويوتا كامري 2022','أ ب ج 1234','DAWEWDF34FR5',45000,'2026-06-15','نشطة','2026-03-20 10:34:30','2026-03-20 18:44:25',5000,0);
INSERT INTO "vehicles" ("id","user_id","model","plate_number","vin","mileage","registration_expiry","status","created_at","updated_at","maintenance_interval","last_maintenance_mileage") VALUES(2,1,'هوندا CR-V 2021','س ص ع 7891','kjddc3438sjdkssa',32000,'2026-10-12','نشطة','2026-03-20 18:45:25','2026-03-20 18:45:25',5000,0);
INSERT INTO "vehicles" ("id","user_id","model","plate_number","vin","mileage","registration_expiry","status","created_at","updated_at","maintenance_interval","last_maintenance_mileage") VALUES(3,1,'فورد F-150 2023','ر ط ك 4562','SKDJFSLDFSKDF43',12000,'2023-04-23','تحت الصيانة','2026-03-20 18:46:22','2026-03-22 09:36:55',5000,0);
INSERT INTO "vehicles" ("id","user_id","model","plate_number","vin","mileage","registration_expiry","status","created_at","updated_at","maintenance_interval","last_maintenance_mileage") VALUES(4,1,'نيسان باترول 2022','م ن و 3210','KLJHUGYT698LKLJ',61000,'2026-03-28','نشطة','2026-03-22 08:30:24','2026-03-23 11:37:36',5000,4000);
INSERT INTO "vehicles" ("id","user_id","model","plate_number","vin","mileage","registration_expiry","status","created_at","updated_at","maintenance_interval","last_maintenance_mileage") VALUES(5,1,'تويوتا هايلوكس 2023','ه ي ع 5678','86ADFTRGY54GHYT',22000,'2027-07-02','نشطة','2026-03-22 08:31:23','2026-03-23 12:07:38',5000,14500);
CREATE TABLE drivers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    license_number TEXT NOT NULL UNIQUE,
    phone_number TEXT NOT NULL,
    assigned_vehicle_id INTEGER,
    status TEXT DEFAULT 'نشط',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP, license_expiry DATE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_vehicle_id) REFERENCES vehicles(id) ON DELETE SET NULL
);
INSERT INTO "drivers" ("id","user_id","name","license_number","phone_number","assigned_vehicle_id","status","created_at","updated_at","license_expiry") VALUES(3,1,'احمد محمد السعي','DL-2021-4411','+966 50 123 4567',1,'إجازة','2026-03-20 18:42:14','2026-03-20 21:06:10',NULL);
INSERT INTO "drivers" ("id","user_id","name","license_number","phone_number","assigned_vehicle_id","status","created_at","updated_at","license_expiry") VALUES(4,1,'محمد يوسف سالم بافليح','Twer234Trrtffd3','+966501620302',3,'نشط','2026-03-22 08:22:31','2026-03-22 08:22:31',NULL);
INSERT INTO "drivers" ("id","user_id","name","license_number","phone_number","assigned_vehicle_id","status","created_at","updated_at","license_expiry") VALUES(5,1,'عمر يوسف الحربي','DL-2022-8821','+966 54 321 0987',5,'موقوف','2026-03-22 08:34:37','2026-03-22 08:34:37',NULL);
INSERT INTO "drivers" ("id","user_id","name","license_number","phone_number","assigned_vehicle_id","status","created_at","updated_at","license_expiry") VALUES(6,1,'خالد عيسى','454545454545','454545454545',3,'نشط','2026-03-24 00:11:33','2026-03-24 03:16:39',NULL);
CREATE TABLE trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    driver_id INTEGER NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    distance REAL NOT NULL,
    status TEXT DEFAULT 'قيد الرحلة',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP, end_location TEXT, end_lng REAL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE CASCADE,
    FOREIGN KEY (driver_id) REFERENCES drivers(id) ON DELETE CASCADE
);
INSERT INTO "trips" ("id","user_id","vehicle_id","driver_id","start_time","end_time","distance","status","created_at","updated_at","end_location","end_lng") VALUES(3,1,1,3,'2026-03-20T12:54','2026-03-20T06:54',120,'ملغاة','2026-03-20 18:50:03','2026-03-20 21:16:29',NULL,NULL);
INSERT INTO "trips" ("id","user_id","vehicle_id","driver_id","start_time","end_time","distance","status","created_at","updated_at","end_location","end_lng") VALUES(4,1,5,4,'2026-03-22T00:36','2026-03-22T02:36',20,'قيد الرحلة','2026-03-22 08:36:19','2026-03-22 08:36:19',NULL,NULL);
INSERT INTO "trips" ("id","user_id","vehicle_id","driver_id","start_time","end_time","distance","status","created_at","updated_at","end_location","end_lng") VALUES(5,1,3,3,'2026-03-16T01:36','2026-03-31T03:36',400,'مكتملة','2026-03-22 08:36:51','2026-03-22 08:36:51',NULL,NULL);
CREATE TABLE maintenance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    maintenance_type TEXT NOT NULL,
    date DATE NOT NULL,
    cost REAL NOT NULL,
    status TEXT DEFAULT 'مكتملة',
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE CASCADE
);
INSERT INTO "maintenance" ("id","user_id","vehicle_id","maintenance_type","date","cost","status","notes","created_at","updated_at") VALUES(1,1,3,'تغيير زيت المحرك','2025-03-23',120,'مكتملة',NULL,'2026-03-20 18:47:17','2026-03-22 08:24:18');
INSERT INTO "maintenance" ("id","user_id","vehicle_id","maintenance_type","date","cost","status","notes","created_at","updated_at") VALUES(2,1,3,'فحص المكيف','2027-02-02',250,'مجدولة',NULL,'2026-03-22 08:37:47','2026-03-22 08:37:47');
INSERT INTO "maintenance" ("id","user_id","vehicle_id","maintenance_type","date","cost","status","notes","created_at","updated_at") VALUES(4,1,3,'تغيير فلتر الزيت 4000','2027-02-02',25,'قيد التنفيذ',NULL,'2026-03-22 09:36:55','2026-03-22 09:36:55');
CREATE TABLE expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    category TEXT NOT NULL,
    amount REAL NOT NULL,
    date DATE NOT NULL,
    vehicle_id INTEGER,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE SET NULL
);
INSERT INTO "expenses" ("id","user_id","category","amount","date","vehicle_id","description","created_at","updated_at") VALUES(1,1,'وقود',3200,'2026-01-03',NULL,'وقود أسبوع مارس الأول','2026-03-20 18:48:50','2026-03-20 21:34:06');
CREATE TABLE notifications (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  type TEXT NOT NULL,
  -- 'registration_expiry', 'license_expiry', 'maintenance_due'
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  reference_id INTEGER,
  -- vehicle_id, driver_id, etc.
  is_read BOOLEAN DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (
    user_id
  ) REFERENCES users (
    id
  ) ON DELETE CASCADE
);
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(1,1,'registration_expiry','انتهاء تسجيل مركبة','المركبة فورد F-150 2023 (ر ط ك 4562) انتهى تسجيلها في 2023-04-23',3,0,'2026-03-23 08:00:20');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(2,1,'registration_expiry','اقتراب انتهاء تسجيل مركبة','المركبة نيسان باترول 2022 (م ن و 3210) سينتهي تسجيلها بعد 5 يوم (2026-03-28)',4,0,'2026-03-23 08:00:20');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(3,1,'maintenance_due','صيانة متأخرة','المركبة تويوتا كامري 2022 (أ ب ج 1234) تجاوزت موعد الصيانة بمقدار 40000 كم',1,0,'2026-03-24 04:00:31');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(4,1,'maintenance_due','صيانة متأخرة','المركبة هوندا CR-V 2021 (س ص ع 7891) تجاوزت موعد الصيانة بمقدار 27000 كم',2,0,'2026-03-24 04:00:32');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(5,1,'maintenance_due','صيانة متأخرة','المركبة فورد F-150 2023 (ر ط ك 4562) تجاوزت موعد الصيانة بمقدار 7000 كم',3,0,'2026-03-24 04:00:32');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(6,1,'maintenance_due','صيانة متأخرة','المركبة نيسان باترول 2022 (م ن و 3210) تجاوزت موعد الصيانة بمقدار 52000 كم',4,0,'2026-03-24 04:00:32');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(7,1,'maintenance_due','صيانة متأخرة','المركبة تويوتا هايلوكس 2023 (ه ي ع 5678) تجاوزت موعد الصيانة بمقدار 2500 كم',5,0,'2026-03-24 04:00:32');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(8,1,'registration_expiry','انتهاء تسجيل مركبة','المركبة فورد F-150 2023 (ر ط ك 4562) انتهى تسجيلها في 2023-04-23',3,0,'2026-03-25 04:00:15');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(9,1,'registration_expiry','اقتراب انتهاء تسجيل مركبة','المركبة نيسان باترول 2022 (م ن و 3210) سينتهي تسجيلها بعد 3 يوم (2026-03-28)',4,0,'2026-03-25 04:00:16');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(10,1,'registration_expiry','انتهاء تسجيل مركبة','المركبة فورد F-150 2023 (ر ط ك 4562) انتهى تسجيلها في 2023-04-23',3,0,'2026-03-26 04:00:36');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(11,1,'registration_expiry','اقتراب انتهاء تسجيل مركبة','المركبة نيسان باترول 2022 (م ن و 3210) سينتهي تسجيلها بعد 2 يوم (2026-03-28)',4,0,'2026-03-26 04:00:36');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(12,1,'maintenance_due','صيانة متأخرة','المركبة تويوتا كامري 2022 (أ ب ج 1234) تجاوزت موعد الصيانة بمقدار 40000 كم',1,0,'2026-03-26 04:00:37');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(13,1,'maintenance_due','صيانة متأخرة','المركبة هوندا CR-V 2021 (س ص ع 7891) تجاوزت موعد الصيانة بمقدار 27000 كم',2,0,'2026-03-26 04:00:37');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(14,1,'maintenance_due','صيانة متأخرة','المركبة فورد F-150 2023 (ر ط ك 4562) تجاوزت موعد الصيانة بمقدار 7000 كم',3,0,'2026-03-26 04:00:37');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(15,1,'maintenance_due','صيانة متأخرة','المركبة نيسان باترول 2022 (م ن و 3210) تجاوزت موعد الصيانة بمقدار 52000 كم',4,0,'2026-03-26 04:00:37');
INSERT INTO "notifications" ("id","user_id","type","title","message","reference_id","is_read","created_at") VALUES(16,1,'maintenance_due','صيانة متأخرة','المركبة تويوتا هايلوكس 2023 (ه ي ع 5678) تجاوزت موعد الصيانة بمقدار 2500 كم',5,0,'2026-03-26 04:00:38');
CREATE TABLE driver_reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    driver_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (driver_id) REFERENCES drivers(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO "driver_reviews" ("id","driver_id","user_id","rating","comment","created_at","updated_at") VALUES(1,3,1,4,'لخخي','2026-03-24 05:15:07','2026-03-24 05:15:07');
INSERT INTO "driver_reviews" ("id","driver_id","user_id","rating","comment","created_at","updated_at") VALUES(2,6,1,4,'سيئ الفترة هذه','2026-03-24 05:33:44','2026-03-24 05:33:44');
INSERT INTO "driver_reviews" ("id","driver_id","user_id","rating","comment","created_at","updated_at") VALUES(3,6,1,3,'جيد اليوم','2026-03-24 05:33:59','2026-03-24 05:33:59');
INSERT INTO "driver_reviews" ("id","driver_id","user_id","rating","comment","created_at","updated_at") VALUES(4,6,1,3,'','2026-03-24 05:54:41','2026-03-24 05:54:41');
INSERT INTO "driver_reviews" ("id","driver_id","user_id","rating","comment","created_at","updated_at") VALUES(5,6,1,2,'','2026-03-24 05:55:29','2026-03-24 05:55:29');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('users',1);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('vehicles',5);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('drivers',7);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('trips',5);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('maintenance',4);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('expenses',1);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('notifications',16);
INSERT INTO "sqlite_sequence" ("name","seq") VALUES('driver_reviews',5);
CREATE INDEX idx_vehicles_user_id ON vehicles(user_id);
CREATE INDEX idx_drivers_user_id ON drivers(user_id);
CREATE INDEX idx_trips_user_id ON trips(user_id);
CREATE INDEX idx_trips_vehicle_id ON trips(vehicle_id);
CREATE INDEX idx_trips_driver_id ON trips(driver_id);
CREATE INDEX idx_maintenance_user_id ON maintenance(user_id);
CREATE INDEX idx_maintenance_vehicle_id ON maintenance(vehicle_id);
CREATE INDEX idx_expenses_user_id ON expenses(user_id);
CREATE INDEX idx_expenses_vehicle_id ON expenses(vehicle_id);
CREATE INDEX idx_notifications_created_at ON notifications(created_at);
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_is_read ON notifications(is_read);
CREATE INDEX idx_driver_reviews_user_id ON driver_reviews(user_id);
CREATE INDEX idx_driver_reviews_driver_id ON driver_reviews(driver_id);
