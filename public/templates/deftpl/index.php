<?php
//echo $_SERVER['DOCUMENT_ROOT'];
defined('_JEXEC') or die;

$app = JFactory::getApplication();
$document = &JFactory::getDocument();
//$document->addScript('http://code.jquery.com/jquery-latest.min.js');

$document->addScript("components/com_social/assets/js/jquery.session.js");
$document->addScript("components/com_social/assets/js/global.js");
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/bootstrap.min.js');
//$document->addStyleSheet($this->baseurl.'/templates/'.$this->template.'/css/docs.min.css');
$document->addStyleSheet($this->baseurl.'/templates/'.$this->template.'/scss/style.css');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/redactor.js');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/less.min.js');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/select2.min.js');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/jquery.mousewheel.min.js');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/responsive.js');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/navigation.js');
$document->addScript($this->baseurl.'/templates/'.$this->template.'/js/iepng.js');
$params = JComponentHelper::getParams( 'com_users' );

/*$user = JFactory::getUser();
JTable::addIncludePath(JPATH_COMPONENT.DS.'tables');
$profil = JTable::getInstance('profil', 'Table');
$profil->load(array('user_id' => $user->id));
$photo = json_decode($profil->foto)->foto;
//die(print_r($profil));*/

?>
<!DOCTYPE html>

<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
        <link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/bootstrap.css" rel="stylesheet">
        <link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/select2.css" rel="stylesheet">
        <link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/style.css" rel="stylesheet">
        <link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/font-awesome.min.css" rel="stylesheet">
        <link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/less/styles.less" rel="stylesheet/less">
       <link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/redactor.css" rel="stylesheet">
    
       
    <jdoc:include type="head" />
   
  
      <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
 
    <style>
        IMG.iePNG { filter:expression(fixPNG(this)); position: relative; } 
    </style>
    <link href='http://fonts.googleapis.com/css?family=Roboto&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
</head>

<body data-template="deftpl">
    <nav class="sidebar" id="sidebar" data-hide="false" data-savestate="true">
        <div class="fa fa-angle-left handler" style="position: absolute; top:10px; left:20px; font-size:3.4rem; cursor:pointer;color:#fff" data-action="toggleClass" data-var="active" data-target="nav.sidebar"></div>
        <jdoc:include type="modules" name="sidebar" style="none" />
        <ul class="logout">
            <li>
                <a href="<?php echo JRoute::_('index.php?option=com_social&task=logout'); ?>">Выйти из профиля</a>
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
            <form action="<?php echo JRoute::_('index.php?option=com_users&task=user.login'); ?>" method="post" name="login" id="form-login">
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
                        <a href="<?php echo JRoute::_('index.php?option=com_users&view=remind'); ?>">
                       Забыли пароль?</a>
                    </li>
                </ul>     
               
                 <input type="hidden" name="return" value="<?php echo base64_encode($params->get('login_redirect_url', '')); ?>" />
                <?php echo JHtml::_('form.token'); ?>
            </form>
        </div>
    </section>
    <div id="header">
        <?php
            $user = JFactory::getUser();
            if($user->guest){?>
                <a class="fa fa-home pull-left btn_header border_right" href="/index.php"></a>

            <?php }else{

                ?>
                <div class="fa fa-bars pull-left btn_header border_right handler" data-action="toggleClass" data-var="active" data-target="nav.sidebar"></div>

                <?php
            }
        ?>
        <jdoc:include type="modules" name="top_user" />
        <div class="logo"><a href=""><img src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/img/logo.png" alt=""></a></div>
    </div>
    <div class="clear"></div>
    <div class="wrapper">
        <div class="content-container">
        

        <div  class="row message-window" style="">    
            <jdoc:include type="message" />
        </div>

        <div class="row" style="height:100%" >

            <jdoc:include type="component" />
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
            <div class="about hide">
                <h3>О проекте</h3>
                <jdoc:include type="modules" name="about" />
            </div>
            <div class="help hide">
                <h3>Помощь</h3>
                <jdoc:include type="modules" name="help" />
            </div>
            
            <div style="clear:both"></div>
        </section>
        <div style="clear:both"></div>
    </div>
    <section class="copyright">
        <jdoc:include type="modules" name="copyright" />
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