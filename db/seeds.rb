Forum.destroy_all
Theme.destroy_all
Message.destroy_all
User.destroy_all

User.create(name: 'system', photo_url: '/umages/system.jpeg')

Forum.create(
  [
    {name: 'Новый мир', desc: 'default', category_name: 'society', icon: 'si si-check'},
    {name: 'Наука', desc: 'default', category_name: 'society', icon: 'si si-chemistry'},
    {name: 'Экономика', desc: 'default', category_name: 'society', icon: 'si si-bar-chart'},
    {name: 'Политика', desc: 'default', category_name: 'society', icon: 'si si-globe'},
    {name: 'Психология', desc: 'default', category_name: 'society', icon: 'si si-moustache'},
    {name: 'Образование', desc: 'default', category_name: 'society', icon: 'si si-graduation'},
    {name: 'Правила', desc: 'default', category_name: 'society', icon: 'si si-book-open'},
    {name: 'Здоровье нации', desc: 'default', category_name: 'society', icon: 'si si-heart'}
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
