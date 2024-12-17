﻿#language: ru



Функционал: Проверка создания клиента

Как Оператор я хочу
создать клиента 
чтобы вести клиентскую базу    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка создания клиента

* Открытие формы
	И В командном интерфейсе я выбираю "Продажи" "Контрагенты"
	Тогда открылось окно "Контрагенты"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Заполнение наименования
	Когда открылось окно "Контрагент (создание)"
	И в поле с именем 'Наименование' я ввожу текст "Тестовый клиент"

	И я нажимаю кнопку выбора у поля с именем 'Родитель'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я разворачиваю строку:
		| "Наименование" |
		| "Покупатели"   |
	И в таблице 'Список' я разворачиваю строку:
		| "Наименование" |
		| "Поставщики"   |
	И в таблице 'Список' я перехожу к строке:
		| "Наименование" |
		| "Поставщики"   |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Контрагент (создание) *"
* Заполнение ВидЦены
	И из выпадающего списка с именем 'ВидЦен' я выбираю точное значение "Закупочная"
* Заполнение Регион
	И я нажимаю кнопку выбора у поля с именем 'Регион'
	Тогда открылось окно "Регионы РФ"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000001" | "Москва"       |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Контрагент (создание) *"
	И в поле с именем 'Страна' я ввожу текст "Россия"
* Заполнение телефона 
	И в поле с именем 'Телефон' я ввожу текст "8999968682"
* Записали
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* ПроверкаКода
	И я запоминаю значение поля "Код" как "Код"
* Провели
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Контрагент (создание) *" в течение 20 секунд
* Проверка создания
// Обязательно проверяем заполнение
		И таблица "Список" содержит строки :
		| 'Код'   |
		| '$Код$' |
* Закрыли		
И я закрываю все окна клиентского приложения