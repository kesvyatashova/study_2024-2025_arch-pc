---
## Front matter
title: "Отчёт по лабораторной работе № 3"
subtitle: "дисциплина: Архитектура компьютера. Языки разметки Markdown"
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

Целью работы является освоение процедуры оформления отчетов с помощью легковесного языка разметки Markdown.

# Выполнение лабораторной работы

1. Откроем терминал(рис. [-@fig:001]):

![Терминал](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-10 19-11-34.png){#fig:001 width=90%}

2. Перейдем в каталог курса, сформированный при выполнении лабораторной работы № 2(рис. [-@fig:002]):

![Каталог курса](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 18-01-22.png){#fig:002 width=90%}

Обновим локальный репозиторий, скачав изменения из удаленного репозитория с помощью команды(рис. [-@fig:003]):

![Обновление локального репозитория](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 18-02-08.png){#fig:003 width=90%}

3. Перейдем в каталог с шаблоном отчета по лабораторной работе № 3(рис. [-@fig:004]):

![Каталог лаб. работы №3](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 18-04-50.png){#fig:004 width=90%}

4. Проведем компиляцию шаблона с использованием Makefile. Для этого введем команду(рис. [-@fig:005]):

![Компиляция](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 20-12-18.png){#fig:005 width=110%}

При успешной компиляции должны сгенерироваться файлы report.pdf и report.docx. Откроем и проверим корректность полученных файлов(рис. [-@fig:006]):

![Проверка корректности полученных файлов](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 20-13-34.png){#fig:006 width=90%}

5. Удалим полученные файлы с использованием Makefile. Для этого введем команду(рис. [-@fig:007]):

![Удаление файлов](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 20-15-15.png){#fig:007 width=90%}

6. Откроем файл report.md с помощью текстового редактора gedit(рис. [-@fig:008]):

![report.md](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-09 20-15-15.png){#fig:008 width=90%}

Внимательно изучаем структуру файла(рис. [-@fig:009]):

![Структура файла](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-10 21-35-15.png){#fig:009 width=90%}

7. Заполним отчет(рис. [-@fig:010]) и скомпилируем отчет с использованием Makefile(рис. [-@fig:011]):

![Отчет](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-10 21-35-50.png){#fig:010 width=90%}

![Компиляция отчета](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-10 21-36-18.png){#fig:011 width=115%}

Проверим корректность полученных файлов.

8. Загрузим файлы на Github(рис. [-@fig:012] и рис. [-@fig:013]):

![Github 0.1](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-10 22-08-26.png){#fig:012 width=90%}

![Github 0.2](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-10 22-07-53.png){#fig:013 width=90%}

# Задания для самостоятельной работы

1. В соответствующем каталоге сделаем отчет по лабораторной работе №2 в формате Markdown:

![Отчет Лаб. №2](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab03/report/image/Снимок экрана от 2024-10-11 00-11-55.png){#fig:014 width=90%}

2. Загрузим файлы на github

# Вывод

В результате выполнения работы я освоила процедуру оформления отчетов с помощью легковесного языка разметка Markdown.

