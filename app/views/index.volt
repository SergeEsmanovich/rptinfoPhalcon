<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        
        {{ javascript_include('js/jquery.min.js') }}
        {{ javascript_include('bootstrap/js/bootstrap.js') }}
        {{ javascript_include('js/utils.js') }}
        {{ javascript_include('js/less.min.js') }}
        
        
        {{ stylesheet_link('bootstrap/css/bootstrap_old.min.css') }}
        {{ stylesheet_link('bootstrap/css/bootstrap-responsive_old.min.css') }}
        {{ stylesheet_link('bootstrap/css/bootstrap.min.css') }}
        {{ stylesheet_link('bootstrap/css/bootstrap.min.css') }}
        {{ stylesheet_link('css/style.css') }}
        
        
        {{ stylesheet_link('css/styles.css') }}
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Your invoices">
        <meta name="author" content="Phalcon Team">
    </head>
    <body>
        {{ content() }}
       
    </body>
</html>