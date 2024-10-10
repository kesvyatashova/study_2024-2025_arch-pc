---
## Front matter
title: "Отчёт по лабораторной работе № 2"
subtitle: "дисциплина: Архитектура компьютера. Система контроля версий Git"
author: "Студент: Святашова Ксения Евгеньевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
fontsize: 13pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью работы является изучить идеологию и применение средств контроля версий. Приобрести практические навыки по работе с системой git.

# Выполнение лабораторной работы

1. Настройка github

Создаем учетную запись на сайте https://github.com/ и заполняем основные данные

2. Базовая настройка git

Сначала сделаем предварительную конфигурацию git. Откроем терминал и введем следующие команды, указав имя и email владельца репозитория(рис. [-@fig:001]):

![Конфигурация git](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/1.png){#fig:001 width=90%}

Настроим utf-8 в выводе сообщений git(рис. [-@fig:002]):

![Настройка utf-8](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/2.png){#fig:002 width=90%}

Зададим имя начальной ветки(будем называть её мастер)(рис. [-@fig:003]):

![Имя ветки](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/3.png){#fig:003 width=90%}

Параметры autocrlf и safecrlf(рис. [-@fig:004]):

![Параметры](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/4.png){#fig:004 width=90%}

3. Создание SSH ключа

Для последующей индетификации на сервере репозиториев нееобходимо сгенирировать пару ключей(приватный и открытый)(рис. [-@fig:005]):

![Ключи](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/5.png){#fig:005 width=90%}

Ключи сохраняться в каталоге ~/.ssh/
Далее необходимо загрузить сгенерированный открытый ключ. Для этого зайдем на сайт https://github.org/ под своей учётной записью и перейдём в меню Setting. После этого выберем в боковом меню SSH and GPG keys и нажать кнопку New SSH key, скопировав из локальной консоли ключ в буфер обмена(рис. [-@fig:006]):

![Загрузка ключа](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/6.png){#fig:006 width=110%}

Вставляем ключ в появившееся на сайте поле и указываем для ключа имя(рис. [-@fig:007]):

![Имя ключа](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/7.png){#fig:007 width=90%}

4. Создание рабочего пространства и репозитория курса на основе шаблона

При выполнении лабораторных работ следует придерживаться структуры рабочего пространства.
Название проекта на хостинге git имеет вид study_учебный год_arch-pc
Откроем терминал и создадим каталог для предмета "Архитектура компьютера"(рис. [-@fig:008]):

![Каталог Архитектура компьютера](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/8.png){#fig:008 width=90%}

5. Создание репозитория курса на основе шаблона

Репозиторий на основе шаблона можно создать через web-интерфейс github. Перейдем на страницу репозитория с шаблоном курса https://github.com/yamadharma/course-directory-student-template.
Далее выберем Use this template(рис. [-@fig:009]):

![Репозиторий 0.1](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/9.png){#fig:009 width=90%}

В открывшемся окне зададим имя репозитория (Repository name) study_2024-2025_arch-pc и создадим репозиторий (кнопка Create repository)(рис. [-@fig:010]):

![Репозиторий 0.2](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/10.png){#fig:010 width=90%}

Откроем терминал и перейдем в каталог курса(рис. [-@fig:011]):

![Репозиторий 0.3](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/11.png){#fig:011 width=90%}

Клонируем созданный репозиторий(рис. [-@fig:012]):

![Репозиторий 0.4](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/12.png){#fig:012 width=110%}

6. Настройка каталога курса

Перейдем в каталог курса(рис. [-@fig:013]):

![Каталог курса](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/13.png){#fig:013 width=90%}

Удалим лишние файлы(рис. [-@fig:014]):

![Лишние файлы](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/14.png){#fig:014 width=90%}

Создадим необходимые каталоги(рис. [-@fig:015]):

![Необходимые каталоги](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/15.png){#fig:015 width=90%}

Отправим файлы на сервер(рис. [-@fig:016]):

![Отправка файлов на сервер](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/16.png){#fig:016 width=90%}

# Задания для самостоятельной работы

1. Создадим отчет по выполнению лабораторной работы в соответствующей каталоге рабочего пространства(lab>lab02>report):

![Отчет Лаб. №2](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/17.png){#fig:017 width=90%}:

2. Скопируем отчеты по выполнению предыдущих работ в соответсвующие каталоги созданного рабочего пространства:

![Отчет Лаб. №1](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab02/report/image/18.png){#fig:018 width=90%}:

3. Загрузим файлы на github

# Вывод

В результате выполнения работы я изучила идеологию и применение средств контроля версий и приобрела практические навыки по работе с системой git.

