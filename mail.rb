#   Mail via SMTP
#   version 1.0
#   author gamboltok

require "pony" #gem for mail
require "io/console" #gem for hidden console text noecho(&:gets)

count = 0
puts "Сколько писем отправить?"
count_message = gets
while count < count_message.to_i do
puts "Отправлено #{count +=1} из #{count_message}"
    my_mail = "bobo8888888@mail.ru"
    password = "your_password_email" #STDIN.noecho(&:gets).chomp #.noech(&:gets) метод скрывающий ввод пароля с консоли
    puts "куда отправляем письмо?"
    send_to = "berkut888888@gmail.com"
    body = "Хочешь зарабатывать больше?"
begin
    Pony.mail(
        {
            :subject => "Без темы",
            :body => body,
            :to => send_to,
            :from => my_mail,

            :via => :smtp,
            :via_options => {
                :address        => 'smtp.mail.ru',
                :port           => '465',
                :tls            => true,
                :user_name      => my_mail,
                :password       => password,
                :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
            } 
        }
    )
    puts "письмо отправлено"
rescue Net::SMTPAuthenticationError => error
    puts error
    
end
# sleep 1 #code is slipping before sending
end
