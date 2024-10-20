<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class userAdminNotifcation extends Notification
{
    use Queueable;
    public $user;
    public $status;
    public $msg;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($user,$status,$msg)
    {
        $this->user=$user;
        $this->status=$status;
        $this->msg=$msg;

    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        //return ['mail'];
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    // public function toMail($notifiable)
    // {
    //     return (new MailMessage)
    //                 ->line('The introduction to the notification.')
    //                 ->action('Notification Action', url('/'))
    //                 ->line('Thank you for using our application!');
    // }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'user_id'=>$this->user['id'],
            'name'=>$this->user['name'],
            'email'=>$this->user['email'],
            'status' => $this->status,
            'msg' => $this->msg,
        ];
    }
}
