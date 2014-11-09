<?php

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Phalcon\Mvc\User\Component {

    private $_headerMenu = array(
        'pull-left' => array(
            'index' => array(
                'caption' => 'Home',
                'action' => 'index'
            ),
            'invoices' => array(
                'caption' => 'Invoices',
                'action' => 'index'
            ),
            'about' => array(
                'caption' => 'About',
                'action' => 'index'
            ),
            'contact' => array(
                'caption' => 'Contact',
                'action' => 'index'
            ),
            'admin' => array(
                'caption' => 'Admin',
                'action' => 'index'),
            'socialarticle' => array(
                'caption' => 'Korol',
                'action' => 'index'),
            'test' => array(
                'caption' => 'Test',
                'action' => 'index'),
        ),
        'pull-right' => array(
            'session' => array(
                'caption' => 'Log In/Sign Up',
                'action' => 'index'
            ),
        )
    );
    private $_tabs = array(
        'Invoices' => array(
            'controller' => 'invoices',
            'action' => 'index',
            'any' => false
        ),
        'Companies' => array(
            'controller' => 'companies',
            'action' => 'index',
            'any' => true
        ),
        'Products' => array(
            'controller' => 'products',
            'action' => 'index',
            'any' => true
        ),
        'Product Types' => array(
            'controller' => 'producttypes',
            'action' => 'index',
            'any' => true
        ),
        'Your Profile' => array(
            'controller' => 'invoices',
            'action' => 'profile',
            'any' => false
        )
    );

    /**
     * Вывод меню из БД
     * @param type $alias string
     */
    public function getModulMenu($alias) {



        $where = array("alias = '$alias'");
        $modules = Modules::findFirst($where);
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        ?>
        <ul class="">
            <?php
            foreach ($modules->menu as $item) {
                if (($controllerName == $item->controllers->name) && ($item->action == $actionName)) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                ?>

                <?php
                echo Phalcon\Tag::linkTo($item->controllers->name . '/' . $item->action, $item->icon . ' ' . $item->caption);
                ?>

            </li>
        <?php }; ?>
        </ul>
        <?php
    }

    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu() {

        $auth = $this->session->get('auth');
        if ($auth) {
            $this->_headerMenu['pull-right']['session'] = array(
                'caption' => 'Log Out',
                'action' => 'end'
            );
        } else {
            unset($this->_headerMenu['pull-left']['invoices']);
        }

        echo '<div class="nav-collapse">';
        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<ul class="nav ', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo Phalcon\Tag::linkTo($controller . '/' . $option['action'], $option['caption']);
                echo '</li>';
            }
            echo '</ul>';
        }
        echo '</div>';
    }

    public function getTabs() {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'] . '/' . $option['action'], $caption), '<li>';
        }
        echo '</ul>';
    }

    public function getSlider() {
        ?>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <a href="http://quickpage.dowlatow.ru/wppage/rpt-3/" target="_blank"><img src="/templates/home/images/slider/01.jpg" /></a>

                </div>
                <div class="item">
                    <a href="http://www.rptinfo.ru/ak/ak_buy_goods.php?idg=3" target="_blank"><img src="/templates/home/images/slider/02.jpg" /></a>
                </div>
                <div class="item">
                    <a href="/trainings/2" target="_blank"><img src="/templates/home/images/slider/03.jpg" /></a>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
        <?php
    }

}
