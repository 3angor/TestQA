﻿#language: ru

@tree
@SmokeTest
@ExportScenarios

Функционал: заказ покупателя (SalesOrder)

Как Менеджер по продажам я хочу
продать выбранный товар 
чтобы оформить продажу товара   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: _0505 Проверка шапки документа SalesOrder 
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	Когда открылось окно "Заказы покупателей"
	И я нажимаю на кнопку с именем 'FormCreate'
	Когда открылось окно "Заказ покупателя (создание)"
	Тогда элемент формы с именем 'Partner' стал равен ""	
	// Для проверки блокировки ячейки
	Когда Проверяю шаги на Исключение:
			|'И из выпадающего списка с именем 'LegalName' я выбираю по строке "Ро"'|
	И из выпадающего списка с именем 'Partner' я выбираю по строке "Розничный покупатель"
	Тогда элемент формы с именем 'Partner' стал равен "Розничный покупатель"
	И из выпадающего списка с именем 'Agreement' я выбираю по строке "Розничное"
	Тогда элемент формы с именем 'Agreement' стал равен "Розничное"	
	// Доплнил условие проверки
	Если элемент формы с именем 'Company' стал равен "" Тогда
		И из выпадающего списка с именем 'Company' я выбираю по строке "Собственная компания 2"
		И в таблице 'ItemList' я активизирую поле с именем 'ItemListLineNumber'
		И в таблице 'SpecialOffers' я активизирую поле с именем 'SpecialOffersLineNumber'
		И в таблице 'PaymentTerms' я активизирую поле с именем 'PaymentTermsLineNumber'
	Тогда элемент формы с именем 'Company' стал равен "Собственная компания 2"



	
	
	