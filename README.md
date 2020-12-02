# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| first_name         | string   | null: false | #名
| last_name          | string   | null: false | #苗字
| first_kana         | string   | null: false | #名のカナ
| last_kana          | string   | null: false | #苗字のカナ
| birthday           | date     | null: false | #誕生日
| email              | string   | null: false | #メールアドレス
| password           | string   | null: false | #パスワード
| encrypted_password | string   | null: false | #パスワード確認


### Association

- has_many :items
- has_many :record

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name_id             | integer | null: false | #商品名
| explanation         | text    | null: false | #商品の説明
| category_id         | integer | null: false | #商品カテゴリー
| condition_id        | integer | null: false | #商品の状態
| shipping_charges_id | integer | null: false | #配送料の負担
| days_to_ship        | date    | null: false | #発送までの日数
| price               | integer | null: false | #価格
| shipping_area_id    | integer | null: false | #発送元の地域

### Association

- belongs_to :users
- has_one :record

## records テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buyer          | references | null: false, foreign_key: true | #購入者
| purchase_date  | integer    | null: false                    | #購入日
| purchased_item | references | null: false, foreign_key: true | #購入したもの

### Association

- belongs_to :users
- has_one :address
- has_one :items

## addresses テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code_id   | integer | null: false | #郵便番号
| phone_number_id  | integer | null: false | #電話番号
| prefectures_id   | integer | null: false | #都道府県
| municipality_id  | integer | null: false | #市区町村
| address_id       | integer | null: false | #番地
| building_name_id | integer | null: false | #建物名

### Association

- has_one :record