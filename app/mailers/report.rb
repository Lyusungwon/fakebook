class Report < ApplicationMailer
    def letter mail_from, mail_cc, mail_title, mail_content
        mail from: mail_from,
               to: "lyusungwon@gmail.com",
               cc: mail_cc,
          subject: mail_title,
             body: mail_content
    end
end
