---
## Front matter
title: "Отчёт по лабораторной работе № 4"
subtitle: "дисциплина: Архитектура компьютера. Создание и процесс обработки программ на языке ассемблера NASM"
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

Целью работы является освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM.

# Теоритическое введение

NASM успешно конкурирует со стандартным в Linux- и многих других UNIX-системах ассемблером gas. Считается, что качество документации у NASM выше, чем у gas. Кроме того, ассемблер gas по умолчанию использует AT&T-синтаксис, ориентированный на процессоры не от Intel, в то время как NASM использует вариант традиционного для x86-ассемблеров Intel-синтаксиса; Intel-синтаксис используется всеми ассемблерами для DOS/Windows, например, MASM, TASM, fasm.

NASM компилирует программы под различные операционные системы в пределах x86-совместимых процессоров. Находясь в одной операционной системе, можно беспрепятственно откомпилировать исполняемый файл для другой. В общем встроенные средства NASM позволяет компилировать не только программы, но и файлы с любым содержимым. Также мощный макро-препроцессор значительно расширяет возможности для программирования.

Компиляция программ в NASM состоит из двух этапов. Первый — ассемблирование, второй — компоновка. На этапе ассемблирования создаётся объектный код. В нём содержится машинный код программы и данные, в соответствии с исходным кодом, но идентификаторы (переменные, символы) пока не привязаны к адресам памяти. На этапе компоновки из одного или нескольких объектных модулей создаётся исполняемый файл (программа). Операция компоновки связывает идентификаторы, определённые в основной программе, с идентификаторами, определёнными в остальных модулях, после чего всем идентификаторам даются окончательные адреса памяти или обеспечивается их динамическое выделение.

Для компоновки объектных файлов в исполняемые в Windows можно использовать свободный бесплатно распространяемый компоновщик alink(для 64-битных программ компоновщик GoLink), а в Linux — компоновщик ld, который есть в любой версии этой операционной системы.

# Выполнение лабораторной работы

## Программа Hello world!
Рассмотрим пример простой программы на языке ассемблера NASM. Традиционно первая программа выводит приветственное сообщение "Hello world!" на экран.
Создадим каталог для работы с программами на языке ассемблера NASM(рис. [-@fig:001]):

![Создание каталога](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/1.png){#fig:001 width=90%}

Перейдем в созданный каталог(рис. [-@fig:002]):

![Каталог](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/2.png){#fig:002 width=90%}

Создадим текстовый файл с именем hello.asm(рис. [-@fig:003]):

![Файл hello.asm](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/3.png){#fig:003 width=90%}

Откроем этот файл с помощью текстового редактора gedit(рис. [-@fig:004]):

![Открытие файла с помощью gedit](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/4.png){#fig:004 width=90%}

и введем в него следующий текст(рис. [-@fig:005]):

![Текст, выполняющий команду Hello world!](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/5.png){#fig:005 width=90%}

В отличие от многих современных и высокоуровневых языков программирования, в ассемблерной программе каждая команда распологается на *отдельной строке*. Размещение нескольких команд на одной строке **недопустимо**. Синтаксис ассемблера NASM является *чувствительным к регистру*, т.е. есть разница между большими и малыми буквами.

## Транслятор NASM

NASM превращает текст программы в объектный код. Для компиляции приведенного выше текста программы "Hello World" необходимо написать(рис. [-@fig:006]):

![Компиляция программы Hello world](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/6.png){#fig:006 width=90%}

Если текст программы набран без ошибок, то транслятор преобразует текст программы из файла hello.asm в объектный код, который запишется в файл hello.o.
С помощью команды ls проверим, что объектный файл был создан(рис. [-@fig:007]):

![Проверка объектного файла](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/7.png){#fig:007 width=90%}

## Расширенный синтаксис командной строки NASM

Выполним следующую команду(рис. [-@fig:008]), которая скомпилирует исходный файл hello.asm в obj.o(опция -o),кроме того, будет создан файл листинга list.lst(опция -l):

![Компиляция файла obj.o](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/8.png){#fig:008 width=90%}

С помощью команды ls проверим, что файлы были созданы(рис. [-@fig:009]):

![Проверка созданных файлов](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/9.png){#fig:009 width=90%}

##  Компоновщик LD

Чтобы получить исполняемую программу, объектный файл необходимо передать на обработку компоновщику(рис. [-@fig:010]).Ключ -o с последующим значением задает имя создаваемого файла.

![Обработка программы компоновщиком](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/10.png){#fig:010 width=90%}

С помощью команды ls проверим, что исполняемый файл hello был создан(рис. [-@fig:011]):

![Проверка исполняемого файла](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/11.png){#fig:011 width=90%}

Введем следующую команду(рис. [-@fig:012]). Исполняемый файл будет иметь имя main, потому что после ключа -o было задано значение main. Объектный файл, из которого собран исполняемый файл, будет называться obj.o.

![Обработка компановщиком](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/12.png){#fig:012 width=90%}

Проверяем созданные файлы(рис. [-@fig:013]):

![Проверяем наличие файлов](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/13.png){#fig:013 width=90%}

## Запуск исполняемого файла

Запустим на выполнение созданный исполняемый файл, находящийся в текущем каталоге, набрав в командной строке следующую команду(рис. [-@fig:014]):

![Выполнение программы Hello world!](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/14.png){#fig:014 width=90%}

# Задания для самостоятельной работы

1. В каталоге ~/work/arch-pc/lab04 с помощью команды cp создадим копию файла hello.asm с именем lab4.asm(рис. [-@fig:015]):

![Выполнение программы Hello world!](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/15.png){#fig:015 width=90%}

2. С помощью текстового редактора gedit внесем изменения в текст программы в файле lab4.asm так, чтобы вместо Hello world! на экран выводилась строка с нашим фамилией и именем(рис. [-@fig:016]):

![Программа, выводящаю имя и фамилию](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/16.png){#fig:016 width=90%}

3. Оттранслируем полученный текст программы lab4.asm в объектный файл(рис. [-@fig:017]):

![Оттрансляция lab4.asm в объектный файл](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/17.png){#fig:017 width=90%}

Выполним компоновку объектного файла(рис. [-@fig:018]):

![Компоновка объектного файла](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/18.png){#fig:018 width=90%}

Запустим получившийся исполняемый файл(рис. [-@fig:019]):

![Выполнение программы, выводящая имя и фамилию](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/19.png){#fig:019 width=90%}

4. Скопируем файлы hello.asm lab4.asm в наш локальный репозиторий в каталог ~/work/study/2024-2025/"Архитектура компьютера"/arch-pc/labs/lab04(рис. [-@fig:020]):

![Копируем файлы](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/20.png){#fig:020 width=110%}

Проверим, что файлы скопировались(рис. [-@fig:021]):

![Проверка файлов](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/21.png){#fig:021 width=110%}

Загрузим файлы на Github(рис. [-@fig:022]):

![Загрузка файлов на Github](/home/kesvyatashova/work/study/2024-2025/Архитектура компьютера/arch-pc/labs/lab04/report/image/22.png){#fig:022 width=110%}

# Вывод

В результате выполнения работы я освоила процедуру компиляции и сборки программ, написанных на ассемблере NASM.

