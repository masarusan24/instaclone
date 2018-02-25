class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: contact.email, subject: "#{contact.name}さんからのお問い合わせ"
  end

  def create_picture_mail(picture)
    @picture = picture
    user = User.find(picture.user_id)
    mail to: user.email, subject: "#{user.name}さんの写真を投稿しました"
  end
end
