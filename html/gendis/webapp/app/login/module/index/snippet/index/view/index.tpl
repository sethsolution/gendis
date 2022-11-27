{include file="index.css.tpl"}
<div class="login100-form-title logodiv" >

    <span class="login100-form-title-1">&nbsp;</span>
</div>

<form class="validate-form"  style="padding-bottom: 0px!important;">
    <div class="login100-form ">
        {*
        <div id="div_usuario" class="wrap-input100 validate-input m-b-26" data-validate="Empresa es requerido">
            <span class="label-input100"><Usuario>Empresa:</Usuario></span>
            <input class="input100" type="text" name="empresa" id="empresa" value="gwcmc" placeholder="Ingrese empresa (usuario)">
            <span class="focus-input100"></span>
        </div>
        *}
        <input class="input100" type="hidden" name="empresa" id="empresa" value="gwcmc" placeholder="Ingrese empresa (usuario)">

        <div id="div_usuario" class="wrap-input100 validate-input m-b-10" data-validate="Ingresa el usuario">
            <span class="label-input100"><Usuario>Usuario:</Usuario></span>
            <input class="input100" type="text" name="user" id="user" placeholder="Ingrese su usuario">
            <span class="focus-input100"></span>
        </div>

        <div id="div_pass" class="wrap-input100 validate-input m-b-10 " data-validate = "Ingrese su contraseña">
            <span class="label-input100">Contraseña:</span>
            <input class="input100" type="password" name="password" id="password" placeholder="Ingrese su contraseña">
            <span class="focus-input100"></span>
        </div>

        <div class="flex-sb-m w-full p-b-10 " >
            <div class="contact100-form-checkbox dis-none">
                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                <label class="label-checkbox100" for="ckb1">
                    Remember me
                </label>
            </div>

            {*
            <div id="div_olvido">
                <a href="/ingreso/recupera" class="txt1">Forgot your password??</a>
            </div>
    *}

            <div id="div_olvido">
            {*
                <a href="/web/restorepassword" class="txt1">¿Olvido su contraseña?</a>
                *}
            </div>
            <div id="div_registro">
                <a href="/web/singin" class="txt1">Registrar usuario</a>
            </div>

        </div>

    </div>
    <div class="sk-folding-cube dis-none" id="cargando">
        <div class="sk-cube1 sk-cube"></div>
        <div class="sk-cube2 sk-cube"></div>
        <div class="sk-cube4 sk-cube"></div>
        <div class="sk-cube3 sk-cube"></div>
    </div>
    <div class="error  dis-none m-b-19 w-full p-1  text-center lh-2-3" id="error"> El usuario o la contraseña son incorrectos</div>

    <div class="container-login100-form-btn " style="text-align: center!important;" id="bt_enviar">
        <button class="login100-form-btn " id="bt_ingresar">Entrar</button>
    </div>
</form>


<div  style="text-align: center;font-size: 10px; color: #7c7c7c; padding-top: 10px; ">
    <img src="/images/logo/peer.jpg" width="350"><br>
    El presente sistema ha sido desarrollado en colaboración entre la AETN,<br> Cooperación Alemana, GIZ, <br>
    Proyecto de Energías Renovables - PEERR II.
</div>

<div  style="text-align: center;font-size: 11px; color: #7c7c7c; padding-top: 2px; padding-bottom: 5px;">
2022-2023 <a href="http://www.mnhn.gob.bo" target="_blank" style="font-size: 11px;  ">© AETN</a> - <a href="http://www.seth.com.bo" target="_blank" style="font-size: 11px;  ">SETH Solution</a> | Uyuni v.0.1.0
<br>
</div>