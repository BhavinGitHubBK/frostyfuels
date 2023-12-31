<?php

namespace Botble\ACL\Notifications;

use Botble\Base\Facades\EmailHandler;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\HtmlString;

class ProjectNotification extends Notification
{
  
    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        EmailHandler::setModule('acl')
        ->setVariableValue('reset_link', route('access.password.reset', ['token' => "token"]));

    $template = 'password-reminder';
    $content = EmailHandler::prepareData(EmailHandler::getTemplateContent($template, 'core'));

    return (new MailMessage())
        ->view(['html' => new HtmlString($content)])
        ->subject(EmailHandler::getTemplateSubject($template));
    }
}
