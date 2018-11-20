module PostsHelper

  def otoconvert(num)
    str = num.to_s
    if str == '10'
      str.sub(/10/, '拾')
    else
      str.tr('0123456789', '零壱弐参四伍六七八九')
    end
  end

end
