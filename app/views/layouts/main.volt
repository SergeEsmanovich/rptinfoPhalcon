<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">INVO</a>
            {{ elements.getMenu() }}
        </div>
    </div>
</div>

<div class="container">
    {{ flash.output() }}
    {{ content() }}
    <hr>
    {{elements.getMenuType('menu')}}
   <footer class="footer">
    <div class="footermenu-wrapper">
        <section class="footermenu">
            <div class="handler" data-action="toggleClass" data-var="active" data-target=".footermenu"></div>
             <div class="contacts-info">
                <h3>Контактная информация</h3>
                <div class="left">
                    <table>
                        <tr>
                            <td class="key">Наименовение</td>
                            <td class="value">Общество с ограниченной ответственностью "РПТ Инфо"</td>
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
                            <td class="key">Электронная почта</td>
                            <td class="value"><a href="mailto:info@rptglobal.com">info@rptglobal.com</a></td>
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
            <div class="about hide">
                <h3>О проекте</h3>
                <jdoc:include type="modules" name="about" />
            </div>
            <div class="help hide">
                <h3>Помощь</h3>
                <jdoc:include type="modules" name="help" />
            </div>
            <div class="social">
                <h3>Мы в социальных сетях</h3>
                <a href="https://vk.com/rptinfo" target="_blank"><i class="fa fa-vk"></i></a>
                <a href="https://www.facebook.com/RPTdowlatow?fref=photo" target="_blank"><i class="fa fa-facebook"></i></a>
                <!-- <a href="http://twitter.com" target="_blank"><i class="fa fa-twitter"></i></a>
                <a href="http://plus.google.com" target="_blank"><i class="fa fa-google-plus"></i></a> -->
            </div>
            <div style="clear:both"></div>
        </section>
        <div style="clear:both"></div>
    </div>
    <section class="copyright">
        <jdoc:include type="modules" name="copyright" />
    </section>
</footer><!-- .footer -->
</div>
