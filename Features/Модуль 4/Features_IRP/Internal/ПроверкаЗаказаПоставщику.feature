﻿#language: ru

@tree
@SmokeTest
@ExportScenarios

Функционал: заказ поставщику

Как Менеджер по закупкам я хочу
зафиксировать заказанный товар 
чтобы проанализировать разницу между тем что было и что фактически доставлено   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0401 подготовка данных 
	Когда экспорт основных данных 2.0

Сценарий: _0401 запись цены
* Заполнение документа
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
	Когда открылось окно "Заказы поставщикам"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Заказ поставщику (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	Тогда открылось окно "Партнеры"
	И в таблице 'List' я перехожу к строке:
		| "Наименование"               |
		| "Поставщик 1 (1 соглашение)" |
	И в таблице 'List' я выбираю текущую строку
	И в таблице 'ItemList' я активизирую поле с именем 'ItemListLineNumber'
	И в таблице 'ItemList' я нажимаю на кнопку с именем 'ItemListAdd'
	И в таблице 'ItemList' я активизирую поле с именем 'ItemListItem'
	И в таблице 'ItemList' я нажимаю кнопку выбора у реквизита с именем 'ItemListItem'
	Тогда открылось окно "Номенклатура"
	И в таблице 'List' я перехожу к строке:
		| "Наименование"            |
		| "Товар без характеристик" |
	И в таблице 'List' я активизирую поле с именем 'Description'
	И в таблице 'List' я выбираю текущую строку
* Проверка цены соглашения
	Тогда таблица 'ItemList' стала равной:
		| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          | 'Цена'   |
		| 'Товар без характеристик' | 'Товар без характеристик' | 'Цена поставщика 1' | '150,00' |
* Изменение и проверка выбора цены
	И в таблице 'ItemList' я выбираю текущую строку
	И в таблице 'ItemList' в поле с именем 'ItemListPriceType' я ввожу текст ""
	И в таблице 'ItemList' я завершаю редактирование строки
	// Для проверки строк если они перемешаны
	Тогда таблица 'ItemList' содержит строки:
		| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          | 'Цена'   |
		| 'Товар без характеристик' | 'Товар без характеристик' | '' 				  | '' |
* Заполнение соглашения
	И я нажимаю кнопку выбора у поля с именем 'Agreement'
	Тогда открылось окно "Соглашения"
	И в таблице 'List' я перехожу к строке:
		| "Наименование"            |
		| "Соглашение с поставщиком 1" |
	И в таблице 'List' я активизирую поле с именем 'Description'
	И в таблице 'List' я выбираю текущую строку	
	Тогда открылось окно "Табличная часть товаров будет обновлена"
	И я нажимаю на кнопку с именем 'FormOK'
* Проверка цены соглашения
	Тогда таблица 'ItemList' стала равной:
		| 'Номенклатура'            | 'Характеристика'          | 'Вид цены'          | 'Цена'   |
		| 'Товар без характеристик' | 'Товар без характеристик' | 'Цена поставщика 1' | '150,00' |		
	И я закрыл все окна клиентского приложения	

Сценарий: тест
* Заполнение документа
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseOrder"
	Когда открылось окно "Заказы поставщикам"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Заказ поставщику (создание)"
	И я нажимаю кнопку выбора у поля с именем 'Partner'
	Тогда открылось окно "Партнеры"
	И в таблице 'List' я перехожу к строке:
		| "Наименование"               |
		| "Поставщик 1 (1 соглашение)" |
	И в таблице 'List' я выбираю текущую строку
	И в таблице 'ItemList' я активизирую поле с именем 'ItemListLineNumber'
	И в таблице 'ItemList' я нажимаю на кнопку с именем 'ItemListAdd'
	И я нажимаю сочетание клавиш "ENTER"
	И в таблице 'ItemList' из выпадающего списка с именем 'ItemListItem' я выбираю по строке "Товар без характеристик"
	И в таблице 'ItemList' я завершаю редактирование строки
	И в таблице 'ItemList' я выбираю текущую строку
	И в таблице 'ItemList' я завершаю редактирование строки
	И я нажимаю сочетание клавиш "F9"
	И в таблице "ItemList" я перехожу к следующей ячейке
	И в таблице "ItemList" я устанавливаю флаг "Отмена"
	// Для проверки блокировки ячейки
	//	Когда Проверяю шаги на Исключение:
	//			|'И В таблице "ItemList" я нажимаю кнопку выбора у реквизита "Номенклатура"'|
	Тогда в таблице "ItemList" количество строк "равно" 2
	И в таблице "ItemList" текущего окна я устанавливаю сортировку по колонке "ItemListPrice" по возрастанию (расширение)
		
		