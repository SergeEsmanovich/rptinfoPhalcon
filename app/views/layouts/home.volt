<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        {{ get_title() }}
        {{ javascript_include('js/jquery.min.js') }}

        {{ javascript_include('templates/home/js/select2.min.js') }}
        {#{ javascript_include('templates/home/js/responsive.js') }#}
        {{ javascript_include('templates/home/js/navigation.js') }}
        {{ javascript_include('templates/home/js/slider.js') }}
        {#Бутстрап 3#}
        {{ javascript_include('bootstrap/js/bootstrap.min.new.js') }}
        {{ stylesheet_link('bootstrap/css/bootstrap.min.css') }}
        {{ stylesheet_link('css/font-awesome.min.css') }}
        {{ stylesheet_link('templates/home/css/style.css') }}

        {#Грузим лесс#}
        {{ stylesheet_link(["href": "templates/home/less/styles.less", "type": "text/css", "rel": "stylesheet/less"]) }}
        {{ javascript_include('js/less-1.7.5.min.js') }}
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="description" content="Тренинги RPT"/>
        <meta name="author" content="korolariya"/>
         <link href='http://fonts.googleapis.com/css?family=Roboto&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
    </head>
    <body class="mainpage"  data-template="home">
        <nav class="sidebar">

            <ul class="logout">
                <li>
                    <a href="">Выйти из профиля</a>
                </li>
            </ul>
        </nav>
        <nav class="mainmenu-container hide">
            <div class="handler" data-action="toggleClass" data-var="active" data-target=".mainmenu-container"></div>
            <div class="mainmenu-wrapper">

            </div>
        </nav>

        <section class="login-form-container" style="z-index:2">
            <div class="login-form">
                <form action="" method="post" name="login" id="form-login">
                    <fieldset class="input">
                        <p id="form-login-username">
                            <input id="modlgn_username" type="text" name="username" placeholder="Имя пользователя">
                        </p>
                        <p id="form-login-password">
                            <input id="modlgn_passwd" type="password" name="password" placeholder="Пароль">
                    </fieldset>
                    <input type="submit" name="Submit" class="button" value="Войти">
                    <ul>
                        <li>
                            <a href="">Зарегистрироваться</a>
                        </li>  
                        <li>
                            <a href="">
                                Забыли пароль?</a>
                        </li>
                    </ul>      

                </form>
            </div>
        </section>
        <div id="header">
            {% if 1 == 2 %}
            <a class="fa fa-home pull-left btn_header border_right" href=""></a>

            {% else %}


            <div class="fa fa-bars pull-left btn_header border_right handler" data-action="toggleClass" data-var="active" data-target="nav.sidebar"></div>
            {% endif %}

            <div class="logo"><a href=""><img src="/templates/home/img/logo.png" alt=""></a></div>
        </div>
        <div class="clear"></div>
        <div class="messages-template">
            {{ content() }}
        </div><!-- .wrapper -->
        <footer class="footer">
            <div>
                <section class="footermenu">
                    <div class="handler" data-action="toggleClass" data-var="active" data-target=".footermenu"></div>
                    <div class="contacts-info">
                        <h3>Информация о компании</h3>
                        <div class="left">
                            <table>
                                <tr>
                                    <td class="key">Наименовение</td>
                                    <td class="value">Общество с ограниченной ответственностью "РПТ ИНФО"</td>
                                </tr>
                                <tr>
                                    <td class="key">ИНН</td>
                                    <td class="value">7734727667</td>
                                </tr>
                                <tr>
                                    <td class="key">КПП</td>
                                    <td class="value">773401001</td>
                                </tr>
                                <tr>
                                    <td class="key">Телефон</td>
                                    <td class="value">+7 (915) 330 00 02</td>
                                </tr>
                                <tr>
                                    <td class="key">E-mail</td>
                                    <td class="value"><a href="info@rptglobal.com">info@rptglobal.com</a></td>
                                </tr>

                            </table>

                        </div>
                        <div class="right">
                            <table>
                                <tr>
                                    <td class="key">Юридический адрес</td>
                                    <td class="value">123592, Москва, Строгинский б-р,<br />дом № 4, корпус 2, кв.327</td>
                                </tr>
                                <tr>
                                    <td class="key">Фактический адрес</td>
                                    <td class="value">123592, Москва, Строгинский б-р,<br />дом № 4, корпус 2, кв.327</td>
                                </tr>
                                <tr>
                                    <td class="key">Служба поддержки<br />10:00 - 24:00 мск</td>
                                    <td class="value">
                                        8 (800) 333 52 61<br />
                                        (бесплатный звонок по России)<br />
                                        +7 (499) 647 48 51<br />
                                        (для звонков по Москве)
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </div>


                    <div style="clear:both"></div>
                </section>
                <div style="clear:both"></div>
            </div>
            <section class="copyright">
                <div class="custom">
                    <p>
                        © ООО "РПТ ИНФО", 2014. Все права защищены.</p>
                </div>
                <div class="social">
                    <a href="https://vk.com/rptinfo" target="_blank" id="vk"><i class="fa fa-vk"></i></a>
                    <a href="https://www.facebook.com/RPTdowlatow?fref=photo" target="_blank" id="fb"><i class="fa fa-facebook"></i></a>
                    <!-- <a href="http://twitter.com" target="_blank"><i class="fa fa-twitter"></i></a>
                    <a href="http://plus.google.com" target="_blank"><i class="fa fa-google-plus"></i></a> -->
                </div>
            </section>
        </footer><!-- .footer -->
    </body>
</html>