# Tasks on Rails

<https://github.com/everyleaf/el-training/blob/master/docs/el-training.md>

## DB スキーマ

Users

| カラム名        | データ型 |
| --------------- | -------- |
| id              | int      |
| username        | varchar  |
| password_digest | varchar  |

Tasks

| カラム名    | データ型 |
| ----------- | -------- |
| id          | int      |
| user_id     | int      |
| name        | varchar  |
| description | text     |
| deadline    | datetime |
| priority    | int      |
| status      | int      |

Tags

| カラム名 | データ型 |
| -------- | -------- |
| id       | int      |
| name     | varchar  |

UserTags

| カラム名 | データ型 |
| -------- | -------- |
| user_id  | int      |
| tag_id   | int      |

TaskTags

| カラム名 | データ型 |
| -------- | -------- |
| task_id  | int      |
| tag_id   | int      |
