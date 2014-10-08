<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        
        {{ javascript_include('js/jquery.min.js') }}
       
        {#{ javascript_include('js/utils.js') }#}
     
        
        {#Бутстрап 3#}
        {{ javascript_include('bootstrap/js/bootstrap.min.new.js') }}
        {{ stylesheet_link('bootstrap/css/bootstrap.min.css') }}
     
        
       
        {{ stylesheet_link('css/font-awesome.min.css') }}
        
        {#Грузим лесс#}
        {{ stylesheet_link(["href": "less/styles.less", "type": "text/css", "rel": "stylesheet/less"]) }}
        {{ javascript_include('js/less-1.7.5.min.js') }}
        <script>less.watch();</script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Your invoices">
        <meta name="author" content="Phalcon Team">
    </head>
    <body>
        {{ content() }}
       
    </body>
</html>