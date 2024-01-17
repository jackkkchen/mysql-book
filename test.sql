-- 创建患者表格
CREATE TABLE Patients (
    subject_id INTEGER PRIMARY KEY,
    gender TEXT,
    dob TEXT,
    dod TEXT
);

-- 创建住院信息表格
CREATE TABLE Admissions (
    hadm_id INTEGER PRIMARY KEY,
    subject_id INTEGER,
    admittime TEXT,
    dischtime TEXT,
    diagnosis TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id)
);

-- 创建重症监护病房信息表格
CREATE TABLE ICUStays (
    icustay_id INTEGER PRIMARY KEY,
    hadm_id INTEGER,
    intime TEXT,
    outtime TEXT,
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- 创建临床事件表格
CREATE TABLE Chartevents (
    subject_id INTEGER,
    hadm_id INTEGER,
    icustay_id INTEGER,
    charttime TEXT,
    itemid INTEGER,
    value TEXT,
    valuenum REAL,
    valueuom TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id),
    FOREIGN KEY (icustay_id) REFERENCES ICUStays(icustay_id)
);

-- 创建实验室检查结果表格
CREATE TABLE Labevents (
    subject_id INTEGER,
    hadm_id INTEGER,
    itemid INTEGER,
    charttime TEXT,
    value TEXT,
    valuenum REAL,
    valueuom TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- 创建药物处方表格
CREATE TABLE Prescriptions (
    subject_id INTEGER,
    hadm_id INTEGER,
    starttime TEXT,
    endtime TEXT,
    drug TEXT,
    dose_val_rx REAL,
    dose_unit_rx TEXT,
    route TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- 创建临床注记表格
CREATE TABLE Notes (
    subject_id INTEGER,
    hadm_id INTEGER,
    chartdate TEXT,
    category TEXT,
    description TEXT,
    text TEXT,
    FOREIGN KEY (subject_id) REFERENCES Patients(subject_id),
    FOREIGN KEY (hadm_id) REFERENCES Admissions(hadm_id)
);

-- Insert data as before, SQLite supports the same INSERT syntax as MySQL
