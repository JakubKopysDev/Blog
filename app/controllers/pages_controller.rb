class PagesController < ApplicationController

  def show
  end

  def download_pdf
    send_file(
        "#{Rails.root}/public/CV.pdf",
        filename: 'JakubKopyśCV.pdf',
        type: 'application/pdf',
        disposition: 'inline'
    )
  end

  def basic_download
    send_file(
        "#{Rails.root}/public/CV.pdf",
        filename: 'JakubKopyśCV.pdf',
        type: 'application/pdf'
    )
  end

end
