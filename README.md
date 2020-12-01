# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| email        | string | null: false |
| password     | string | null: false |
| nickname     | string | null: false |
| introduction | text   | null: false |

### Association

- has_many :videos


## videos テーブル

| Column     | Type       | Options                        |
| ------     | ------     | ------------------------------ |
| title      | string     | null: false                    |
| overview   | text       | null: false                    |
| video      |            | null: false                    | ActiveStorageの実装
| user       | references | null: false, foreign_key: true |


### Association

- belongs_to :user