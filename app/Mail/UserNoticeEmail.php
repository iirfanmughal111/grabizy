<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserNoticeEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($subject, $message,$order,$status)
    {
        $this->order=$order;
        $this->message=$message;
        $this->subject=$subject;
        $this->status=$status;



    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('email.orderEmail',['order'=>$this->order,'msg'=>$this->message,'status'=>$this->status,])->subject($this->subject);;
    }
}
