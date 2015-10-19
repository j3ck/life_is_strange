Forum.destroy_all
Theme.destroy_all
Message.destroy_all
User.destroy_all

User.create(name: 'system', photo_url: '/umages/system.jpeg')

Forum.create(
  [
    {name: 'Новый мир', category_name: 'society'},
    {name: 'Наука', category_name: 'society'},
    {name: 'Экономика', category_name: 'society'},
    {name: 'Политика', category_name: 'society'},
    {name: 'Психология', category_name: 'society'},
    {name: 'Образование', category_name: 'society'},
    {name: 'Правила', category_name: 'society'},
    {name: 'Здоровье нации', category_name: 'society'}
  ]
)

Theme.create(
  [
    {name: 'Книга', forum_id: 1}
  ]
)

Message.create(
  [
    {user_id: 1, content: 'Новая Книга', theme_id: 1}
  ]
)
