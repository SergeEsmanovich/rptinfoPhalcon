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
    
       private $leftMenu = array(
        
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
                'action' => 'index')
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

    public function getMenuType($type) {

        $where = array(
            "bind" => array('menutype' => $type)
        );

        $menu = Menu::find($where);

$social_article = SocialArticle::find();

        $headmenu;
        foreach ($menu as $k => $v) {
            $headmenu[$v->controllers->name] = array('caption' => $v->caption, 'action' => $v->action);
        }
        echo '<pre>';
        print_r($headmenu);
        echo '</pre>';
        /*
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
          echo '</div>'; */
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

}
