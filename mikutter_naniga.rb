# -*- coding: utf-8 -*-

Plugin.create(:mikutter_naniga) do
  command(
          :mikutter_naniga,
          name: 'なにがじゃ！',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages.map{ |m|
      user_name = m.user.idname
      tmp_mesg = m.message[:message].gsub("@#{Service.primary.user.to_s} ", "")
      if (tmp_mesg.length > 126 - user_name.length)
        tmp_mesg = tmp_mesg[0..(126 - user_name.length - 1)] + "..."
      end
      mesg = "@#{user_name} な〜にが「#{tmp_mesg}」じゃ！"
      Service.primary.post(:message => mesg,
                           :replyto => m.message)
    }
  end
end
