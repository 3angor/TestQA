﻿#language: ru



Функционал: создание документа Заказы

Как Менеджер по закупкам я хочу
создать Заказы 
чтобы купить товар    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создаем Заказы

* Заполнение констант в БД
	И Подготовка данных заказа
	
	// Создание документа
* Открытие формы
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Когда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Магазин \"Бытовая техника\""
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	// Обязательно проверяем заполнение
	Тогда элемент формы с именем 'Склад' стал равен "Малый"
	И из выпадающего списка с именем 'ВидЦен' я выбираю точное значение "Оптовая"
	И я меняю значение переключателя с именем 'СостояниеЗаказа' на "В работе"
* Заполнение ТЧ
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "2"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10,00"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Доставка"		
	И в таблице 'Товары' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка заполнения ТЧ
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'     |
		| 'Bosch1234' | '3 000,00' | '10'         | '30 000,00' |
		| 'Доставка'  | '200,00'   | '1'           | '200,00'    |
* Проверка сумм и колличества
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '11'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '30 200'
* Записали
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Номер
	И я запоминаю значение поля "Номер" как "Номер"
* Провели
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания
// Обязательно проверяем заполнение
	И таблица "Список" содержит строки :
		| 'Номер'   |
		| '$Номер$' |