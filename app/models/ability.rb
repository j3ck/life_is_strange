class Ability
  include CanCan::Ability

  def initialize(user)

    # Админ как царь-батюшка. Делает что хочет, идёт куда хочет.
    can :manage, :all if user.role == "admin"

    # Обычный пользователь не имеет возможности создавать форумы (в отличие от тем на форумах)
    # Здесь в последнем параметре мы указываем модель, с которой пользователь не может ничего поделать
    # Кроме как просмотреть (:index, :show)
    if user.role == "user"
      cannot [:create, :update, :destroy], [Forum]
    end

  end
end
