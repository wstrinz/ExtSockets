class ChatController < ApplicationController
  include Tubesock::Hijack

  def index
  end

  def sendmsg
     hijack do |tubesock|
      tubesock.onopen do
        tubesock.send_data message: "Hello, friend"
      end

      tubesock.onmessage do |data|
        tubesock.send_data message: "You said: #{data[:message]}"
      end
    end
  end
end
