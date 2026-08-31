-- 公式ペアリングテーブル（酒蔵がお酒と料理の相性を登録）
CREATE TABLE pairings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sake_id BIGINT NOT NULL, -- 対象のお酒ID
    dish_id BIGINT NOT NULL, -- 対象の料理ID
    brewery_id BIGINT NOT NULL, -- 登録した酒蔵ユーザーID
    score INT NOT NULL DEFAULT 0, -- 相性スコア（0〜50点）
    comment TEXT, -- 酒蔵からのペアリングおすすめコメント
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_pairings_sake FOREIGN KEY (sake_id) REFERENCES sakes (id),
    CONSTRAINT fk_pairings_dish FOREIGN KEY (dish_id) REFERENCES dishes (id),
    CONSTRAINT fk_pairings_brewery FOREIGN KEY (brewery_id) REFERENCES users (id),
    CONSTRAINT uq_sake_dish UNIQUE (sake_id, dish_id) -- 同じお酒と料理の重複登録を防止
);

-- 一般ユーザーペアリング投票テーブル（1人1回制約）
CREATE TABLE votes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pairing_id BIGINT NOT NULL, -- 投票対象のペアリングID
    user_id BIGINT NOT NULL, -- 投票したユーザーID
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_votes_pairing FOREIGN KEY (pairing_id) REFERENCES pairings (id),
    CONSTRAINT fk_votes_user FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT uq_pairing_user UNIQUE (pairing_id, user_id) -- 1人1回投票の制約
);

-- お気に入りテーブル
CREATE TABLE favorites (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL, -- お気に入り登録したユーザーID
    target_type VARCHAR(20) NOT NULL, -- 'SAKE' または 'DISH'
    target_id BIGINT NOT NULL, -- お気に入り対象のID（sake_id または dish_id）
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_favorites_user FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT uq_user_target UNIQUE (user_id, target_type, target_id) -- 重複登録を防止
);