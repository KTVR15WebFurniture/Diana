<%-- 
    Document   : bookkeeper
    Created on : Dec 1, 2016, 12:33:49 PM
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript"></script>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="style.css" rel="stylesheet" type="text/css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>bookkepper</title>
    </head>
    <body>
        <h1>Зарплата</h1>

        <div class="calender">
            <table id="calendar3">
                <thead>
                    <tr><td colspan="4"><select>
                                <option value="0">Январь</option>
                                <option value="1">Февраль</option>
                                <option value="2">Март</option>
                                <option value="3">Апрель</option>
                                <option value="4">Май</option>
                                <option value="5">Июнь</option>
                                <option value="6">Июль</option>
                                <option value="7">Август</option>
                                <option value="8">Сентябрь</option>
                                <option value="9">Октябрь</option>
                                <option value="10">Ноябрь</option>
                                <option value="11">Декабрь</option>
                            </select><td colspan="3"><input type="number" value="" min="0" max="9999" size="4">
                    <tr><td>Пн<td>Вт<td>Ср<td>Чт<td>Пт<td>Сб<td>Вс
                <tbody>
            </table>

            <script>
                function Calendar3(id, year, month) {
                    var Dlast = new Date(year, month + 1, 0).getDate(),
                            D = new Date(year, month, Dlast),
                            DNlast = D.getDay(),
                            DNfirst = new Date(D.getFullYear(), D.getMonth(), 1).getDay(),
                            calendar = '<tr>',
                            m = document.querySelector('#' + id + ' option[value="' + D.getMonth() + '"]'),
                            g = document.querySelector('#' + id + ' input');
                    if (DNfirst !== 0) {
                        for (var i = 1; i < DNfirst; i++)
                            calendar += '<td>';
                    } else {
                        for (var i = 0; i < 6; i++)
                            calendar += '<td>';
                    }
                    for (var i = 1; i <= Dlast; i++) {
                        if (i === new Date().getDate() && D.getFullYear() === new Date().getFullYear() && D.getMonth() === new Date().getMonth()) {
                            calendar += '<td class="today">' + i;
                        } else {
                            if (// список официальных праздников
                                    (i === 1 && D.getMonth() === 0 && ((D.getFullYear() > 1897 && D.getFullYear() < 1930) || D.getFullYear() > 1947)) || // Новый год
                                    (i === 2 && D.getMonth() === 0 && D.getFullYear() > 1992) || // Новый год
                                    ((i === 3 || i === 4 || i === 5 || i === 6 || i === 8) && D.getMonth() === 0 && D.getFullYear() > 2004) || // Новый год
                                    (i === 7 && D.getMonth() === 0 && D.getFullYear() > 1990) || // Рождество Христово
                                    (i === 23 && D.getMonth() === 1 && D.getFullYear() > 2001) || // День защитника Отечества
                                    (i === 8 && D.getMonth() === 2 && D.getFullYear() > 1965) || // Международный женский день
                                    (i === 1 && D.getMonth() === 4 && D.getFullYear() > 1917) || // Праздник Весны и Труда
                                    (i === 9 && D.getMonth() === 4 && D.getFullYear() > 1964) || // День Победы
                                    (i === 12 && D.getMonth() === 5 && D.getFullYear() > 1990) || // День России (декларации о государственном суверенитете Российской Федерации ознаменовала окончательный Распад СССР)
                                    (i === 7 && D.getMonth() === 10 && (D.getFullYear() > 1926 && D.getFullYear() < 2005)) || // Октябрьская революция 1917 года
                                    (i === 8 && D.getMonth() === 10 && (D.getFullYear() > 1926 && D.getFullYear() < 1992)) || // Октябрьская революция 1917 года
                                    (i === 4 && D.getMonth() === 10 && D.getFullYear() > 2004) // День народного единства, который заменил Октябрьскую революцию 1917 года
                                    ) {
                                calendar += '<td class="holiday">' + i;
                            } else {
                                calendar += '<td>' + i;
                            }
                        }
                        if (new Date(D.getFullYear(), D.getMonth(), i).getDay() === 0) {
                            calendar += '<tr>';
                        }
                    }
                    for (var i = DNlast; i < 7; i++)
                        calendar += '<td>&nbsp;';
                    document.querySelector('#' + id + ' tbody').innerHTML = calendar;
                    g.value = D.getFullYear();
                    m.selected = true;
                    if (document.querySelectorAll('#' + id + ' tbody tr').length < 6) {
                        document.querySelector('#' + id + ' tbody').innerHTML += '<tr><td>&nbsp;<td>&nbsp;<td>&nbsp;<td>&nbsp;<td>&nbsp;<td>&nbsp;<td>&nbsp;';
                    }
                    document.querySelector('#' + id + ' option[value="' + new Date().getMonth() + '"]').style.color = 'rgb(220, 0, 0)'; // в выпадающем списке выделен текущий месяц
                }
                Calendar3("calendar3", new Date().getFullYear(), new Date().getMonth());
                document.querySelector('#calendar3').onchange = function Kalendar3() {
                    Calendar3("calendar3", document.querySelector('#calendar3 input').value, parseFloat(document.querySelector('#calendar3 select').options[document.querySelector('#calendar3 select').selectedIndex].value));
                };
            </script>  
        </div>
        <div class="container">
            <div class="date">
                <select class="form-control" id="sel1">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>
                <div class="date">
                <select class="form-control" id="sel1">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>
            <p></p>
            <table class="table">
                <thead>
                    <tr>
                        <th>Имя</th>
                        <th>Фамилия</th>
                        <th>Зарплата</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>----------------------------</td>
                        <td>-------------------------------</td>
                        <td>------------------------------</td>
                    </tr>      
                    <tr class="success">
                        <td>^^^^^^^^^^^^^^^^^^^^^</td>
                        <td>^^^^^^^^^^^^^^^^^^^^^</td>
                        <td>^^^^^^^^^^^^^^^^^^^^^</td>
                    </tr>
                    <tr class="danger">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="info">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="warning">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr class="active">
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
