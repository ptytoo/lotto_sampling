1. controller : lotto
2. lotto#index : '/'
3. lotto#index : 버튼(로또번호추천)
4. lotto#show :로또번호추천
5. lotto#api : 로또 번호 가져와서 array에 넣는다
```
def api
    HTTParty.get()
    JSON.parse()
    배열에 넣어준다.
end
```

rails g controller lotto index show
index.erb : <form></from>
show.erb : 로또 번호 추천 결과 보여주기
lotto_controller.rb : 로또 번호 추천 로직 넣기
