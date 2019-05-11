# Tasks on Rails

<https://github.com/everyleaf/el-training/blob/master/docs/el-training.md>

## DB スキーマ

users

| カラム名          | データ型   |
| --------------- | -------- |
| id              | int      |
| username        | varchar  |
| password_digest | varchar  |

tasks

| カラム名      | データ型     |
| ----------- | ---------- |
| id          | int        |
| user_id     | int        |
| name        | varchar    |
| description | text       |
| deadline    | date       |
| priority    | int (enum) |
| status      | int (enum) |

tags

| カラム名   | データ型   |
| -------- | -------- |
| id       | int      |
| name     | varchar  |

tags_users

| カラム名   | データ型   |
| -------- | -------- |
| user_id  | int      |
| tag_id   | int      |

tags_tasks

| カラム名   | データ型   |
| -------- | -------- |
| task_id  | int      |
| tag_id   | int      |
