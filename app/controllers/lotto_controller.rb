class LottoController < ApplicationController
  def index
    
  end

  def show
    @lotto = [*1..45].sample(6)
  end
  
  def api
    #require 'httparty'
    require 'json'
    
    url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
    response = HTTParty.get(url)
    result = JSON.parse(response.body)
    
    @lotto = [*1..45].sample(6)
    bonus = result["bnusNo"]
    
    @arr = Array.new
    
    result.each do |key, value|
      @arr << value if key.include? "drwtNo"
    end
    
    @matching = @arr & @lotto
    @result = ""
    
    # lotto 추첨된 숫자와 arr안에 담긴 숫자를 비교
    if @matching.count == 6    #case @matching count when ....
      @result = "1등 15억"
    elsif @matching.count == 5 && @lotto.include?(bonus)#우리 추첨번호에 bonus가 포함되어 있나?
      @result = "2등 4천"
    elsif @matching.count == 4
      @result = "3등 120만원"
    elsif @matching.count == 3
      @result = "4등 50,000원"
    elsif @matching.count == 2
      @result = "3등 5,000원"  
    else
      @result = "꽝!"
    end
     
    # 6개 1등 / 5개 2등 / 4개 3등 / 1개 6등
     
  end
end