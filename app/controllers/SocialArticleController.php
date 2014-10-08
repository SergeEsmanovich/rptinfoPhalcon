<?php

class SocialArticleController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Статьи');
        parent::initialize();
    }

    public function indexAction()
    {
    }
}
