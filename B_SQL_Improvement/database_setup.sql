-- 1️⃣ 创建数据库（如果没创建）
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

-- 2️⃣ 先创建 Job Categories 表
CREATE TABLE job_categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    sort_order INT,
    created_by INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME NULL
);

-- 3️⃣ 再创建 Job Types 表
CREATE TABLE job_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    job_category_id INT,
    sort_order INT,
    created_by INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME NULL,
    FOREIGN KEY (job_category_id) REFERENCES job_categories(id) ON DELETE CASCADE
);

-- 4️⃣ 创建 Affiliates 表（包含 Tools, Career Paths, Rec Qualifications, Req Qualifications）
CREATE TABLE affiliates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type INT CHECK (type IN (1,2,3)), -- 1 = Tools, 2 = Qualifications, 3 = Career Paths
    deleted DATETIME NULL
);

-- 5️⃣ 创建 Jobs 表（确保 job_categories、job_types 先创建）
CREATE TABLE jobs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    media_id INT,
    job_category_id INT,
    job_type_id INT,
    description TEXT,
    detail TEXT,
    business_skill TEXT,
    knowledge TEXT,
    location VARCHAR(255),
    activity TEXT,
    academic_degree_doctor BOOLEAN,
    academic_degree_master BOOLEAN,
    academic_degree_professional BOOLEAN,
    academic_degree_bachelor BOOLEAN,
    salary_statistic_group VARCHAR(255),
    salary_range_first_year DECIMAL(10,2),
    salary_range_average DECIMAL(10,2),
    salary_range_remarks TEXT,
    restriction TEXT,
    estimated_total_workers INT,
    remarks TEXT,
    url VARCHAR(255),
    seo_description TEXT,
    seo_keywords TEXT,
    sort_order INT,
    publish_status BOOLEAN DEFAULT 1,
    version INT,
    created_by INT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted DATETIME NULL,
    FOREIGN KEY (job_category_id) REFERENCES job_categories(id) ON DELETE CASCADE,
    FOREIGN KEY (job_type_id) REFERENCES job_types(id) ON DELETE CASCADE
);

-- 6️⃣ 创建 Personalities 表
CREATE TABLE personalities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted DATETIME NULL
);

-- 7️⃣ 创建 Practical Skills 表
CREATE TABLE practical_skills (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted DATETIME NULL
);

-- 8️⃣ 创建 Basic Abilities 表
CREATE TABLE basic_abilities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    deleted DATETIME NULL
);

-- 9️⃣ 关系表：Jobs - Personalities
CREATE TABLE jobs_personalities (
    job_id INT,
    personality_id INT,
    PRIMARY KEY (job_id, personality_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (personality_id) REFERENCES personalities(id) ON DELETE CASCADE
);

-- 🔟 关系表：Jobs - Practical Skills
CREATE TABLE jobs_practical_skills (
    job_id INT,
    practical_skill_id INT,
    PRIMARY KEY (job_id, practical_skill_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (practical_skill_id) REFERENCES practical_skills(id) ON DELETE CASCADE
);

-- 11️⃣ 关系表：Jobs - Basic Abilities
CREATE TABLE jobs_basic_abilities (
    job_id INT,
    basic_ability_id INT,
    PRIMARY KEY (job_id, basic_ability_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (basic_ability_id) REFERENCES basic_abilities(id) ON DELETE CASCADE
);

-- 12️⃣ 关系表：Jobs - Tools
CREATE TABLE jobs_tools (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (affiliate_id) REFERENCES affiliates(id) ON DELETE CASCADE
);

-- 13️⃣ 关系表：Jobs - Career Paths
CREATE TABLE jobs_career_paths (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (affiliate_id) REFERENCES affiliates(id) ON DELETE CASCADE
);

-- 14️⃣ 关系表：Jobs - Recommended Qualifications
CREATE TABLE jobs_rec_qualifications (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (affiliate_id) REFERENCES affiliates(id) ON DELETE CASCADE
);

-- 15️⃣ 关系表：Jobs - Required Qualifications
CREATE TABLE jobs_req_qualifications (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id),
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    FOREIGN KEY (affiliate_id) REFERENCES affiliates(id) ON DELETE CASCADE
);
