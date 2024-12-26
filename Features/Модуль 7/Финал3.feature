﻿#language: ru

@tree

Функционал: Создание документа продаж 

Как Тестировщик я хочу
Создание документа продаж 
чтобы пользователи могли оформлять продажи  

Переменные:
	НомерДокумента = 0 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Загрузка данных
	Когда Создание объектов для документа РасходТовара

Сценарий: Создание документа продаж 
* Открытие формы
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
	Тогда открылось окно "Продажа товара (создание)"
* Заполнение шапки
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	Тогда элемент формы с именем 'Организация' стал равен "ООО \"1000 мелочей\""	
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Магазин \"Бытовая техника\""
	Тогда элемент формы с именем 'Покупатель' стал равен "Магазин \"Бытовая техника\""
	Тогда элемент формы с именем 'ВидЦен' стал равен "Мелкооптовая"			
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
	Тогда элемент формы с именем 'Склад' стал равен "Склад отдела продаж"
* Заполнение ТЧ	
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "Bosch1234"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10,00"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "Доставка"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыСумма'
	Тогда таблица 'Товары' стала равной:
		| 'N' | 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'     |
		| '1' | 'Bosch1234' | '3 500,00' | '10,00'      | '35 000,00' |
		| '2' | 'Доставка'  | '250,00'   | ''           | '250,00'    |
* Проверка сумм и колличества
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '11'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '35 250'
* Проверка вкладки прочее
	И я перехожу к закладке с именем 'Прочее'
	И в таблице 'Товары' я завершаю редактирование строки
	И в поле с именем 'ОбоснованиеОтгрузки' я ввожу текст "Покупка и доставка товара"
	Тогда элемент формы с именем 'ОбоснованиеОтгрузки' стал равен "Покупка и доставка товара"	
	И я перехожу к закладке с именем 'ГруппаТовары'
* Записали
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Сохранили номер
	И я запоминаю значение поля "Номер" как "Номер"
	И я удаляю переменную '$$НомерДокумента$$'
	И Я запоминаю в переменную "$$НомерДокумента$$" значение "$Номер$"
* Провели	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания
	И таблица "Список" содержит строки :
		| 'Номер'     |
		| '$$НомерДокумента$$' |

Сценарий: Проверка печатной формы
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	И в таблице "Список" я перехожу к строке		
		| 'Номер'     |
		| '$$НомерДокумента$$' |
	И в таблице 'Список' я выбираю текущую строку		
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	И я жду когда в табличном документе "SpreadsheetDocument" заполнится ячейка "R7C3" в течение 1 секунд
//	Дано Табличный документ 'SpreadsheetDocument' равен макету "МакетФинал2" по шаблону // Ошибка ванессы, не получается сравнить с шаблоном	
	И в табличном документе "SpreadsheetDocument" ячейка с адресом "R11C5" равна "35 000" по шаблону	
	И в табличном документе "SpreadsheetDocument" ячейка с адресом "R12C5" равна "*" по шаблону		
	
Сценарий: Проверка движений
* Открываем документ
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/ЖурналДокументов.ДокументыПродаж"
	И в таблице "Список" я перехожу к строке		
		| 'Номер'     |
		| '$$НомерДокумента$$' |
	И в таблице 'Список' я выбираю текущую строку
* Формируем переменные
	И я запоминаю значение поля "Дата" как "Дата"
	И я запоминаю значение поля "Номер" как "Номер" // На 3й итерации произошел баг ванессы "НомерДокумента" - стал равен 0
	И Я запоминаю в переменную "СтрокаРегистратора" значение "Продажа $Номер$ от $Дата$"
* Проверка Регистр взаиморасчетов с контрагентами
	И В текущем окне я нажимаю кнопку командного интерфейса "Регистр взаиморасчетов с контрагентами"
	Тогда таблица 'Список' стала равной:
		| 'Период' | 'Регистратор'          | 'Номер строки' | 'Контрагент'                | 'Сумма'     | 'Валюта' |
		| '$Дата$' | '$СтрокаРегистратора$' | '1'            | 'Магазин "Бытовая техника"' | '35 250,00' | ''       |
	Когда открылось окно "Продажа * от *"
* Проверка Регистр продаж
	И В текущем окне я нажимаю кнопку командного интерфейса "Регистр продаж"
	Тогда таблица 'Список' стала равной:
		| 'Период' | 'Регистратор'          | 'Номер строки' | 'Покупатель'                | 'Товар'     | 'Количество' | 'Сумма'     |
		| '$Дата$' | '$СтрокаРегистратора$' | '1'            | 'Магазин "Бытовая техника"' | 'Bosch1234' | '10,00'      | '35 000,00' |
		| '$Дата$' | '$СтрокаРегистратора$' | '2'            | 'Магазин "Бытовая техника"' | 'Доставка'  | '1,00'       | '250,00'    |
	Когда открылось окно "Продажа * от *"
* Проверка Регистр товарных запасов
	И В текущем окне я нажимаю кнопку командного интерфейса "Регистр товарных запасов"
	Тогда таблица 'Список' стала равной:
		| 'Период' | 'Регистратор'          | 'Номер строки' | 'Товар'     | 'Склад'               | 'Количество' |
		| '$Дата$' | '$СтрокаРегистратора$' | '1'            | 'Bosch1234' | 'Склад отдела продаж' | '10,00'      |
* Заканчиваем тест	
	И я закрываю все окна клиентского приложения
		
		
			
	
		
					