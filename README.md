# テーブル設計

## users テーブル

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| first_name | string   | null: false | #名
| last_name  | string   | null: false | #苗字
| first_kana | string   | null: false | #名のカナ
| last_kana  | string   | null: false | #苗字のカナ
| birthday   | date     | null: false | #誕生日
| email      | string   | null: false | #メールアドレス
| password   | string   | null: false | #パスワード

### Association

- has_many :items
- has_many :record

## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false | #商品名
| explanation      | text    | null: false | #商品の説明
| category         | string  | null: false | #商品カテゴリー
| condition        | string  | null: false | #商品の状態
| shipping_charges | integer | null: false | #配送料の負担
| days_to_ship     | date    | null: false | #発送までの日数
| price            | integer | null: false | #価格
| shipping_area    | string  | null: false | #発送元の地域

### Association

- belongs_to :users
- has_one :record

## record テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer            | references | null: false, foreign_key: true | #購入者
| purchase_date    | references | null: false, foreign_key: true | #購入日
| purchased_item   | references | null: false, foreign_key: true | #購入したもの

### Association

- belongs_to :users
- has_one :address
- has_one :items

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false, foreign_key: true | #郵便番号
| phone_number | integer    | null: false, foreign_key: true | #電話番号
| prefectures  | string     | null: false, foreign_key: true | #都道府県
| municipality | string     | null: false, foreign_key: true | #市区町村
| address      | string     | null: false, foreign_key: true | #番地
| credit_card  | integer    | null: false, foreign_key: true | #クレジットカードの情報

### Association

- has_one :record