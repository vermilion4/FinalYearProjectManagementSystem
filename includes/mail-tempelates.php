<?php
//require("../libs/sendgrid-php/sendgrid-php.php");
//require_once ("../includes/functions.php");


function mail_user_registration ($emailId,$name,$password){
    $sendgrid = new SendGrid(sendgridapi);
    $email = new SendGrid\Email();
    //Student Registration tempelate
    $templateId = 'dbe3b5ff-6a71-4a30-a48a-3de40358a4e5';

    $email
        ->addSmtpapiTo($emailId)
        ->setFrom('admin@fypms.com')
        ->setFromName('FYPMS Team')
        ->setSubject('%subject%')
        ->setHtml(' ')// <-- triggers the html version of the template
        ->setTemplateId($templateId)
        ->setSubstitutions(array(
            '%subject%' => array('Welcome to FYP Management System'),
            '%name%' => array($name),
            '%email%' => array($emailId),
            '%password%' => array($password),
        ));

    try {
        $res = $sendgrid->send($email);
        echo $res->getCode();
    } catch (\SendGrid\Exception $e) {
        echo $e->getCode();
        foreach ($e->getErrors() as $er) {
            echo $er;
            exit;
        }
    }



}


function mail_password_reset ($emailId,$password){

    $sendgrid = new SendGrid(sendgridapi);
    $email = new SendGrid\Email();

    //Password reset tempelate
    $templateId = 'c4a91dec-7b06-408d-84b7-08e0efddc94c';

    $email
        ->addSmtpapiTo($emailId)
        ->setFrom('admin@fypms.com')
        ->setFromName('FYPMS Team')
        ->setSubject('%subject%')
        ->setHtml(' ')// <-- triggers the html version of the template
        ->setTemplateId($templateId)
        ->setSubstitutions(array(
            '%subject%' => array('Password Reset - FYP Management System'),
            '%email%' => array($emailId),
            '%password%' => array($password),
        ));

    try {
        $res = $sendgrid->send($email);
        echo $res->getCode();
    } catch (\SendGrid\Exception $e) {
        echo $e->getCode();
        foreach ($e->getErrors() as $er) {
            echo $er;
            exit;
        }
    }

    return true;



}

