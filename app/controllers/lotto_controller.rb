class LottoController < ApplicationController
  def index
    
  end

  def show
    @lotto = [*1..45].sample(6)
  end
  
  def api
    require 'httparty'
    require 'json'
    
    url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
    response = HTTParty.get(url)
    result = JSON.parse(response.body)
    
    @lotto = [*1..45].sample(6)
     
    result.each do |key, value|
      arr << value if key.include? "drwtNo"
    end
    
    jackpot = arr.sort
    # api로 가져온 이번주 당첨 코드
    arr = [jackpot]
    # lotto 추첨된 숫자와 arr안에 담긴 숫자를 비교
    if @lotto == jackpot
       
    # 6개 1등 / 5개 2등 / 4개 3등 / 1개 6등
     
  end