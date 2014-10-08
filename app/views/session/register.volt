
{{ content() }}

<div class="page-header">
    <h2>Register for INVO</h2>
</div>

{{ form('session/register', 'id': 'registerForm', 'class': 'form-horizontal', 'onbeforesubmit': 'return false') }}
<fieldset>
    <div class="control-group">
        <label class="control-label" for="name">Your Full Name</label>
        <div class="controls">
            {{ text_field('name', 'class': 'input-xlarge','required':'true') }}
            <p class="help-block">(required)</p>
            <div class="alert" id="name_alert">
                <strong>Warning!</strong> Please enter your full name
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="username">Username</label>
        <div class="controls">
            {{ text_field('username', 'class': 'input-xlarge') }}
            <p class="help-block">(required)</p>
            <div class="alert" id="username_alert">
                <strong>Warning!</strong> Please enter your desired user name
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="email">Email Address</label>
        <div class="controls">
            {{ text_field('email', 'class': 'input-xlarge') }}
            <p class="help-block">(required)</p>
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="password">Password</label>
        <div class="controls">
            {{ password_field('password', 'class': 'input-xlarge') }}
            <p class="help-block">(minimum 8 characters)</p>
            <div class="alert" id="password_alert">
                <strong>Warning!</strong> Please provide a valid password
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="repeatPassword">Repeat Password</label>
        <div class="controls">
            {{ password_field('repeatPassword', 'class': 'input-xlarge') }}
            <div class="alert" id="repeatPassword_alert">
                <strong>Warning!</strong> The password does not match
            </div>
        </div>
    </div>
    <div class="form-actions">
        {{ submit_button('Register', 'class': 'btn btn-primary btn-large') }}
        <p class="help-block">By signing up, you accept terms of use and privacy policy.</p>
    </div>
</fieldset>
</form>
<div class="wrapper messages-template">
        <div class="content-container">
<section class="registration-page">
    <nav class="head">
        <ul><li>
                <a class="fa fa-user awesome"></a> 
            </li>
            <li><a class="reg_title">Регистрация</a> </li>
        </ul>
    </nav>
    <section class="content scrolltarget scrollbar">
        {{ form('session/register', 'id': 'registerForm', 'class': 'form-horizontal tabs-panel', 'onbeforesubmit': 'return false') }}
        <div class="reg_control center">    

            <div class="btn-group" data-toggle="buttons">
                <label class="btn btn-primary tab active handler">
                    <input type="radio" name="premmision" value="15" id="premmision_1" checked=""> Участник
                </label>
                <label class="btn btn-primary tab">
                    <input type="radio" name="premmision" value="26" id="premmision_2"> Тренер
                </label>
            </div>

        </div>  
        <div class="text center row">

            <label class="active tab-content text-trainer  transp_text col-md-offset-3 col-md-6">Ваша деятельность в настоящий момент не связана с оказанием психологической помощи клиентам или вы имеете образование в другой сфере не связанной с психологией.</label>
            <label class="tab-content text-participiant transp_text col-md-offset-3 col-md-6">Вы имете все необходимые уровни для проведения семинаров/тренингов по РПТ и ваша деятельность связана с оказанием психологической помощи клиентам</label>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group reg_control">
                    <label class="col-md-offset-2 col-md-2" for="lastname">Фамилия</label>
                    <div class="col-md-7">
                        <input id="lastname"   class="form-control input-sm save" required name="lastname" type="text">
                    </div>
                </div>
                <div class="form-group reg_control">
                    <label class="col-md-2 col-md-offset-2" for="firstname">Имя</label>
                    <div class="col-md-7">
                        <input  id="firstname"  class="form-control input-sm save" required name="firstname" type="text">   
                    </div>

                </div>
                <div class="form-group reg_control">
                    <label class="col-md-offset-2 col-md-2" for="country">Страна</label>
                    <div class="col-md-7">
                        <select class="select2 select-country" id="country" name="country">
                            <option value="1">Россия</option>
                            <option value="2">Украина</option>
                            <option value="3">Беларусь</option>
                            <option value="4">Казахстан</option>
                        </select>
                    </div>
                </div>
                <div class="form-group reg_control">  
                    <label class="col-md-offset-2 col-md-2">Пол:</label>
                    <div class="btn-group col-md-7 " data-toggle="buttons">
                        <label class="btn btn-info ">
                            <input class="form-control input-sm " type="radio" name="gender" value="0" id="premmision_1"  ><i class="fa fa-female -o fa-lg"></i>
                        </label>
                        <label class="btn btn-info active">
                            <input class="form-control input-sm" type="radio" name="gender" value="1" id="premmision_2" checked=""><i class="fa fa-male -o fa-lg"></i>
                        </label>
                    </div>
                </div>

                <div class="form-group reg_control">
                    <label class="col-md-offset-2 col-md-2 save"  for="">Email</label>
                    <div class="controls col-md-7">
                        {{ text_field('email', 'class': 'input-xlarge') }}
                        <p class="help-block">(required)</p>
                        <div class="alert" id="email_alert">
                            <strong>Warning!</strong> Please enter your email
                        </div>
                    </div>
                </div>
                <div class="form-group reg_control">
                    <label class="col-md-offset-2 col-md-2" for="">Пароль</label>
                    <div class="controls col-md-7">
                        {{ password_field('password', 'class': 'input-xlarge') }}
                        <p class="help-block">(minimum 8 characters)</p>
                        <div class="alert" id="password_alert">
                            <strong>Warning!</strong> Please provide a valid password
                        </div>
                    </div>
                </div>
                <div class="form-group reg_control">
                    <label class="col-md-offset-2 col-md-2"  for="">Повторите пароль</label>
                    <div class="controls col-md-7">
                        {{ password_field('repeatPassword', 'class': 'input-xlarge') }}
                        <div class="alert" id="repeatPassword_alert">
                            <strong>Warning!</strong> The password does not match
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group reg_control">
                    <label class="col-md-2" for="">Отчество</label>
                    <div class="col-md-7">
                        <input class="form-control input-sm save" required name="thirdname" type="text">
                    </div>

                </div>

                <div class="form-group reg_control" style="margin-top:61px">
                    <label class="col-md-2" for="">Город</label>
                    <div class="col-md-7">
                        <input  class="form-control input-sm save" required  type="text" id="city">
                        <input type="hidden" name="city" class="save" id="city-id">

                    </div>  

                </div>
                <div class="form-group reg_control">
                    <label class="col-md-2" for="">Телефон:</label>
                    <div class="col-md-7">
                        <input id="tel" class="form-control input-sm save" required name="tel" type="text">
                    </div>
                </div>
                <div class="form-group reg_control">
                    <label class="col-md-2" for="">Капча:</label>
                    <div class="col-md-7">

                    </div>
                </div> 
            </div>
        </div>



        <div class="form-group reg_control">
            <lable class="transp_text col-md-offset-3 col-md-6">Чтобы продолжить регистрацию вы должны быть согластны с Условиями использования и правилами работы нашего ресурса</lable>
        </div>
        <div class="form-group reg_control center">
            <input type="checkbox"  required name="">Я согласен с Условиями и Правилами
        </div>    

        <input type="hidden" name="view" value="signup"> 
        <div class="form-group reg_control center">
            <button type="submit" class="btn btn-info">Зарегистрироваться</button>
        </div>

        </form>
    </section>  
</section>  
            </div>
    </div>