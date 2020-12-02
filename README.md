# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| first_name         | string | null: false | #名
| last_name          | string | null: false | #苗字
| first_kana         | string | null: false | #名のカナ
| last_kana          | string | null: false | #苗字のカナ
| birthday           | date   | null: false | #誕生日
| email              | string | null: false | #メールアドレス
| encrypted_password | string | null: false | #パスワード確認


### Association

- has_many :items
- has_many :records

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    | #商品名
| explanation         | text       | null: false                    | #商品の説明
| category_id         | integer    | null: false                    | #商品カテゴリー
| condition_id        | integer    | null: false                    | #商品の状態
| shipping_charges_id | integer    | null: false                    | #配送料の負担
| days_to_ship_id     | integer    | null: false                    | #発送までの日数
| price               | integer    | null: false                    | #価格
| shipping_area_id    | integer    | null: false                    | #発送元の地域
| user_id             | references | null: false, foreign_key: true | #userの外部キー


### Association

- belongs_to :users
- has_one :records

## records テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true | #購入者
| item_id | references | null: false, foreign_key: true | #購入したもの

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code_id   | integer | null: false | #郵便番号
| phone_number_id  | integer | null: false | #電話番号
| prefectures_id   | string  | null: false | #都道府県
| municipality_id  | string  | null: false | #市区町村
| address_id       | string  | null: false | #番地
| building_name_id | string  | null: false | #建物名

### Association

- belongs_to :records