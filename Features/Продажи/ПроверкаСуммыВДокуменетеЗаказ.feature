﻿#language: ru

@tree

Функционал: Проверка расчета итоговой суммы документа Заказ
Как Менеджер по продажам я хочу
создание документа Заказ 
чтобы проверит расчет итговой суммы 
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка итоговой суммы в документе Заказ
*Открытие формы документа
И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
Тогда открылось окно 'Заказы товаров'
И в таблице "Список" я перехожу к строке:
	| 'Автор'                | 'Валюта взаиморасчетов' | 'Вид цен'      | 'Дата'                | 'Номер'     | 'Организация'        | 'Покупатель'             | 'Склад'   | 'Состояние заказа' |
	| 'Менеджер по продажам' | 'Рубли'                 | 'Мелкооптовая' | '22.06.2020 18:43:25' | '000000012' | 'ООО "Все для дома"' | 'Магазин "Мясная лавка"' | 'Большой' | 'Выполнен'         |
И в таблице "Список" я активизирую поле с именем "Покупатель"
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ * от *'
*Изменяю цену по первому товару 
И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
И в таблице "Товары" я выбираю текущую строку
И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '500,00'
И в таблице "Товары" я завершаю редактирование строки
*Проверяю изменение итоговой суммы
Тогда элемент формы "Сумма (итог)" стал равен "5 550"
*Изменяю количество в товаре Сметана
И в таблице "Товары" я перехожу к строке:
	| 'Количество' | 'Сумма'  | 'Товар'   | 'Цена'  |
	| '11'         | '550,00' | 'Сметана' | '50,00' |
И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
И в таблице "Товары" я выбираю текущую строку
И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '20'
И в таблице "Товары" я завершаю редактирование строки
*Проверяю изменение итоговой суммы
Тогда элемент формы "Сумма (итог)" стал равен "6 000"
*Закрываю форму без сохранения документа
И я закрываю текущее окно
 
