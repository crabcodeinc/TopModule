# TopModule
Top MVVM Module for Your iOS project 🔥

## Установка

pod 'TopModule'

содержимое папки Templates перенести в UserTemplates
~/Library/Developer/Xcode/Templates/

## Описание

Архитектурный модуль реализующий шаблон MVVM.
Под капотом реализованно взаимоотношение view с viewModel.
Общение и передача данных между сущностями осуществляется через посыл событий (iSense).
Вам нужно всего лишь описать в классе [имя фичи]Senses список событий, которые может сгенерировать ваше view или viewController.
Так же реализован класс GeneralNavigator, который помогает в навигации по вашим экранам, он работает по тому же принципу, что и view с viewModel.

## Templates

Темплейтс помогут сэкономить дни разработки, добавив архитектурный скилет для фичи, буквально в пару кликов !🤯
Все что вам нужно - нажать в папке фичи cmd + N и опуститься на самый низ списка. Там вы увидите 3 UserTemplates.
Выбирайте нужный и не тратте время на рутину, посвятите себя интересным задачам) 🤩

## Список Temlates:

1) Atom
Он нужен для создания маленького модуля, который можно вставить в контроллер или в вашу дизайн систему.

2) Block
Создает viewController с прокинутыми зависимостями для прикрепления Atom's и с зависимостями на Navigator.
Так же создается фабрика, которая отдает главный viewController. Содержащий в себе все необходимое 

Список созданных файлов :

[feature name]AtomView
[feature name]AtomViewModel
[feature name]AtomSenses

[feature name]BlockViewController
[feature name]BlockViewModel
[feature name]BlockSenses
[feature name]BlockFabric

[feature name]Navigator

3) Navigator
Создает специальный класс для удобной навигации

Более подробное описание со схемами взаимодействиями и примерами находится в проработке.
Так же скоро добавится наглядный и обширный пример для Demo проекта

Coming soon ...
