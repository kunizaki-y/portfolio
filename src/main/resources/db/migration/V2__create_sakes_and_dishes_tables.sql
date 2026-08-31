-- お酒（銘柄）マスターテーブル
CREATE TABLE sakes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    brewery_id BIGINT NOT NULL, -- 登録した酒蔵ユーザーのID（users.id）
    name VARCHAR(100) NOT NULL, -- お酒の名前・銘柄
    description TEXT, -- お酒の特徴・説明
    type VARCHAR(50), -- 純米大吟醸、特別純米などのお酒の種類
    alcohol_content DECIMAL(4, 1), -- アルコール度数（例: 15.5）
    image_url VARCHAR(255), -- お酒の画像URL
    is_deleted TINYINT(1) NOT NULL DEFAULT 0, -- 論理削除フラグ
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_sakes_brewery FOREIGN KEY (brewery_id) REFERENCES users (id)
);

-- 料理マスターテーブル
CREATE TABLE dishes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL, -- 料理の名前
    category VARCHAR(50), -- 和食、洋食、おつまみなどのカテゴリ
    description TEXT, -- 料理の説明
    image_url VARCHAR(255), -- 料理の画像URL
    is_deleted TINYINT(1) NOT NULL DEFAULT 0, -- 論理削除フラグ
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);