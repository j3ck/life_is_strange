# Life is Strange
## Портал сообщества начинающих трансгуманистов, имморталистов и прочих сингуляров

![Life Is Strange, сообщество трансгуманистов](https://raw.githubusercontent.com/riley-usagi/life_is_strange/master/docs/readme_promo_1.png)

---

### [Дорожная карта проекта](https://github.com/riley-usagi/life_is_strange/blob/master/docs/roadmap.md)

---

### [Открытые задачи](https://github.com/riley-usagi/life_is_strange/issues)

---

### Участие в проекте

На данный момент проект находится на самой начальной стадии разработки, а по сему в его разработке могут учавствовать программисты начального уровня, желающие внести вклад в проект с открытым исходным кодом.

### Инструментарий

##### Регистрация и авторизация

Авторизация в приложении происходит исключительно через социальные сети. На данный момент на 100% реализована только регистрация/авторизация через **Twitter**

Для того чтобы авторизоваться через **Twitter** вам понадобится собственное [**twitter-приложение**](https://apps.twitter.com), в настройках которого вы найдёте параметры **TWITTER_KEY** и **TWITTER_SECRET**

Их необходимо вставить в новый файл **.env** (в корне приложения) в следующем формате:

```
TWITTER_KEY=svJKNHjknJLNKnj
TWITTER_SECRET=JnpujnKJUNPunhjbbyYYvYVFGOTFjYFUTY
```
Это позволит приложению авторизовать вас через инициализатор -  [omniauth.rb](https://github.com/riley-usagi/life_is_strange/blob/master/config/initializers/omniauth.rb)

##### Работа с поддоменами

Приложение активно использует поддомены в схеме своей работы.
Для того чтобы без проблем вести разработку проекта вам стоит воспользоваться сервисом [http://lvh.me](lvh.me)

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
