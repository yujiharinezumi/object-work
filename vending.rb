class  VendingMachine



  def initialize

    #投入金額
    @slot_money = 0

    #お釣りの金額
    # @change_money = 0

    #自動販売機の売り上げ金額
    @total_money = 0

    #払い戻し ------>> 一度も登場してないので再度コードを見直す
    @return_money = 0

    #飲み物の金額、個数を配列の中に入れる
    @drink = {cola: { price: 120,quantity: 5}, redbull: {price:200,quantity:5}, water:{price:100,quantity:5}}

    #在庫の数
    @stock = 0

  end

    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    #freeze メソッドでMoney以外の金額を入れさせない
    MONEY = [10, 50, 100, 500, 1000].freeze

    #自動販売機にお金が入れられるかどうか include?メソッドで確認する
    def check_money(money)
       MONEY.include?(money)
    end


    #自動販売機にお金を入れれて、かつ、お金の金額を追加できるようにするメソッド
  def slot_money(money)
    if check_money(money)
      @slot_money += money
    end
  end


      #投入したお金を使って飲み物を買う
  def purchase(name)

    #お金や在庫がなければプログラムを進めなくする
    # #buy_drinksで購入できる場合の条件分岐をしている
     return unless  buy_drinks(name)

     #お釣りの計算
     @slot_money -= @drink[name][:price]
     #自動販売機の売り上げの計算
     @total_money += @drink[name][:price]
     #購入時に飲み物の在庫を１個づつ減らす計算
     @drink[name][:quantity] -= 1
     # @stock =  @drink[name][:quantity].to_i
     # p @stock
  end

  # 在庫の数を確認するメソッド　zero_stockからcheck_stockにメソッド名変更しました。
  def check_stock(name)
    @drink[name][:quantity]
  end

    # お釣りを表示させる
  def count_money(name)
    #もし購入できる条件なら、投入金額を表示させる
    if buy_drinks(name)
        # 投入金額
      @slot_money
    else
      #
      0
    end
  end



  # 所持金で飲み物が購入できるか
  def judge_money(name)
    # しっかりと買いきれるため >=  を使ってあげる
    @slot_money >= ０@drink[name][:price]
  end
  # 在庫数が１個以上あるか
  def stock_drinks(name)
      @drink[name][:quantity] > 0
  end
  # 飲み物を買うお金があり、在庫もある
  def buy_drinks(name)
    judge_money(name) && stock_drinks(name)
  end



end

  # 飲み物を別のクラスで定義してあげて、金額や個数が変わった時に対応できるようにする。（金曜に）
#
# Class drink
#   def self.cola
#
#   end
#
#   def self.redbull
#
#   end
#
#   def self.water
#
#
#   end
#
#
# end
