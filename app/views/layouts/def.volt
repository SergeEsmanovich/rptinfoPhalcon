<!DOCTYPE html>
<html>
    <head>
    {{ javascript_include('js/jquery.min.js') }}
 {{ javascript_include('templates/home/js/navigation.js') }}




 {#Грузим лесс#}
        {{ stylesheet_link(["href": "templates/deftpl/less/styles.less", "type": "text/css", "rel": "stylesheet/less"]) }}
        {{ javascript_include('js/less-1.7.5.min.js') }}

{#Бутстрап 3#}
        {{ javascript_include('templates/deftpl/js/bootstrap.min.js') }}
        {{ stylesheet_link('templates/deftpl/css/bootstrap.css') }}
        {#Шрифты#}
        {{ stylesheet_link('css/font-awesome.min.css') }}
        {#Стили#}
        {{ stylesheet_link('templates/deftpl/css/style.css') }}


      <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
 
    <style>
        IMG.iePNG { filter:expression(fixPNG(this)); position: relative; } 
    </style>
    <link href='http://fonts.googleapis.com/css?family=Roboto&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
</head>

<body data-template="deftpl">
    <nav class="sidebar" id="sidebar" data-hide="false" data-savestate="true">
        <div class="fa fa-angle-left handler" style="position: absolute; top:10px; left:20px; font-size:3.4rem; cursor:pointer;color:#fff" data-action="toggleClass" data-var="active" data-target="nav.sidebar"></div>
        {{elements.getModulMenu('leftmenu')}}
        <ul class="logout">
            <li>
                <a href="">Выйти из профиля</a>
            </li>
        </ul>
    </nav>
    <nav class="mainmenu-container hide">
        <div class="handler" data-action="toggleClass" data-var="active" data-target=".mainmenu-container"></div>
        <div class="mainmenu-wrapper">
            <jdoc:include type="modules" name="head" style="none" />
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
                        <a href="/signup">Зарегистрироваться</a>
                    </li>  
                    <li>
                        <a href="">
                       Забыли пароль?</a>
                    </li>
                </ul>     
               
                 <input type="hidden" name="return" value="" />
              
            </form>
        </div>
    </section>
    <div id="header">
        {% if 1 == 2 %}
                <a class="fa fa-home pull-left btn_header border_right" href="/index.php"></a>

            {% else %}

           
                <div class="fa fa-bars pull-left btn_header border_right handler" data-action="toggleClass" data-var="active" data-target="nav.sidebar"></div>
  {% endif %}
        <jdoc:include type="modules" name="top_user" />
        <div class="logo">
              {{ link_to('index', '<img src="/templates/home/img/logo.png" alt="">') }}
        </div>
    </div>
    <div class="clear"></div>
    <div class="wrapper">
        <div class="content-container">
        

        <div  class="row message-window" style="">    
           
        </div>

        <div class="row" style="height:100%" >

             {{ content() }}
        </div> 

           
        </div>

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
