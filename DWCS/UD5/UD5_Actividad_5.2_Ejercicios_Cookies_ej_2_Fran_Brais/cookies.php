<?php 

function setearCookies(array $POST_ARRAY){
    $cookieName = $POST_ARRAY['cookie_name'];
    $cookieValue = $POST_ARRAY['cookie_value'];
    $cookieTime = 0;
    if($POST_ARRAY['cookie_expiration']){
        $cookieTime = $POST_ARRAY['cookie_expiration'];
    }

    setCookie($cookieName, $cookieValue, $cookieTime!= 0 ? time() + $cookieTime : $cookieTime);
}