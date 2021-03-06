Feature: Авторизация
Scenario: Пользователь пытается авторизоваться используя неверные логин и пароль
    Given Счетчик попыток входа показывает 3
    When Пользователь 'RandomName' авторизуется в системе с паролем 'wrongPassword'
    Then Счетчик попыток входа должен показывать 2
    And Появилось сообщение 'Неверное имя пользователя или пароль.'

Scenario: Пользователь пытается авторизоваться используя неверные логин и пароль три раза подряд
    Given Счетчик попыток входа показывает 3
    When Пользователь 'RandomName' авторизуется в системе с паролем 'wrongPassword'
    And Пользователь 'RandomName' авторизуется в системе с паролем 'wrongPassword'
    And Пользователь 'RandomName' авторизуется в системе с паролем 'wrongPassword'
    Then Счетчик попыток входа должен показывать 0
    And Появилось сообщение 'Больше войти нельзя'
    And Кнопка входа стала неактивной

Scenario: Пользователь авторизуется с валидными именем и паролем
    Given Счетчик попыток входа показывает 3
    When Пользователь 'admin' авторизуется в системе с паролем 'admin'
    Then Появилось сообщение 'Hello Habrahabr!'

Scenario: Пользователь авторизуется после двух неудачных попыток, а потом возвращается на экран авторизации с помощью кнопки 'Назад'
    Given Счетчик попыток входа показывает 3
    And Пользователь 'RandomName' авторизуется в системе с паролем 'wrongPassword'
    And Пользователь 'RandomName' авторизуется в системе с паролем 'wrongPassword'
    And Пользователь 'admin' авторизуется в системе с паролем 'admin'
    When Пользователь нажимает кнопку назад
    Then Счетчик попыток входа должен показывать 3
    Then Присутствует сообщение 'Введите имя пользователя и пароль'

