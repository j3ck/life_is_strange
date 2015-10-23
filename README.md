# Life is Strange
## Портал сообщества начинающих трансгуманистов, имморталистов и прочих сингуляров

[![Code Climate](https://codeclimate.com/github/life-is-strange/life_is_strange/badges/gpa.svg)](https://codeclimate.com/github/life-is-strange/life_is_strange)
[![Test Coverage](https://codeclimate.com/github/life-is-strange/life_is_strange/badges/coverage.svg)](https://codeclimate.com/github/life-is-strange/life_is_strange/coverage)

![Life Is Strange, сообщество трансгуманистов](https://raw.githubusercontent.com/riley-usagi/life_is_strange/master/docs/readme_promo_1.png)

---

### [Открытые задачи](https://github.com/riley-usagi/life_is_strange/issues)

---

### Участие в проекте

На данный момент проект находится на самой начальной стадии разработки, а по сему в его разработке могут учавствовать программисты начального уровня, желающие внести вклад в проект с открытым исходным кодом.

### Инструментарий

##### Регистрация и авторизация

Авторизация в приложении происходит исключительно через [Slack](https://slack.com/)

Для того чтобы авторизоваться через **Slack** (во время локальной разработки) вам понадобится собственное [**Slack-приложение**](https://api.slack.com/applications), в настройках которого вы найдёте параметры `SLACK_CLIENT_ID`, `SLACK_CLIENT_SECRET` и `SLACK_REDIRECT_URI`

Их необходимо вставить в новый файл **.env** (в корне приложения) в следующем формате:

```
SLACK_CLIENT_ID=2345324553.5489484567547 # Данные для примера.
SLACK_CLIENT_SECRET=JnpujnKJUNPunhjbbyYYvYVFGOTFjYFUTY # Нужно подставлять данные из своего приложения.
SLACK_REDIRECT_URI=http://lvh.me:8080/oauth/request_access_token (этот параметр изменять не нужно)
```
Это позволит приложению авторизовать вас через инициализатор -  [slack.rb](https://github.com/riley-usagi/life_is_strange/blob/master/config/initializers/slack.rb)

##### Работа с поддоменами

Приложение активно использует поддомены в схеме своей работы.
Для того чтобы без проблем вести разработку проекта вам стоит воспользоваться сервисом [http://lvh.me](http://lvh.me)

Для примера:

Вместо:

```
localhost:8080 # для Unicorn
localhost:3000 # для Puma и т.д.
```

вы используете адрес


```
lvh.me:8080 # для Unicorn
lvh.me:3000 # для Puma и т.д.
```
