# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| nickname     | string     | null: false                    |
| encrypted    | text       | null: false                    |
| email        | text       | null: false, uniqueness: true  |
| first_name   | text       | null: false                    |
| family_name  | text       | null: false                    |
| birthday     | text       | null: false                    |


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| explain      | text       | null: false                    |
| category     | text       | null: false                    |
| detail       | text       | null: false                    |
| profit       | text       | null: false                    |
| commission   | text       | null: false                    |
| price        | text       | null: false                    |
| user         | references | null: false, foreign_key: true |


## shippings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| code         | string     | null: false                    |
| prefecture   | string     | null: false                    |
| towns        | string     | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: true                     |
| telephone    | string     | null: false, uniqueness: true  |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| shipping     | references | null: false, foreign_key: true |